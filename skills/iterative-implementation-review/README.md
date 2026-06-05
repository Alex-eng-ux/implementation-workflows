# Iterative Implementation Review Skills

This repository contains two related Codex skills:

- `iterative-implementation-review`: manual or standard companion-skill workflow using `parallel-decomposer`, `code-analyzer`, and `grill-me`
- `iterative-implementation-review-auto`: auto-first workflow using `parallel-decomposer-auto`, `code-analyzer-auto`, and `grill-me`

Each skill is self-contained and can be installed independently.

## Install Map

Use these exact directories when installing from the mother repo:

- install `iterative-implementation-review` from `skills/iterative-implementation-review/iterative-implementation-review/`
- install `iterative-implementation-review-auto` from `skills/iterative-implementation-review/iterative-implementation-review-auto/`

This wrapper folder exists only to keep the two related skills together in one suite.

## When To Use Which

- use `iterative-implementation-review` when you want the standard loop with manual or mixed orchestration
- use `iterative-implementation-review-auto` when the runtime can dispatch workers and you want an auto-first loop

## Companion Skills

These skills are designed to work especially well with:

- `parallel-decomposer-skill` or `parallel-decomposer-auto`
- `code-analyzer-suite` or `code-analyzer-auto`
- `grill-me`
- `landable-implementation-loop` as the user-facing final gate
