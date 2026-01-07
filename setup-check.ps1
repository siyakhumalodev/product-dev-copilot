# Quick Setup Check for Windows
# Run this in PowerShell to verify all prerequisites are installed

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Product Dev Copilot - Setup Verification" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$allGood = $true

# Check Node.js
Write-Host "Checking Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version 2>$null
    if ($nodeVersion) {
        Write-Host "  ✓ Node.js installed: $nodeVersion" -ForegroundColor Green
    } else {
        throw "Not found"
    }
} catch {
    Write-Host "  ✗ Node.js not found" -ForegroundColor Red
    Write-Host "    Install from: https://nodejs.org/" -ForegroundColor Gray
    $allGood = $false
}

# Check npm
Write-Host "`nChecking npm..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version 2>$null
    if ($npmVersion) {
        Write-Host "  ✓ npm installed: $npmVersion" -ForegroundColor Green
    } else {
        throw "Not found"
    }
} catch {
    Write-Host "  ✗ npm not found (should come with Node.js)" -ForegroundColor Red
    $allGood = $false
}

# Check VS Code
Write-Host "`nChecking VS Code..." -ForegroundColor Yellow
try {
    $codeVersion = code --version 2>$null | Select-Object -First 1
    if ($codeVersion) {
        Write-Host "  ✓ VS Code installed: $codeVersion" -ForegroundColor Green
    } else {
        throw "Not found"
    }
} catch {
    Write-Host "  ✗ VS Code command not found" -ForegroundColor Red
    Write-Host "    Install from: https://code.visualstudio.com/" -ForegroundColor Gray
    Write-Host "    Or add VS Code to PATH during installation" -ForegroundColor Gray
    $allGood = $false
}

# Check Marp VS Code Extension
Write-Host "`nChecking Marp for VS Code extension..." -ForegroundColor Yellow
try {
    $marpExt = code --list-extensions 2>$null | Select-String "marp-team.marp-vscode"
    if ($marpExt) {
        Write-Host "  ✓ Marp for VS Code extension installed" -ForegroundColor Green
    } else {
        throw "Not found"
    }
} catch {
    Write-Host "  ○ Marp for VS Code extension not installed" -ForegroundColor Yellow
    Write-Host "    Run: code --install-extension marp-team.marp-vscode" -ForegroundColor Gray
    Write-Host "    Or it will be suggested when you open this workspace" -ForegroundColor Gray
}

# Check Marp CLI (optional)
Write-Host "`nChecking Marp CLI (optional)..." -ForegroundColor Yellow
try {
    $marpVersion = marp --version 2>$null
    if ($marpVersion) {
        Write-Host "  ✓ Marp CLI installed: $marpVersion" -ForegroundColor Green
    } else {
        throw "Not found"
    }
} catch {
    Write-Host "  ○ Marp CLI not installed (optional)" -ForegroundColor Yellow
    Write-Host "    To install: npm install -g @marp-team/marp-cli" -ForegroundColor Gray
}

# Test slide generation
Write-Host "`nTesting slide generation script..." -ForegroundColor Yellow
$scriptPath = Join-Path $PSScriptRoot "personas\scripts\generate-slides.js"
if (Test-Path $scriptPath) {
    Write-Host "  ✓ generate-slides.js found" -ForegroundColor Green
    
    # Check if we can run it
    try {
        Push-Location (Join-Path $PSScriptRoot "personas")
        $testOutput = node scripts/generate-slides.js list 2>&1
        Pop-Location
        Write-Host "  ✓ Script executes successfully" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ Error running script: $_" -ForegroundColor Red
        $allGood = $false
    }
} else {
    Write-Host "  ✗ generate-slides.js not found at expected location" -ForegroundColor Red
    $allGood = $false
}

# Summary
Write-Host "`n========================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "✓ All required prerequisites are installed!" -ForegroundColor Green
    Write-Host "`nYou're ready to generate persona slides." -ForegroundColor Green
    Write-Host "`nNext steps:" -ForegroundColor Cyan
    Write-Host "  1. Generate personas using M365 Copilot" -ForegroundColor Gray
    Write-Host "  2. Use the unified prompt: .github/prompts/generate_persona_slides_from_report.prompt.md" -ForegroundColor Gray
    Write-Host "  3. View slides: Open personas/generated/personas-deck.md in VS Code" -ForegroundColor Gray
} else {
    Write-Host "⚠ Some prerequisites are missing" -ForegroundColor Yellow
    Write-Host "`nPlease install missing items and run this script again." -ForegroundColor Yellow
    Write-Host "`nSee PREREQUISITES.md for detailed installation instructions." -ForegroundColor Cyan
}
Write-Host "========================================`n" -ForegroundColor Cyan
