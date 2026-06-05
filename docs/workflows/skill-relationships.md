# Skill Relationships

This repository works best when each skill keeps a narrow responsibility.

## Relationship Model

- `parallel-decomposer-skill` decides how broad work should be split
- `code-analyzer-suite` reviews the changed surface across focused quality dimensions
- `iterative-implementation-review` controls repeated implementation, repair, and verification
- `landable-implementation-loop` determines whether the outcome is genuinely shippable
- `grill-me` acts as a pressure-test companion rather than the main controller

## Why This Separation Matters

This avoids:

- a single oversized skill prompt
- overlapping review responsibilities
- unclear workflow ownership
- hidden third-party attribution

## Rule Of Thumb

Keep repository ownership unified, but keep skill boundaries explicit.
