# Accelerating Product Development with GitHub Copilot

Toolkit for turning an idea into:

- A clear scenario + problem statement
- A Researcher-generated persona report
- Persona slides (Marp deck)
- User journeys (with Mermaid diagrams)
- A clickable NHS App-style prototype for a selected journey

## Quick start

1. Prereqs
  - Open this repository in Github Codespaces, in VS Code with provided Dev Container, or if that is not possible use VS Code and  ensure prequisites are installed: `./setup-check.sh` (macOS/Linux) or `./setup-check.ps1` (Windows)
  - Create a new branch for your work via the terminal or other means: `git checkout -b my-feature-branch`

2. Scenario + problem statement (VSCode Copilot Chat)
  - Run `/generate_scenario_and_problem_statement` <description of scenario>
  - Save in `scenarios/scenario.md`

3. Personas (Microsoft 365 Copilot → Researcher)
  - Open Copilot Chat: https://m365.cloud.microsoft/chat/
  - Researcher docs: https://learn.microsoft.com/en-us/copilot/microsoft-365/researcher-agent
  - Paste your `scenarios/scenario.md` into the bottom of [personas/persona-generation-prompt.md](personas/persona-generation-prompt.md) and run in researcher.
  - Save the output to: `personas/persona-report.md`

4. Slides (VS Code Copilot Chat)
  - Run `/generate_persona_slides_from_report` personas/persona-report.md
  - Output: `personas/generated/personas-deck.md`
  - Preview Markdown as slides - Ctrl + Shift + V (Windows) or Cmd + Shift + V (macOS)

5. User journeys (VS Code Copilot Chat)
  - Run `/generate_user_journeys` with your scenario + personas
  - Output: `user_journeys/generated/` with journey docs and diagrams
  -  Preview Markdown - Ctrl + Shift + V (Windows) or Cmd + Shift + V (macOS)

6. UI prototype from a journey (optional)
  - Run `/build_nhs_app_prototype_from_user_journey` with a journey file path.
  - Output: creates/updates `prototype/` and starts the server (usually `http://localhost:3000/frame`, fallback `http://localhost:2000/frame`)
  - Provide feedback and iterate as needed.

## Where things live

- `personas/` - persona JSON inputs + Marp deck generation (see `personas/README.md`)
- `user_journeys/` - user journey templates and generated docs
- `.github/prompts/` - Copilot prompts used for the workflow
- `tmp/` - scratch space for scenario/persona reports
- `prototype/` - NHS App prototype kit with generated journey pages