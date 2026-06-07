---
name: grill-with-docs
description: Stress-test a plan or design with one-question-at-a-time grilling, using codebase exploration when answers are discoverable. Optionally write project docs like CONTEXT.md or ADRs when the user wants durable capture.
---

# Grill With Docs

Interview the user relentlessly about a plan or design until the important decisions are explicit.

Ask one question at a time. Wait for the user's answer before asking the next question.

If a question can be answered by exploring the codebase, explore the codebase instead of asking.

This skill is independent. It does not require any other skill, tracker, label system, or document layout to exist in advance.

## Default behavior

1. Work from the current conversation and the current project.
2. Challenge vague terms, hidden assumptions, edge cases, and missing constraints.
3. Prefer concrete scenarios over abstract debate.
4. Keep going until the plan is precise enough to build.

## While grilling

### Sharpen vague language

When the user uses a fuzzy or overloaded term, ask them to pin it down.

Examples:

- "When you say account, do you mean the user identity, the billing owner, or both?"
- "When you say sync, is this push, pull, or bidirectional reconciliation?"

### Pressure-test with scenarios

Invent concrete scenarios that force the design to reveal its edges.

Examples:

- What happens if two users edit the same thing at once?
- What happens if the upstream system is unavailable for 30 minutes?
- What happens if the user changes their mind halfway through the flow?

### Cross-check against code

When the user describes current behavior, verify it against the code when feasible. If the code and the description disagree, surface the contradiction clearly.

### Prefer decisions over speculation

If multiple valid options exist, make the trade-off explicit and push toward a decision.

## Optional durable outputs

Only write docs when the user wants the conclusions captured in the project.

Possible outputs in the current project:

- `CONTEXT.md` for a glossary of domain terms
- `docs/adr/NNNN-title.md` for hard-to-reverse decisions

If you write `CONTEXT.md`, use the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md).

If you write an ADR, use the format in [ADR-FORMAT.md](./ADR-FORMAT.md).

Do not create docs preemptively. Create them lazily, only when there is something worth recording.
