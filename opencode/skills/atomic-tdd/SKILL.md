---
name: atomic-tdd
description: A disciplined, incremental TDD workflow for building features one atomic step at a time. Enforces feature understanding, step dissection, and a strict red-green-commit loop.
---

# atomic-tdd

A personal development workflow for building software incrementally, with full confidence at every step.
Applies to any language, any project.

This skill is designed to work with two roles:
- `architect` owns Phase A and Phase B
- `atomic-executor` owns Phase C

## When to Use

Activate this skill when:
- Starting any new feature, milestone, or non-trivial change
- You need to break down a complex problem into safe, testable steps
- You want to enforce TDD discipline from the very first line

---

## The Three Phases

### Phase A — Feature Understanding

Owner: `architect`

Before writing anything, understand the feature fully.

- Use the `grill-me` skill to discuss the change
- Discuss the **what**, **why**, and **edge cases**
- Ask clarifying questions until nothing is ambiguous
- **No code, no tests yet**

Questions to answer before moving on:
- What is the input and output?
- What are the edge cases? (empty input, missing files, invalid data, etc.)
- What does "done" look like?

---

### Phase B — Feature Breakdown

Owner: `architect`

Split the feature into atomic steps.

**The atomic rule:**
> A step is small enough when you can describe its test in one sentence.

If you cannot describe the test in one sentence → split the step further.

Examples:
- ✅ "Returns an empty list when the urls file is empty"
- ✅ "Skips lines that start with #"
- ❌ "Parses and validates the urls file" → too broad, split it

Save the step map to persistent memory and validate it before writing any code.
Do not proceed to Phase C until the saved step map is agreed upon.
When implementation starts, `architect` should hand off exactly one step at a time to `atomic-executor`.

---

### Phase C — The Loop

Owner: `atomic-executor`

Repeat this loop for every atomic step:

```
1. PLAN      → Confirm the current step. State exactly what the test will assert.
2. SHOW TEST → Show the exact test code to the user and wait for approval before proceeding.
3. TEST      → Write the approved test. It must fail (RED). Do not write implementation yet.
4. IMPLEMENT → Write the minimum code to make the test pass. Nothing more.
5. VERIFY    → Run build + tests. Confirm GREEN. If not → back to step 4.
6. SHOW RESULT → Present the implementation outcome and verification evidence, then wait for explicit user approval before committing.
7. COMMIT    → After implementation approval, create one conventional commit for this atomic step only.
8. RETURN    → Stop after the single atomic loop and hand control back to `architect` or the developer.
```

---

## Rules (never break these)

- **Never skip the plan.** No implementation without an agreed step.
- **Never skip the test preview.** Always show the test to the user and wait for approval before writing it.
- **Never commit red tests.** Green is the only valid commit state.
- **Never commit without implementation approval.** Test approval allows writing the test; a separate explicit approval is required after GREEN and before COMMIT.
- **Never gold-plate.** Write the minimum code to pass the test. Refactor later.
- **Never merge steps.** One loop = one commit = one atomic behavior.
- **If verify fails** → back to IMPLEMENT (step 4), not back to PLAN (step 1).
- **Use conventional commits.** The commit message must follow `type(scope): description` when the repository uses that convention.
- **One handoff, one step.** `architect` hands off one atomic step at a time; `atomic-executor` does not pull in future steps.

---

## Done Criteria

A feature is done when:
- All steps in the step map are committed and green
- The roadmap or tracking document is updated
- The milestone is marked complete
- `architect` confirms there are no remaining agreed steps

---

## Example Step Map (Go URLs config loader)

Feature: Load a `urls` file and return a list of feed URLs.

| Step | Test in one sentence |
|------|----------------------|
| 1 | Returns an error when the file does not exist |
| 2 | Returns an empty slice when the file is empty |
| 3 | Returns a single URL from a file with one line |
| 4 | Returns multiple URLs from a file with multiple lines |
| 5 | Skips empty lines |
| 6 | Skips lines starting with `#` |
| 7 | Trims leading and trailing whitespace from each URL |

Each row above = one full loop iteration = one commit.
