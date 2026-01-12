---
agent: agent
---

# Build NHS App prototype from a user journey

You are an expert in the NHS App prototype kit and prototyping user journeys.

## Input

The user provides the path to a journey markdown file, e.g. `user_journeys/data/journey-*.md`.

## Goal

Turn the journey into a clickable NHS App prototype:
- Pages under `prototype/app/views/pages/journey-<slug>/...`
- Routes for every page in `prototype/app/routes.js`
- A link on `prototype/app/views/pages/home-p9.html` to start the journey

## Non‑negotiables (read before coding)

- Keep the dev server running: `cd prototype && npm run watch`.
  - The Express app typically runs on `http://localhost:2000`.
  - BrowserSync usually proxies it on `http://localhost:3000`.
- Do not open the Simple Browser. Instead, when you finish, provide a clickable link to the mobile frame at `http://localhost:3000/frame` (or `http://localhost:2000/frame` if BrowserSync is not running).
- Every page must have a route. If there is no route, you will get a 404 even if the file exists.
- Never use `.html` in routes or `href` values.
- Use NHS App design system components only: https://design-system.nhsapp.service.nhs.uk/components/
  - Avoid inline styles. If you need custom styling, add a small prototype-specific Sass file and import it.
- Only the journey intro page may contain narrative/explanation. All other pages must look like “real app UI” (no “Step 1 of X”, no meta commentary).

## Rich UX (make it feel real)

Aim for a rich, believable “NHS App-like” experience, not just linked pages.

### How to make it richer (without breaking design-system rules)

- **Progressive disclosure:** show summaries first, then “View details” drill-down screens for complex info (results, meds, appointments).
- **Make actions feel purposeful:** every screen should have a clear primary action and an obvious way back.
- **Use realistic content:** plausible dates/times, NHS terminology, clinician/service names, and realistic constraints (waiting times, review messages).
- **Use status & feedback:** tags/labels, callouts, confirmation screens, and “what changed” messaging after decisions.
- **Micro-interactions via navigation:** use cards that feel tappable, confirmations after submissions, and clear “continue” CTAs.
- **Multiple channels:** represent messages/notifications/results as distinct UI patterns (e.g. inbox message vs results list vs booking flow).
- **Accessibility:** meaningful headings, link text (“View glucose details”), keyboard-friendly controls, no colour-only meaning.

### Innovative components (allowed, with guardrails)

Prefer composition of existing design system components.

Custom UI is allowed only when **no suitable component exists** and it materially improves understanding.
When you add something custom:
- Keep it minimal and consistent with NHS App styles.
- Put styles in a prototype-specific Sass partial (no inline styling).
- Add a one-line note in the page markup explaining why it’s custom.

Examples of acceptable “innovations” in a prototype:
- A tiny **trend sparkline** next to a result (if no chart component exists), paired with a text label like “Improving”.
- A compact **summary strip** (e.g. counts of “within target / needs attention”).
- “Card → detail screen” pattern to reduce scrolling and make content feel app-like.

## Naming & routing conventions

- **Journey slug:** use a kebab-case slug like `journey-multi-specialist-coordination`.
   - Folder: `prototype/app/views/pages/<slug>/`
   - Start route: `/pages/<slug>` renders `pages/<slug>/index`
- **Page naming:** use short kebab-case page ids, e.g. `results-dashboard`, `appointment-details`, `decision-medication`.
   - File: `prototype/app/views/pages/<slug>/<page>.html`
   - Route: `/pages/<slug>/<page>` renders `pages/<slug>/<page>`
- **Links:** always link to the route (no `.html`), e.g. `href="/pages/<slug>/results-dashboard"`.
- **Index alias (optional but recommended):** also add `/pages/<slug>/index` for compatibility.

## Workflow (do in order)

1. **Ensure the prototype exists**
   - If `./prototype` does not contain the nhsapp-prototype kit, clone it from `https://github.com/nhsuk/nhsapp-prototype` into `./prototype`, remove `prototype/.git`, then run `npm install`.
   - If `./prototype` already exists, do not delete/recreate it.

2. **Start the server and keep it running**
   - Run `cd prototype && npm run watch` in a dedicated terminal and leave it running.

3. **Read the journey markdown**
   Extract:
   - Main steps (the default path)
   - Decision points (branches)
   - Screens/touchpoints (messages, results, booking, forms)
   - Data that must appear (appointments, results, meds, alerts)

4. **Create the pages**
   - Create `prototype/app/views/pages/journey-<slug>/index.html` as the **only** narrative/overview page.
   - Create one page per major step and one page per branch.
   - Use Nunjucks and extend `layout-app.html`.

5. **Wire navigation**
   - Add Next/Back links and branch choices.
   - All links must be absolute and start with `/pages/...`.

6. **Register routes**
   - Add a `router.get(...)` for every page you created in `prototype/app/routes.js`.
   - Example:
     ```js
     router.get('/pages/journey-foo/step-1', (req, res) => {
       res.render('pages/journey-foo/step-1');
     });
     ```

7. **Update the hub page**
   - Add a card/link to `prototype/app/views/pages/home-p9.html`.
   - Link to `/pages/journey-<slug>`.

8. **Smoke test**
   - Click through the whole main flow and each branch.
   - Confirm no 404s.
   - Use the mobile frame at `/frame`.
   - After you make changes, refresh the frame: right-click inside the frame and choose **Refresh Frame**.

## Definition of done

- Journey is reachable from `/pages/home-p9`.
- All pages render (no 404s) and all links work.
- Main flow and branches are navigable end-to-end.
- UI uses NHS App design system components and avoids inline styling.
- Server remains running for the user to browse.

If the user hasn’t provided a journey file path yet, ask for it.
