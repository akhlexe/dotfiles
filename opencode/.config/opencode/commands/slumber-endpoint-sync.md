---
description: Collect API endpoints and create or update Slumber agent/manual recipes explicitly on demand
agent: architect
---

Collect API endpoints from the app and create or update `slumber.yml` or `slumber.yaml`.

Task:
$ARGUMENTS

Rules:
- Use this workflow only for explicit Slumber sync work.
- Read the router, handlers, auth flow, and request parsing before editing the collection.
- Reuse the existing Slumber file if present.
- Prefer the smallest correct change.
- Preserve unrelated working requests.

Collection structure:
- Keep separate `auth`, `agent`, and `manual` request groups when practical.
- `auth` is for shared login or token acquisition.
- `agent` is for non-interactive CLI-safe requests.
- `manual` is for prompt-driven exploration.

Agent recipe rules:
- Never use `prompt(...)` in agent recipes.
- Prefer a hardcoded fast-path recipe for important endpoints.
- Prefer a parameterized agent variant backed by profile data when overrides are useful.
- Use explicit IDs like `_agent`, `_agent_param`, `_not_found_agent`, `_unauthorized_agent`, `_method_not_allowed_agent` when those scenarios are clearly supported by the code.

Manual recipe rules:
- Manual recipes may use `prompt(...)` for path params, query params, or body fields.
- Mirror important agent recipes when that helps exploration.

Auth rules:
- For protected endpoints, reuse or add a shared auth request.
- Prefer Slumber response chaining for bearer tokens when possible.

Profile rules:
- Ensure there is a local profile with `host`.
- Add stable profile-backed values for path params, auth creds, and scenario inputs.
- Keep secrets out of the file when possible and use existing env-backed patterns if already established.

Validation rules:
- Dry-run new agent recipes with `slumber request <recipe_id> --profile local --dry-run`.
- If the API is running and live validation is requested, run the relevant `slumber request` commands with `--profile local --verbose`.
- Use `--exit-status` for expected success cases.

Always report:
- which endpoints were collected or updated
- which agent recipes were added or changed
- which manual recipes were added or changed
- exact commands to run the new recipes
