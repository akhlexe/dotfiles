---
description: Refactor code to improve structure without changing behavior, verified by tests
agent: refactorer
subtask: true
---

Refactor: $ARGUMENTS

Rules:
1. Do NOT change behavior — structural improvement only
2. If the target code has no tests, flag this before starting and ask how to proceed
3. Work in batches — one file or one concern at a time (don't mix rename + extract + simplify)
4. After each batch: run the relevant tests to confirm nothing broke
5. Report test results before continuing
6. If you notice a bug while refactoring, log it separately — do not fix it in the same batch
7. Wait for approval before the next batch

State the quality improvement (readability, maintainability, performance) for each batch.
