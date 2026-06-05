# Skills Index

This file is the install map for the repository.

Use it when you want to know which directory to copy into your runtime as a top-level installed skill.

## Installable Skills

| Installed skill name | Copy this directory | Notes |
| --- | --- | --- |
| `parallel-decomposer-skill` | `skills/parallel-decomposer-skill/` | Includes shared assets, references, scripts, and the original skill entry |
| `parallel-decomposer-auto` | `skills/parallel-decomposer-skill/parallel-decomposer-auto/` | Auto variant lives inside the parallel decomposer suite |
| `code-analyzer-suite` | `skills/code-analyzer-suite/` | Includes shared assets, references, scripts, and the original skill entry |
| `code-analyzer-auto` | `skills/code-analyzer-suite/code-analyzer-auto/` | Auto variant lives inside the code analyzer suite |
| `iterative-implementation-review` | `skills/iterative-implementation-review/iterative-implementation-review/` | Manual or standard workflow loop |
| `iterative-implementation-review-auto` | `skills/iterative-implementation-review/iterative-implementation-review-auto/` | Auto-first workflow loop |
| `landable-implementation-loop` | `skills/landable-implementation-loop/` | User-facing workflow entry point |
| `grill-me` | `skills/external/grill-me/` | Third-party skill; keep `LICENSE` and `UPSTREAM.md` with it |

## Directory Conventions

This repository contains both:

- suite folders that group related skills and support files
- installable skill folders that contain the `SKILL.md` for a specific skill name

When installing, copy the directory that directly matches the installed skill name you want.

Examples:

- install `code-analyzer-suite` by copying `skills/code-analyzer-suite/`
- install `code-analyzer-auto` by copying `skills/code-analyzer-suite/code-analyzer-auto/`
- install `iterative-implementation-review-auto` by copying `skills/iterative-implementation-review/iterative-implementation-review-auto/`

## Recommended Full Workflow Set

For the complete workflow described in this repo, install:

- `parallel-decomposer-skill`
- `parallel-decomposer-auto`
- `code-analyzer-suite`
- `code-analyzer-auto`
- `iterative-implementation-review`
- `iterative-implementation-review-auto`
- `landable-implementation-loop`
- `grill-me`
