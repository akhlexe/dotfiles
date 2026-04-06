---
description: Review code for quality, security, and performance — no changes made
agent: reviewer
subtask: true
---

Review the following for code quality, security, and performance: $ARGUMENTS

Do NOT make any file changes. Produce a structured report only.

Structure the report as:
1. **Summary** — overall quality in 1-3 sentences
2. **Critical Issues** 🔴 — must fix before merging (include file:line for each)
3. **Warnings** 🟡 — should fix, not a blocker (include file:line for each)
4. **Suggestions** 🔵 — nice-to-have improvements
5. **Positives** ✅ — things done well

For every issue: state the file and line, explain the risk, and suggest how to fix it.
