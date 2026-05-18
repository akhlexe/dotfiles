---
name: prd-to-tracer-bullets
description: >
  Convert a PRD file into an ordered tracer-bullets vertical-slice document and
  per-slice delegation handoffs. Trigger when the user asks to derive tracer bullets,
  vertical slices, atomic implementation tasks, or subagent handoffs from a PRD.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

# PRD to Tracer Bullets

## When to Use

- User has a PRD and wants implementation slices derived from it
- User wants vertical slices instead of horizontal technical tasks
- User wants a resumable tracer-bullets doc before coding starts
- User wants per-slice subagent delegation handoffs
- User wants PRD-first decomposition without depending on a separate implementation plan

## Critical Patterns

### 1. Start from the PRD, not the code plan
- Treat the PRD as the source of truth for goals, scope, non-goals, requirements, and acceptance criteria.
- Do not import tasks from an implementation plan unless the user explicitly asks for cross-checking.
- If the PRD is missing required clarity, ask targeted questions before generating slices.

### 2. Produce vertical slices, not horizontal layers
- Each tracer bullet must leave the real system runnable and observably improved.
- Avoid task splits like “add model state”, “add rendering”, “add key handling” when those do not form a user-visible end-to-end increment.
- Prefer slices that cross the real command path, runtime path, update loop, rendering path, or request path.

### 3. Keep slices thin
- One tracer bullet should represent one narrow user-visible behavior.
- Bundle only the minimum supporting work needed to make that behavior real.
- If a slice is too large, split by behavior boundary, not by internal layer.

### 4. Preserve milestone boundaries
- Use PRD non-goals aggressively to keep slices narrow.
- Explicitly call out what belongs to the next milestone so development can resume cleanly later.
- If a requirement depends on infrastructure that does not exist yet, decide whether the slice can still go end-to-end through a narrower real path.

### 5. Every slice needs delegation-ready context
- For each tracer bullet, capture:
  - goal
  - included behavior
  - end-to-end result
  - PRD requirement mapping
  - in-scope / out-of-scope boundaries
  - likely files involved
  - verification expectations
- This context should be sufficient to hand the slice to a subagent without rediscovery.

### 6. Prefer TDD-ready phrasing
- Each slice should be small enough for a RED -> GREEN -> VERIFY loop.
- State the expected user-visible behavior in a way that can become a test first.
- If the user wants strict TDD, delegate each slice to an atomic executor one at a time.

## Workflow

### Step 1 — Read the PRD
Extract:
- milestone or feature name
- problem statement
- goals
- non-goals
- target user experience
- functional requirements
- quality requirements
- acceptance criteria

### Step 2 — Check feasibility of tracer bullets
Ask:
- Can this feature be sliced into end-to-end user-visible increments?
- If not fully, what is the narrowest real path through the system?
- Are there hidden dependencies that require a prerequisite slice?

If tracer bullets are not appropriate, say so explicitly and explain why.

### Step 3 — Derive slices
Create ordered slices that:
- build on one another
- each leave the feature runnable
- each map back to PRD requirements
- stay within milestone scope

For each slice, include:
- title
- goal
- includes
- end-to-end result
- PRD coverage

### Step 4 — Add execution order
List the recommended order and explain any dependency chain briefly.

### Step 5 — Add resume context
Document:
- current scope guardrails
- what is complete when all slices finish
- where the next milestone begins

### Step 6 — Prepare delegation handoffs
For each slice, prepare a subagent-ready handoff with:
- classification
- objective
- requirements source
- scope
- constraints
- TDD expectations

## Decision Rules

| Situation | Decision |
|---|---|
| PRD has clear acceptance criteria | derive slices directly |
| PRD has ambiguous UX behavior | ask focused questions first |
| Slice would only change internals | merge it into a user-visible slice |
| Real data path does not exist yet | use the narrowest real runtime path that still produces user-visible progress |
| Requirement would expand the milestone | push it to a later slice or next milestone |
| User wants coding immediately after | produce delegation-ready slices, then start with slice 1 |

## Output Contract

When asked to write the tracer-bullets doc, produce a document under the project's tracer-bullets area if that convention exists. Otherwise propose a path before writing.

Use this structure:

```markdown
# <Milestone> — Tracer Bullets

## Purpose
<why this doc exists>

## Source
- PRD: `<path>`
- Roadmap item: `<item if available>`

## Scope Guardrails
- <guardrail>

## Tracer Bullets

### TB1 — <title>
**Goal:** <user-visible behavior>

**Includes:**
- <included work>

**End-to-end result:**
<what the user can run/see/do after this slice>

**PRD coverage:**
- <requirement mapping>

---

## Recommended Execution Order
1. TB1 — <title>

## Delegation Intent
Each tracer bullet should be delegated independently with:
- the tracer bullet goal
- the relevant PRD requirements and acceptance criteria
- current repo context
- scope boundaries and non-goals
- strict TDD expectation: failing test first, minimal implementation, focused verification

## Closeout Boundary to Next Milestone
<what remains out of scope after the final slice>
```

## Delegation Handoff Template

Use this for each tracer bullet when the user wants implementation:

```markdown
## Delegated Handoff: <TB# — title>

### Context
<1-2 sentences on current milestone state and why this slice is next>

### Classification
- Type: feature | test | refactor | docs
- Why delegation: <why this should be executed by a subagent>
- Selected agent: atomic-executor

### Objective
<what the slice must accomplish>

### Requirements source
From `<prd-path>`:
- <FR / acceptance criteria mapping>

### Scope
Include only:
- <items>

Out of scope:
- <items>

### Constraints
- Files likely involved: <paths>
- Preserve: <existing behavior>
- Do not add code comments
- Keep tests behavior-focused

### TDD expectations
Perform exactly one atomic RED -> GREEN -> VERIFY loop:
1. Add or adjust focused tests first.
2. Implement the minimal code to pass.
3. Run focused verification, then broader relevant verification.
4. Report changes, tests, and commands run.
```

## Minimal Quality Checks

Before finalizing the tracer-bullets doc, verify:
- every slice is user-visible or system-visible end-to-end
- slices are ordered by dependency
- slices map back to the PRD
- non-goals are preserved
- next-milestone boundary is explicit
- each slice is small enough for delegated TDD

## Commands

```bash
# Inspect PRD and existing docs conventions
ls docs

# Example doc locations to inspect
ls docs/prds
ls docs/tracer-bullets

# Example verification after implementation begins
go test ./...
```

## Resources

- **Templates**: See [assets/tracer-bullets-template.md](assets/tracer-bullets-template.md) for the base document format.
