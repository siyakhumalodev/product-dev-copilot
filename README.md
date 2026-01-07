# product-dev-copilot

Toolkit for turning an NHS service idea into:

- A clear scenario + problem statement
- A Researcher-generated persona report
- Persona slides (Marp deck)
- User journeys (with Mermaid diagrams)
- A clickable NHS App-style prototype for a selected journey

## Quick start

1. Prereqs
  - Do: follow [PREREQUISITES.md](PREREQUISITES.md)
  - Check: `./setup-check.sh` (macOS/Linux) or `./setup-check.ps1` (Windows)

2. Scenario + problem statement (VS Code)
  - Do: run [.github/prompts/generate_scenario_and_problem_statement.prompt.md](.github/prompts/generate_scenario_and_problem_statement.prompt.md) with your rough scenario
  - Save: `tmp/scenario.md` (or similar)

3. Personas (Microsoft 365 Copilot → Researcher)
  - Open Copilot Chat: https://m365.cloud.microsoft/chat/
  - Researcher docs: https://learn.microsoft.com/en-us/copilot/microsoft-365/researcher-agent
  - Do: paste your `tmp/scenario.md` into [persona-generation-prompt.md](persona-generation-prompt.md)
  - Save: `tmp/persona-report.md`

4. Slides (VS Code)
  - Do: run [.github/prompts/generate_persona_slides_from_report.prompt.md](.github/prompts/generate_persona_slides_from_report.prompt.md) with `tmp/persona-report.md`
  - Output: `personas/generated/personas-deck.md`

5. User journeys (VS Code)
  - Do: run [.github/prompts/generate_user_journeys.prompt.md](.github/prompts/generate_user_journeys.prompt.md) with your scenario + personas
  - Save: `user_journeys/data/journey-<short-name>.md`
  - Details: [user_journeys/README.md](user_journeys/README.md)

6. UI prototype from a journey (optional)
  - Do: run [.github/prompts/build-nhs-app-user-journey-prototype.prompt.md](.github/prompts/build-nhs-app-user-journey-prototype.prompt.md) with a journey file path
  - Output: creates/updates `prototype/` and starts the server (usually `http://localhost:3000/frame`, fallback `http://localhost:2000/frame`)

## Where things live

- `personas/` - persona JSON inputs + Marp deck generation (see `personas/README.md`)
- `user_journeys/` - user journey templates and generated docs
- `.github/prompts/` - Copilot prompts used for the workflow
- `tmp/` - scratch space for scenario/persona reports
- `prototype/` - NHS App prototype kit with generated journey pages