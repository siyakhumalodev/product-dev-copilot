# Prerequisites & Setup

This repository requires the following tools to generate and view persona slide decks.

## Prerequisites

### 1. Node.js

The slide generation script requires Node.js to run.

**Required Version:** Node.js 14.x or higher (tested with v22.21.0)

#### Installation

**Windows:**
- Download from [nodejs.org](https://nodejs.org/)
- Run the installer (`.msi` file)
- Verify installation: Open PowerShell or Command Prompt and run:
  ```powershell
  node --version
  ```

**macOS:**
- Using Homebrew:
  ```bash
  brew install node
  ```
- Or download from [nodejs.org](https://nodejs.org/)

**Linux:**
- Ubuntu/Debian:
  ```bash
  sudo apt update
  sudo apt install nodejs npm
  ```
- Or use [nvm (Node Version Manager)](https://github.com/nvm-sh/nvm)

### 2. Marp for VS Code Extension

To view and export the generated Marp presentations, you need the Marp extension.

**Extension ID:** `marp-team.marp-vscode`

#### Installation

**Automatic (Recommended):**

When you open this repository in VS Code, you'll be prompted to install recommended extensions. Click "Install" when prompted.

**Manual:**

1. Open VS Code
2. Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (macOS) to open Extensions
3. Search for "Marp for VS Code"
4. Click "Install" on the extension by Marp Team

**Command Line:**
```bash
code --install-extension marp-team.marp-vscode
```

### 3. Marp CLI (Optional)

For command-line exports to PDF, PowerPoint, or HTML without opening VS Code.

#### Installation

**Using npm (all platforms):**
```bash
npm install -g @marp-team/marp-cli
```

**Verify installation:**
```bash
marp --version
```

## Quick Setup Verification

### Automated Setup Check

Run the provided setup check script to verify all prerequisites:

**Windows (PowerShell):**
```powershell
.\setup-check.ps1
```

**macOS/Linux (Bash):**
```bash
./setup-check.sh
```

These scripts will check for Node.js, npm, VS Code, Marp extension, and test the slide generation script.

### Manual Verification

Run this script to verify all prerequisites are installed:

**Windows (PowerShell):**
```powershell
Write-Host "Checking Node.js..." -ForegroundColor Cyan
node --version
if ($LASTEXITCODE -eq 0) { Write-Host "✓ Node.js installed" -ForegroundColor Green } else { Write-Host "✗ Node.js not found" -ForegroundColor Red }

Write-Host "`nChecking npm..." -ForegroundColor Cyan
npm --version
if ($LASTEXITCODE -eq 0) { Write-Host "✓ npm installed" -ForegroundColor Green } else { Write-Host "✗ npm not found" -ForegroundColor Red }

Write-Host "`nChecking Marp CLI (optional)..." -ForegroundColor Cyan
marp --version
if ($LASTEXITCODE -eq 0) { Write-Host "✓ Marp CLI installed" -ForegroundColor Green } else { Write-Host "○ Marp CLI not installed (optional)" -ForegroundColor Yellow }

Write-Host "`nChecking VS Code extensions..." -ForegroundColor Cyan
code --list-extensions | Select-String "marp-team.marp-vscode"
if ($LASTEXITCODE -eq 0) { Write-Host "✓ Marp for VS Code installed" -ForegroundColor Green } else { Write-Host "○ Marp for VS Code not installed - run: code --install-extension marp-team.marp-vscode" -ForegroundColor Yellow }
```

**macOS/Linux (Bash):**
```bash
#!/bin/bash
echo -e "\033[36mChecking Node.js...\033[0m"
if command -v node &> /dev/null; then
    echo -e "\033[32m✓ Node.js installed:\033[0m $(node --version)"
else
    echo -e "\033[31m✗ Node.js not found\033[0m"
fi

echo -e "\n\033[36mChecking npm...\033[0m"
if command -v npm &> /dev/null; then
    echo -e "\033[32m✓ npm installed:\033[0m $(npm --version)"
else
    echo -e "\033[31m✗ npm not found\033[0m"
fi

echo -e "\n\033[36mChecking Marp CLI (optional)...\033[0m"
if command -v marp &> /dev/null; then
    echo -e "\033[32m✓ Marp CLI installed:\033[0m $(marp --version)"
else
    echo -e "\033[33m○ Marp CLI not installed (optional)\033[0m"
fi

echo -e "\n\033[36mChecking VS Code extensions...\033[0m"
if code --list-extensions | grep -q "marp-team.marp-vscode"; then
    echo -e "\033[32m✓ Marp for VS Code installed\033[0m"
else
    echo -e "\033[33m○ Marp for VS Code not installed - run: code --install-extension marp-team.marp-vscode\033[0m"
fi
```

## Usage After Setup

### Generate Slides

```bash
cd personas
node scripts/generate-slides.js combined
```

### View Slides in VS Code

1. Open `personas/generated/personas-deck.md` in VS Code
2. Click the "Open Preview to the Side" button (top right)
3. Or press `Ctrl+K V` (Windows/Linux) or `Cmd+K V` (macOS)

### Export Slides

**Using VS Code:**
1. Open the Marp preview
2. Click the Marp icon in the toolbar
3. Select export format (PDF, PowerPoint, HTML, PNG)

**Using Marp CLI:**
```bash
# PDF
marp personas/generated/personas-deck.md --pdf -o output.pdf

# PowerPoint
marp personas/generated/personas-deck.md --pptx -o output.pptx

# HTML
marp personas/generated/personas-deck.md --html -o output.html
```

## Troubleshooting

### "node is not recognized" (Windows)

- Node.js is not in your PATH
- Restart your terminal/VS Code after installing Node.js
- Or add Node.js installation directory to PATH manually

### "Permission denied" when installing npm packages globally

**Windows:**
- Run PowerShell or Command Prompt as Administrator

**macOS/Linux:**
- Use `sudo npm install -g @marp-team/marp-cli`
- Or configure npm to use a different directory for global packages

### Marp extension not working

- Ensure the file has `.md` extension
- Check that the file contains `---\nmarp: true\n---` at the top
- Restart VS Code
- Check VS Code Output panel (View → Output → Marp) for errors

### Script fails to find JSON files

- Ensure JSON files are in `personas/data/` directory
- Check file names match the expected pattern (lowercase-with-dashes.json)
- Verify JSON files are valid (use a JSON validator)

## Support

For issues specific to:
- **Node.js:** See [nodejs.org/docs](https://nodejs.org/docs)
- **Marp:** See [marp.app](https://marp.app) or [GitHub](https://github.com/marp-team/marp)
- **This repository:** Open an issue in the GitHub repository
