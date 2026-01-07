#!/bin/bash
# Quick Setup Check for macOS/Linux
# Run this script to verify all prerequisites are installed

echo -e "\n\033[36m========================================"
echo "Product Dev Copilot - Setup Verification"
echo -e "========================================\033[0m\n"

all_good=true

# Check Node.js
echo -e "\033[33mChecking Node.js...\033[0m"
if command -v node &> /dev/null; then
    node_version=$(node --version)
    echo -e "  \033[32m✓ Node.js installed: $node_version\033[0m"
else
    echo -e "  \033[31m✗ Node.js not found\033[0m"
    echo -e "    \033[90mInstall from: https://nodejs.org/\033[0m"
    echo -e "    \033[90mOr use: brew install node (macOS)\033[0m"
    all_good=false
fi

# Check npm
echo -e "\n\033[33mChecking npm...\033[0m"
if command -v npm &> /dev/null; then
    npm_version=$(npm --version)
    echo -e "  \033[32m✓ npm installed: $npm_version\033[0m"
else
    echo -e "  \033[31m✗ npm not found (should come with Node.js)\033[0m"
    all_good=false
fi

# Check VS Code
echo -e "\n\033[33mChecking VS Code...\033[0m"
if command -v code &> /dev/null; then
    code_version=$(code --version | head -n 1)
    echo -e "  \033[32m✓ VS Code installed: $code_version\033[0m"
else
    echo -e "  \033[31m✗ VS Code command not found\033[0m"
    echo -e "    \033[90mInstall from: https://code.visualstudio.com/\033[0m"
    echo -e "    \033[90mOr add VS Code to PATH: Cmd+Shift+P > 'Shell Command: Install code'\033[0m"
    all_good=false
fi

# Check Marp VS Code Extension
echo -e "\n\033[33mChecking Marp for VS Code extension...\033[0m"
if code --list-extensions 2>/dev/null | grep -q "marp-team.marp-vscode"; then
    echo -e "  \033[32m✓ Marp for VS Code extension installed\033[0m"
else
    echo -e "  \033[33m○ Marp for VS Code extension not installed\033[0m"
    echo -e "    \033[90mRun: code --install-extension marp-team.marp-vscode\033[0m"
    echo -e "    \033[90mOr it will be suggested when you open this workspace\033[0m"
fi

# Check Marp CLI (optional)
echo -e "\n\033[33mChecking Marp CLI (optional)...\033[0m"
if command -v marp &> /dev/null; then
    marp_version=$(marp --version)
    echo -e "  \033[32m✓ Marp CLI installed: $marp_version\033[0m"
else
    echo -e "  \033[33m○ Marp CLI not installed (optional)\033[0m"
    echo -e "    \033[90mTo install: npm install -g @marp-team/marp-cli\033[0m"
fi

# Test slide generation
echo -e "\n\033[33mTesting slide generation script...\033[0m"
script_path="$(dirname "$0")/personas/scripts/generate-slides.js"
if [ -f "$script_path" ]; then
    echo -e "  \033[32m✓ generate-slides.js found\033[0m"
    
    # Check if we can run it
    cd "$(dirname "$0")/personas" 2>/dev/null
    if node scripts/generate-slides.js list &> /dev/null; then
        echo -e "  \033[32m✓ Script executes successfully\033[0m"
    else
        echo -e "  \033[31m✗ Error running script\033[0m"
        all_good=false
    fi
    cd - > /dev/null
else
    echo -e "  \033[31m✗ generate-slides.js not found at expected location\033[0m"
    all_good=false
fi

# Summary
echo -e "\n\033[36m========================================\033[0m"
if [ "$all_good" = true ]; then
    echo -e "\033[32m✓ All required prerequisites are installed!\033[0m"
    echo -e "\n\033[32mYou're ready to generate persona slides.\033[0m"
    echo -e "\n\033[36mNext steps:\033[0m"
    echo -e "  \033[90m1. Generate personas using M365 Copilot\033[0m"
    echo -e "  \033[90m2. Use the unified prompt: .github/prompts/generate_persona_slides_from_report.prompt.md\033[0m"
    echo -e "  \033[90m3. View slides: Open personas/generated/personas-deck.md in VS Code\033[0m"
else
    echo -e "\033[33m⚠ Some prerequisites are missing\033[0m"
    echo -e "\n\033[33mPlease install missing items and run this script again.\033[0m"
    echo -e "\n\033[36mSee PREREQUISITES.md for detailed installation instructions.\033[0m"
fi
echo -e "\033[36m========================================\033[0m\n"
