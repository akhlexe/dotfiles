---
description: Implement code changes in small, reviewable batches with approval between each
agent: implementor
subtask: true
---

Implement the following: $ARGUMENTS

Work in small, reviewable batches — one logical unit at a time (a single file, function, or feature slice).

After completing each batch:
1. Summarize exactly what was changed and why
2. Run a quick sanity check (lint, type check, or relevant test if fast)
3. List what remains to be done
4. Wait for approval before continuing to the next batch

Do not combine multiple steps into one large change.

If the request is part of `atomic-tdd`, stop and use the `atomic` command instead.
