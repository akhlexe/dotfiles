---
description: Write and run tests for the specified target, fixing any failures
agent: tester
subtask: true
---

Write and run tests for: $ARGUMENTS

Process:
1. Read the code under test to understand its behavior and edge cases
2. Check existing tests in the project and follow the same conventions
3. Write tests in batches (one file or module at a time)
4. Run the tests after each batch and report: pass count, fail count, and any error output
5. Fix any failures before moving on
6. Wait for approval before starting the next batch

Prioritize: happy path → edge cases → error handling → integration points.
