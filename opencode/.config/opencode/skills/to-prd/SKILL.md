---
name: to-prd
description: Turn the current conversation context into a PRD written into the current project's docs/issues directory. Use when user wants a PRD from the current discussion, plan, or repo context.
---

# To PRD

This skill converts the current conversation context and project understanding into a PRD file.

This skill is independent. It does not depend on any tracker integration, label vocabulary, domain docs, or other skills.

## Input

- The current conversation context
- The current project's codebase, when exploration is useful
- Optionally, a user-provided feature title, feature slug, or target path

## Output

Write a PRD to the current project's docs tree at:

`docs/issues/<feature-slug>/PRD.md`

Paths are always relative to the current project root, not the skill repository.

Create directories lazily.

## Process

1. Explore the current project if needed to understand the feature's starting point.
2. Infer a `feature-slug` from the feature title or topic.
3. Only ask the user for a slug if the inferred slug would be ambiguous or misleading.
4. Sketch the main testing seams at the highest useful level.
5. Check with the user that the seams match their expectations.
6. Write the PRD to `docs/issues/<feature-slug>/PRD.md`.

If the target PRD already exists, update it in place unless the user asks for a separate variant.

Do not publish the PRD anywhere else.

## PRD Template

```md
## Problem Statement

The problem the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

1. As an <actor>, I want a <feature>, so that <benefit>

Write a long, concrete numbered list that covers the meaningful flows, edge cases, and operational realities of the feature.

## Implementation Decisions

- The modules or responsibilities that will be built or modified
- Interface changes
- Architectural decisions
- Data shape or schema changes
- API contracts
- Significant interaction details

Do not include specific file paths unless the user explicitly asks for them.

## Testing Decisions

- What good tests should prove from the outside
- Which modules or seams will be tested
- Prior art in the codebase, if relevant

## Out of Scope

What this PRD intentionally does not cover.

## Further Notes

Any remaining clarifications, assumptions, or follow-up notes.
```
