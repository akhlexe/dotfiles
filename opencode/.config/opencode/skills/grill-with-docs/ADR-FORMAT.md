# ADR Format

ADRs live in `docs/adr/` in the current project and use sequential numbering: `0001-slug.md`, `0002-slug.md`, and so on.

Create `docs/adr/` lazily when the first ADR is needed.

## Template

```md
# {Short title of the decision}

{1-3 sentences: what the context was, what was decided, and why.}
```

## When to write an ADR

Only when all three are true:

1. The decision is hard to reverse.
2. The choice would be surprising without context.
3. There was a real trade-off.
