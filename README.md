# product-dev-copilot

A toolkit for generating comprehensive user personas for NHS systems and initiatives.

## Prerequisites

Before using this toolkit, ensure you have the required software installed:

- **Node.js** (v14.x or higher) - Required to run the slide generation script
- **Marp for VS Code extension** - Required to view and export presentations
- **Marp CLI** (optional) - For command-line exports

**📋 See [PREREQUISITES.md](PREREQUISITES.md) for detailed installation instructions for all platforms including Windows.**

**🔍 Quick Check:** Run the setup verification script for your platform:
- Windows: `.\setup-check.ps1` (PowerShell)
- macOS/Linux: `./setup-check.sh` (Bash)

When you first open this repository in VS Code, you'll be prompted to install the recommended Marp extension automatically.

## How to Use

### Step 1: Generate Scenario & Problem Statement

Use the GitHub Copilot prompt to formalize your scenario:

1. Open `.github/prompts/generate_scenario_and_problem_statement.prompt.md` in VS Code
2. Invoke the prompt (using Copilot chat or prompt picker)
3. Provide your rough scenario description when prompted
4. Copilot will generate a formalized **Scenario Overview** and **Problem Statement**
5. Copy the generated output

### Step 2: Generate Personas with M365 Copilot Researcher

Use M365 Copilot with the researcher prompt:

1. Open `persona-generation-prompt.md`
2. Copy the entire prompt section (from "PROMPT FOR M365 COPILOT RESEARCHER" onwards)
3. Paste it into M365 Copilot
4. At the bottom under "SCENARIO DESCRIPTION", paste the output from Step 1
5. M365 Copilot Researcher will generate comprehensive personas for all roles involved

### Step 3: Convert Personas to JSON & Generate Slides

**Option A: Unified Workflow (Recommended)**

Use the new unified agent prompt that handles both JSON conversion and slide generation:

1. Open `.github/prompts/generate_persona_slides_from_report.prompt.md` in VS Code
2. Invoke the prompt with the path to your researcher report markdown file
3. The agent will automatically:
   - Extract all personas from the report
   - Create JSON files in `personas/data/`
   - Generate the combined Marp deck at `personas/generated/personas-deck.md`

**Option B: Separate Steps**

Convert the researcher output to JSON format, then generate slides separately:

1. Open `.github/prompts/convert_personas_to_json.prompt.md` in VS Code
2. Invoke the prompt (using Copilot chat or prompt picker)
3. Provide the M365 Copilot Researcher output from Step 2
4. Copilot will generate JSON files for each persona
5. Save the JSON files to `personas/data/` directory

### Step 4: Generate Marp Presentation Slides (if using Option B)

Generate the final presentation slides from the JSON files:

1. Open `.github/prompts/generate_slides.prompt.md` in VS Code
2. Invoke the prompt
3. This runs the generation script to create a combined Marp deck

Or run manually:
```bash
cd personas
node scripts/generate-slides.js combined
```

This creates a single combined deck at `personas/generated/personas-deck.md`

### Step 5: View and Export Slides

- Open the generated deck in VS Code with the Marp extension to preview
- Click "Open Preview to the Side" or press `Ctrl+K V` (Windows/Linux) or `Cmd+K V` (macOS)
- Export to PDF, PowerPoint, HTML, or PNG using the Marp toolbar in the preview
- Or export via command line using Marp CLI (see [PREREQUISITES.md](PREREQUISITES.md))

### Step 6: Generate User Journeys (Optional)

Once you have personas, document user journeys to illustrate key workflows:

1. Open `.github/prompts/generate_user_journeys.prompt.md` in VS Code
2. Invoke the prompt with your scenario, problem statement, and personas
3. Copilot will suggest 5-8 potential user journeys
4. Select which journeys to develop in detail
5. Copilot will generate detailed documentation with Mermaid diagrams
6. Save journey documentation to `user_journeys/data/`
7. Save Mermaid diagrams to `user_journeys/diagrams/`

See [user_journeys/README.md](user_journeys/README.md) for complete instructions.

## Workflow Summary

**Quick Workflow (Recommended):**
1. **Scenario** → Use `generate_scenario_and_problem_statement.prompt.md` (Copilot)
2. **Personas** → Use `persona-generation-prompt.md` (M365 Copilot Researcher) 
3. **JSON + Slides** → Use `generate_persona_slides_from_report.prompt.md` (Unified agent)
4. **User Journeys** → Use `generate_user_journeys.prompt.md` (Copilot agent)
5. **View/Export** → Open in Marp extension or export to PDF/PPTX

**Alternative Workflow:**
1. **Scenario** → Use `generate_scenario_and_problem_statement.prompt.md` (Copilot)
2. **Personas** → Use `persona-generation-prompt.md` (M365 Copilot Researcher) 
3. **JSON** → Use `convert_personas_to_json.prompt.md` (Copilot)
4. **Slides** → Use `generate_slides.prompt.md` (Copilot) or run script manually
5. **User Journeys** → Use `generate_user_journeys.prompt.md` (Copilot agent)
6. **View/Export** → Open in Marp extension or export to PDF/PPTX

### Output
## Files

- **[PREREQUISITES.md](PREREQUISITES.md)** - Installation guide for Node.js, Marp, and all required tools (Windows/macOS/Linux)
- `.github/prompts/generate_scenario_and_problem_statement.prompt.md` - Formalize scenario description
- `persona-generation-prompt.md` - Generate personas with M365 Copilot Researcher
- `.github/prompts/generate_persona_slides_from_report.prompt.md` - **NEW: Unified agent** for JSON + slides
- `.github/prompts/generate_user_journeys.prompt.md` - **NEW: Generate user journey suggestions and detailed documentation**
- `personas/` - Marp slide generation system
  - `data/` - JSON persona files
  - `templates/` - Marp slide template
  - `scripts/` - Generation script
  - `generated/` - Output slides
  - `images/` - Logos and photos
- `user_journeys/` - User journey documentation system
  - `data/` - Journey documentation files
  - `diagrams/` - Mermaid diagrams (sequence, flowchart, timeline)
  - `templates/` - Journey template file
