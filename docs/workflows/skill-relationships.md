# Skill Relationships

This repository works best when each skill keeps a narrow responsibility.

## Relationship Model

- `parallel-decomposer-skill` decides how broad work should be split
- `code-analyzer-suite` reviews the changed surface across focused quality dimensions
- `iterative-implementation-review` controls repeated implementation, repair, and verification
- `landable-implementation-loop` determines whether the outcome is genuinely shippable
- `grill-me` acts as a pressure-test companion rather than the main controller

## Repository Model

This integrated repository sits on top of three source repositories:

- `parallel-decomposer-skill` for decomposition
- `code-analyzer-suite` for review
- `iterative-implementation-review` for workflow orchestration

Those source repositories keep their own identities and can still be installed independently.

This repository exists to package them into one coherent workflow distribution with a clearer top-level story.

## Why This Separation Matters

This avoids:

- a single oversized skill prompt
- overlapping review responsibilities
- unclear workflow ownership
- hidden third-party attribution

## Rule Of Thumb

Keep repository ownership unified, but keep skill boundaries explicit.
