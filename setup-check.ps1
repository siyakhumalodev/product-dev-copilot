<#
Quick Setup Check for Windows

This script verifies prerequisites and can optionally install missing items.

Notes:
- Install steps are opt-in prompts unless you pass -AutoInstall.
- Some installs (notably Node.js) may require reopening your terminal to refresh PATH.
#>

[CmdletBinding()]
param(
    [switch]$NonInteractive,
    [switch]$AutoInstall,
    [ValidateSet('auto', 'winget', 'web')]
    [string]$NodeInstall = 'web'
)

function Test-Command {
    param([Parameter(Mandatory = $true)][string]$Name)
    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Ask-ToInstall {
    param(
        [Parameter(Mandatory = $true)][string]$Title,
        [string]$Hint
    )

    if ($AutoInstall) { return $true }
    if ($NonInteractive) { return $false }

    Write-Host ""
    Write-Host "Install missing item: $Title" -ForegroundColor Yellow
    if ($Hint) { Write-Host "  $Hint" -ForegroundColor Gray }
    $answer = Read-Host "Install now? (y/N)"
    return $answer -match '^(y|yes)$'
}

function ConvertTo-ExitCodeHex {
    param([Parameter(Mandatory = $true)][int]$ExitCode)
    $u = [uint32]([int64]$ExitCode + 0x100000000)
    return ('0x{0:X8}' -f $u)
}

function Get-WingetFailureHint {
    param([Parameter(Mandatory = $true)][int]$ExitCode)

    $hex = ConvertTo-ExitCodeHex -ExitCode $ExitCode
    switch ($hex) {
        '0x80070005' { return 'Access denied. Try running PowerShell as Administrator and re-run.' }
        '0x80070422' { return 'A required service is disabled. Check Windows Update/App Installer services.' }
        '0x8A15002B' { return 'Winget/App Installer issue. Try updating "App Installer" from Microsoft Store, then run: winget source reset --force; winget source update' }
        default { return 'Try: winget --info; winget source reset --force; winget source update. If this is a managed device, your org may block winget installs.' }
    }
}

function Install-WithWinget {
    param(
        [Parameter(Mandatory = $true)][string]$Id,
        [Parameter(Mandatory = $true)][string]$DisplayName
    )

    if (-not (Test-Command "winget")) {
        Write-Host "  [X] winget not found; cannot auto-install $DisplayName" -ForegroundColor Red
        Write-Host "      Install from Microsoft Store: App Installer" -ForegroundColor Gray
        return $false
    }

    Write-Host "  Installing $DisplayName via winget..." -ForegroundColor Yellow
    & winget install --id $Id -e --source winget --accept-package-agreements --accept-source-agreements
    $exit = $LASTEXITCODE
    if ($exit -ne 0) {
        $hex = ConvertTo-ExitCodeHex -ExitCode $exit
        $hint = Get-WingetFailureHint -ExitCode $exit
        Write-Host "  [X] winget failed for $DisplayName (exit $exit / $hex)" -ForegroundColor Red
        Write-Host "      $hint" -ForegroundColor Gray
        return $false
    }

    Write-Host "  [OK] winget install completed for $DisplayName" -ForegroundColor Green
    return $true
}

function Enable-Tls12 {
    try {
        # Windows PowerShell 5.1 sometimes defaults to older TLS.
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    } catch {
        # best effort
    }
}

function Get-NodeMsiUrl {
    param(
        [ValidateSet('lts', 'current')]
        [string]$Channel = 'lts'
    )

    Enable-Tls12
    $indexUrl = 'https://nodejs.org/dist/index.json'
    $index = Invoke-RestMethod -Uri $indexUrl -UseBasicParsing
    if (-not $index) { throw "Failed to download Node.js index from $indexUrl" }

    if ($Channel -eq 'lts') {
        $entry = $index | Where-Object { $null -ne $_.lts -and $_.lts -ne $false } | Select-Object -First 1
    } else {
        $entry = $index | Select-Object -First 1
    }

    if (-not $entry) { throw "Failed to find a Node.js $Channel entry in index.json" }

    $version = $entry.version
    if (-not $version) { throw "Node.js index entry missing version" }

    $arch = if ([Environment]::Is64BitOperatingSystem) { 'x64' } else { 'x86' }
    $msiName = "node-$version-$arch.msi"
    return "https://nodejs.org/dist/$version/$msiName"
}

function Install-NodeFromWeb {
    param(
        [ValidateSet('lts', 'current')]
        [string]$Channel = 'lts'
    )

    try {
        $url = Get-NodeMsiUrl -Channel $Channel
    } catch {
        Write-Host "  [X] Could not determine Node.js download URL: $_" -ForegroundColor Red
        return $false
    }

    $fileName = Split-Path -Leaf $url
    $tempPath = Join-Path $env:TEMP $fileName

    Write-Host "  Downloading Node.js ($Channel) from nodejs.org..." -ForegroundColor Yellow
    Write-Host "      $url" -ForegroundColor Gray

    try {
        Enable-Tls12
        Invoke-WebRequest -Uri $url -OutFile $tempPath -UseBasicParsing
    } catch {
        Write-Host "  [X] Download failed: $_" -ForegroundColor Red
        return $false
    }

    if (-not (Test-Path $tempPath)) {
        Write-Host "  [X] Download did not produce file: $tempPath" -ForegroundColor Red
        return $false
    }

    Write-Host "  Installing Node.js via msiexec..." -ForegroundColor Yellow
    # Note: MSI typically installs machine-wide; may require admin rights.
    $arguments = "/i `"$tempPath`" /qn /norestart"
    $p = Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -PassThru

    if ($p.ExitCode -ne 0) {
        Write-Host "  [X] msiexec failed (exit $($p.ExitCode))." -ForegroundColor Red
        Write-Host "      Tip: re-run PowerShell as Administrator and try again." -ForegroundColor Gray
        return $false
    }

    Write-Host "  [OK] Node.js install completed." -ForegroundColor Green
    return $true
}

function Get-FirstLine {
    param([string[]]$Lines)
    if ($null -eq $Lines) { return $null }
    return ($Lines | Select-Object -First 1)
}

function Add-ToPathIfMissing {
    param([Parameter(Mandatory = $true)][string]$Dir)
    if (-not (Test-Path $Dir)) { return $false }

    $pathParts = $env:Path -split ';'
    if ($pathParts -contains $Dir) { return $true }

    $env:Path = "$Dir;$env:Path"
    return $true
}

function Ensure-NodeOnPath {
    # Helps when Node was installed after this terminal started.
    $candidates = @(
        (Join-Path $env:ProgramFiles 'nodejs'),
        (Join-Path ${env:ProgramFiles(x86)} 'nodejs'),
        (Join-Path $env:LOCALAPPDATA 'Programs\nodejs')
    ) | Where-Object { $_ -and $_ -ne '' }

    foreach ($dir in $candidates) {
        $nodeExe = Join-Path $dir 'node.exe'
        if (Test-Path $nodeExe) {
            Add-ToPathIfMissing -Dir $dir | Out-Null
            return $true
        }
    }

    return $false
}

function Check-Node {
    try { return (node --version 2>$null) } catch {
        Ensure-NodeOnPath | Out-Null
        try { return (node --version 2>$null) } catch { return $null }
    }
}

function Check-Npm {
    try { return (npm --version 2>$null) } catch {
        Ensure-NodeOnPath | Out-Null
        try { return (npm --version 2>$null) } catch { return $null }
    }
}

function Check-Code {
    try { return (Get-FirstLine (code --version 2>$null)) } catch { return $null }
}

function Check-MarpExtension {
    try {
        if (-not (Test-Command "code")) { return $false }
        $marpExt = code --list-extensions 2>$null | Select-String "marp-team.marp-vscode"
        return $null -ne $marpExt
    } catch {
        return $false
    }
}

function Check-MarpCli {
    try {
        $marpVersion = marp --version 2>$null
        return $null -ne $marpVersion
    } catch {
        return $false
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Product Dev Copilot - Setup Verification" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# If Node.js was installed after this terminal opened, refresh PATH for this process.
Ensure-NodeOnPath | Out-Null

$didAttemptInstall = $false

function Run-Checks {
    $script:allGood = $true
    $script:nodeVersion = $null
    $script:npmVersion = $null
    $script:codeVersion = $null
    $script:hasMarpExt = $false
    $script:hasMarpCli = $false

    # Check Node.js
    Write-Host "Checking Node.js..." -ForegroundColor Yellow
    $script:nodeVersion = Check-Node
    if ($script:nodeVersion) {
        Write-Host "  [OK] Node.js installed: $script:nodeVersion" -ForegroundColor Green
    } else {
        Write-Host "  [X] Node.js not found" -ForegroundColor Red
        Write-Host "      Install from: https://nodejs.org/" -ForegroundColor Gray
        $script:allGood = $false
    }

    # Check npm
    Write-Host "`nChecking npm..." -ForegroundColor Yellow
    $script:npmVersion = Check-Npm
    if ($script:npmVersion) {
        Write-Host "  [OK] npm installed: $script:npmVersion" -ForegroundColor Green
    } else {
        Write-Host "  [X] npm not found (usually comes with Node.js)" -ForegroundColor Red
        $script:allGood = $false
    }

    # Check VS Code
    Write-Host "`nChecking VS Code..." -ForegroundColor Yellow
    $script:codeVersion = Check-Code
    if ($script:codeVersion) {
        Write-Host "  [OK] VS Code installed: $script:codeVersion" -ForegroundColor Green
    } else {
        Write-Host "  [X] VS Code command not found" -ForegroundColor Red
        Write-Host "      Install from: https://code.visualstudio.com/" -ForegroundColor Gray
        Write-Host "      Or add VS Code to PATH during installation" -ForegroundColor Gray
        $script:allGood = $false
    }

    # Check Marp VS Code Extension
    Write-Host "`nChecking Marp for VS Code extension..." -ForegroundColor Yellow
    $script:hasMarpExt = Check-MarpExtension
    if ($script:hasMarpExt) {
        Write-Host "  [OK] Marp for VS Code extension installed" -ForegroundColor Green
    } else {
        Write-Host "  [i] Marp for VS Code extension not installed" -ForegroundColor Yellow
        Write-Host "      Run: code --install-extension marp-team.marp-vscode" -ForegroundColor Gray
    }

    # Check Marp CLI (optional)
    Write-Host "`nChecking Marp CLI (optional)..." -ForegroundColor Yellow
    $script:hasMarpCli = Check-MarpCli
    if ($script:hasMarpCli) {
        Write-Host "  [OK] Marp CLI installed" -ForegroundColor Green
    } else {
        Write-Host "  [i] Marp CLI not installed (optional)" -ForegroundColor Yellow
        Write-Host "      To install: npm install -g @marp-team/marp-cli" -ForegroundColor Gray
    }
}

Run-Checks

if ($NonInteractive -and -not $AutoInstall) {
    Write-Host "" 
    Write-Host "Note: running with -NonInteractive disables install prompts." -ForegroundColor Gray
    Write-Host "  To be prompted, re-run without -NonInteractive." -ForegroundColor Gray
    Write-Host "  To auto-install (no prompts), run with -AutoInstall." -ForegroundColor Gray
}

# Offer installs for missing items
if ($AutoInstall -or -not $NonInteractive) {
    if (-not $nodeVersion) {
        $nodeHint = "Methods: winget (OpenJS.NodeJS.LTS) or web download (nodejs.org MSI). Current setting: $NodeInstall"
        if (Ask-ToInstall -Title "Node.js (includes npm)" -Hint $nodeHint) {
            $didAttemptInstall = $true
            $installed = $false

            if ($NodeInstall -eq 'winget') {
                $installed = Install-WithWinget -Id "OpenJS.NodeJS.LTS" -DisplayName "Node.js LTS"
            } elseif ($NodeInstall -eq 'web') {
                $installed = Install-NodeFromWeb -Channel 'lts'
            } else {
                # auto
                if (Test-Command "winget") {
                    $installed = Install-WithWinget -Id "OpenJS.NodeJS.LTS" -DisplayName "Node.js LTS"
                    if (-not $installed) {
                        if (Ask-ToInstall -Title "Fallback: install Node.js via direct download" -Hint "Downloads official MSI from nodejs.org and installs with msiexec.") {
                            $installed = Install-NodeFromWeb -Channel 'lts'
                        }
                    }
                } else {
                    $installed = Install-NodeFromWeb -Channel 'lts'
                }
            }

            if ($installed) {
                Write-Host "  Note: you may need to reopen PowerShell for PATH to update." -ForegroundColor Gray
            } else {
                Write-Host "  Manual option: install Node.js LTS from https://nodejs.org/" -ForegroundColor Gray
            }
        }
    }

    if (-not $codeVersion) {
        if (Ask-ToInstall -Title "Visual Studio Code" -Hint "Uses winget id: Microsoft.VisualStudioCode") {
            $didAttemptInstall = $true
            Install-WithWinget -Id "Microsoft.VisualStudioCode" -DisplayName "Visual Studio Code" | Out-Null
            Write-Host "  Note: ensure 'code' is on PATH (Shell Command: Install 'code' command)." -ForegroundColor Gray
        }
    }

    if (-not $hasMarpExt) {
        if (Ask-ToInstall -Title "Marp for VS Code extension" -Hint "Runs: code --install-extension marp-team.marp-vscode") {
            if (Test-Command "code") {
                $didAttemptInstall = $true
                & code --install-extension marp-team.marp-vscode | Out-Null
            } else {
                Write-Host "  [X] Cannot install extension: 'code' command not found." -ForegroundColor Red
            }
        }
    }

    if (-not $hasMarpCli) {
        if (Test-Command "npm") {
            if (Ask-ToInstall -Title "Marp CLI (optional)" -Hint "Runs: npm install -g @marp-team/marp-cli") {
                $didAttemptInstall = $true
                & npm install -g @marp-team/marp-cli
            }
        } else {
            Write-Host "`nSkipping Marp CLI install prompt: npm not found (install Node.js first)." -ForegroundColor Gray
        }
    }
}

if ($didAttemptInstall) {
    Write-Host "`nRe-checking after install attempts..." -ForegroundColor Cyan
    Run-Checks
}

# Test slide generation
Write-Host "`nTesting slide generation script..." -ForegroundColor Yellow
$scriptPath = Join-Path $PSScriptRoot "personas\scripts\generate-slides.js"
if (Test-Path $scriptPath) {
    Write-Host "  [OK] generate-slides.js found" -ForegroundColor Green

    if (-not (Test-Command "node")) {
        Write-Host "  [X] Cannot run slide generator: node not found" -ForegroundColor Red
        $allGood = $false
    } else {
        try {
            Push-Location (Join-Path $PSScriptRoot "personas")
            $null = node scripts/generate-slides.js list 2>&1
            Pop-Location
            Write-Host "  [OK] Script executes successfully" -ForegroundColor Green
        } catch {
            Write-Host "  [X] Error running script: $_" -ForegroundColor Red
            $allGood = $false
        }
    }
} else {
    Write-Host "  [X] generate-slides.js not found at expected location" -ForegroundColor Red
    $allGood = $false
}

# Summary
Write-Host "`n========================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "[OK] All required prerequisites are installed!" -ForegroundColor Green
} else {
    Write-Host "[!] Some prerequisites are missing" -ForegroundColor Yellow
    Write-Host "`nInstall missing items and run this script again." -ForegroundColor Yellow
    Write-Host "`nSee PREREQUISITES.md for detailed installation instructions." -ForegroundColor Cyan
}
Write-Host "" 

