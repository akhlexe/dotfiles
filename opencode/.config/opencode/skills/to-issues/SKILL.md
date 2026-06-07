---
name: to-issues
description: Break a plan, spec, or PRD into tracer-bullet issue files under the current project's docs/issues directory. Use when user wants to turn a plan into implementation tickets or vertical slices.
---

# To Issues

Break a plan into independently grabbable vertical slices and write them as issue files in the current project.

Optimize each issue for delegation to a fresh session, background agent, or sandbox with minimal prior repo context.

This skill is independent. It does not depend on any tracker integration, label vocabulary, domain docs, or other skills.

## Input

- A PRD, plan, or spec from the current conversation
- Optionally, a path to a source document such as `docs/issues/<feature-slug>/PRD.md`

If the user passes a path, read it and use it as the source of truth.

## Output

Write issue files to:

`docs/issues/<feature-slug>/issues/<NN>-<slice-slug>.md`

Paths are always relative to the current project root, not the skill repository.

Create directories lazily.

## Process

### 1. Gather context

Work from the current conversation context. If the user passes a file path, read it before drafting slices.

### 2. Explore the codebase for execution context

Explore enough to understand:

- the current implementation seam each slice will start from
- the likely files/modules/tests a fresh agent should inspect first
- the main constraints, invariants, and deferred boundaries
- the simplest verification path for each slice

Do not stop at slice naming alone. The generated issues should be usable as self-contained handoff docs.

### 3. Draft vertical slices

Break the work into tracer-bullet slices.

Rules:

- Each slice should cut through all relevant layers end-to-end.
- A completed slice should be demoable or verifiable on its own.
- Prefer many thin slices over a few thick ones.
- Avoid horizontal slices like "database only" or "UI only" unless the user explicitly wants them.
- Prefer slices that a fresh agent can implement with one clear starting seam and one clear verification loop.
- If a slice depends on preserving prior behavior, make that explicit in the issue.

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each slice, show:

- Title
- Blocked by
- User stories covered, if the source material has them

Ask the user:

- Is the granularity right?
- Are the dependencies correct?
- Should any slices be merged or split?

Iterate until the user approves the breakdown.

### 5. Write issue files

Write the approved slices in dependency order so earlier files can be referenced by later ones.

Infer `feature-slug` from the source path or feature title. Only ask the user if the inferred slug would be ambiguous or misleading.

Use zero-padded numbering starting at `01`.

Each issue must contain enough repo-specific context for a fresh agent to begin work without rereading the full PRD or rediscovering the same seams.

For every issue, include concise but concrete notes for:

- what behavior exists today
- why this slice exists now
- which files or modules are the most likely touchpoints
- what must remain unchanged
- how to verify the slice when done
- what nearby future work is intentionally out of scope

## Issue File Template

```md
# {Slice title}

## Source

- `docs/issues/<feature-slug>/PRD.md`

## What to build

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

## Current Context

- What the code does today that makes this slice necessary
- What prior milestone behavior or user-visible contract must be preserved

## Likely Touchpoints

- `path/to/file` — why it is likely relevant
- `path/to/other_test.go` — what verification or prior art it contains

## Constraints

- In scope
- Out of scope
- Important behavior that must not regress

## Acceptance Criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Verification Notes

- Commands to run
- Manual checks to perform

## Gotchas

- Deferred future work that should not be pulled into this slice
- Repo-specific traps, invariants, or assumptions

## Blocked By

- `01-other-slice.md`

Or `None - can start immediately` if no blockers.
```

## Writing guidance

- Keep issue files concise, but never so short that a fresh agent has to rediscover the seam from scratch.
- Prefer repo-specific touchpoints over generic advice.
- Mention exact file paths when they materially reduce ambiguity.
- If a test seam or command is obvious from the repo, include it.
- If the slice intentionally introduces a narrow preview of a later milestone feature, say so explicitly.
- If a slice depends on earlier files establishing a seam, explain that dependency in one sentence, not just in `Blocked By`.

Do not modify or delete the source PRD unless the user asks.
