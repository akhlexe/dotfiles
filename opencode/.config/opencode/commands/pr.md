---
description: Create a PR for current changes with a structured commit and description
agent: git-ops
subtask: true
---

Create a pull request for the current changes. $ARGUMENTS

Process:
1. Run `git status`, `git diff`, and `git log` to understand all pending changes
2. If there are uncommitted changes, group them into logical commits using conventional commit format
   - Ask before staging if the grouping is unclear
3. Push the branch (ask before force pushing)
4. Create the PR with:
   - A concise title following conventional commit format
   - Summary bullets of what changed
   - The motivation/why behind the changes
   - Any breaking changes or migration steps required
   - How the changes were tested

Use conventional commit types: feat, fix, refactor, docs, test, chore, ci, perf.
Do NOT commit files that look like they contain secrets (.env, credentials, keys).
