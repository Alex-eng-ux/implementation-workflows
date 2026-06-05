# Implementation Workflows

This repository packages a practical implementation workflow for Codex-style skill usage.

It combines decomposition, changed-surface review, iterative repair, and landability checks into one coherent suite, while preserving each skill as an independent building block.

## Included Skills

### First-party skills

- `parallel-decomposer-skill`: split complex work into ownership-safe subtasks
- `parallel-decomposer-auto`: dispatch orchestration-ready worker specs when auto execution is available
- `code-analyzer-suite`: review changed code across targeted dimensions
- `code-analyzer-auto`: dispatch multi-dimensional review workers and consolidate findings
- `iterative-implementation-review`: run implementation, review, repair, and verification loops
- `iterative-implementation-review-auto`: run the same loop in an auto-first orchestration style
- `landable-implementation-loop`: act as the user-facing entry point and final readiness gate

### Third-party companion skill

- `grill-me`: adversarial critique and pressure-testing

`grill-me` is included as a third-party component and should remain clearly attributed to its upstream source.

## Repository Layout

```text
implementation-workflows/
  README.md
  LICENSE
  THIRD_PARTY_NOTICES.md
  skills/
    parallel-decomposer-skill/
      SKILL.md
      parallel-decomposer-auto/
        SKILL.md
    code-analyzer-suite/
      SKILL.md
      code-analyzer-auto/
        SKILL.md
    iterative-implementation-review/
      iterative-implementation-review/
        SKILL.md
      iterative-implementation-review-auto/
        SKILL.md
    landable-implementation-loop/
      SKILL.md
    external/
      grill-me/
        SKILL.md
        LICENSE
        UPSTREAM.md
  docs/
    workflows/
      landable-loop.md
      skill-relationships.md
```

## Recommended Usage

Start from `landable-implementation-loop` when the user wants the work made genuinely usable rather than merely analyzed.

For broad or risky work, the intended flow is:

1. Decompose with `parallel-decomposer-skill` when parallel ownership is useful.
2. Switch to `parallel-decomposer-auto` when the runtime can safely dispatch sub-agents.
3. Implement and iterate with `iterative-implementation-review` or `iterative-implementation-review-auto`.
4. Review the changed surface with `code-analyzer-suite` or `code-analyzer-auto`.
5. Pressure-test assumptions with `grill-me`.
6. Let `landable-implementation-loop` decide whether the finish line is actually credible.

## Third-Party Attribution

Third-party materials should be handled under `skills/external/`.

For `grill-me`, keep these files together:

- `SKILL.md`
- `LICENSE`
- `UPSTREAM.md`

Also maintain a root-level `THIRD_PARTY_NOTICES.md`.

## Setup Notes

This repository keeps each skill in its own directory so it can still be copied or installed independently.

First-party suites preserve their original support files such as `AGENTS.md`, `assets/`, `references/`, `scripts/`, and `evals/`.

## Naming

Suggested repository names:

- `implementation-workflows`
- `agent-workflow-suite`
- `landable-implementation-loop`

If this repository is meant to host more workflows over time, `implementation-workflows` is the cleanest umbrella name.
