---
description: Execute one approved atomic TDD step with strict RED->GREEN->VERIFY discipline
agent: atomic-executor
subtask: true
---

Execute the following atomic TDD step: $ARGUMENTS

Rules:
1. Work on exactly one approved atomic step
2. Write the test and run the full test suite to confirm RED before implementation
3. Treat RED as valid only when the expected failure comes from this step; unrelated failures block the loop
4. Implement the minimum code needed for GREEN
5. Run build plus the full test suite for verification
6. Wait for explicit approval only after GREEN and before commit
7. Create one conventional commit
8. Stop after the loop and report the result
