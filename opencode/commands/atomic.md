---
description: Execute one approved atomic TDD step with strict RED->GREEN->VERIFY discipline
agent: atomic-executor
subtask: true
---

Execute the following atomic TDD step: $ARGUMENTS

Rules:
1. Work on exactly one approved atomic step
2. Show the exact test code first and wait for approval
3. Write the test and confirm RED before implementation
4. Implement the minimum code needed for GREEN
5. Run the relevant verification
6. Create one conventional commit
7. Stop after the loop and report the result
