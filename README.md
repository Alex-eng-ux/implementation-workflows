# Implementation Workflows

This repository packages a practical implementation workflow for Codex-style skill usage.

It combines decomposition, changed-surface review, iterative repair, and landability checks into one coherent suite, while preserving each skill as an independent building block.

## Quick Start

If you want one default entry point, start with:

- `skills/landable-implementation-loop/`

If you want the full workflow, install these top-level skill directories into your runtime:

- `parallel-decomposer-skill`
- `parallel-decomposer-auto`
- `code-analyzer-suite`
- `code-analyzer-auto`
- `iterative-implementation-review`
- `iterative-implementation-review-auto`
- `landable-implementation-loop`
- `grill-me`

Use [skills/README.md](D:/FakeC/MCP/offiiceMCP/_mergework/implementation-workflows/skills/README.md) as the install map.

Quick install examples:

```bash
./install.sh --all-skills --platform codex
./install.sh --all-skills --all-platforms
```

On Windows PowerShell:

```powershell
.\install.ps1 -AllSkills -Platform codex
.\install.ps1 -AllSkills -AllPlatforms
```

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

## Source Repositories

This repository is the integrated workflow suite, not the original source of every first-party skill.

The main upstream repositories are:

- Decomposition layer: [Alex-eng-ux/parallel-decomposer-skill](https://github.com/Alex-eng-ux/parallel-decomposer-skill)
- Review layer: [Alex-eng-ux/code-analyzer-suite](https://github.com/Alex-eng-ux/code-analyzer-suite)
- Workflow layer: [Alex-eng-ux/iterative-implementation-review](https://github.com/Alex-eng-ux/iterative-implementation-review)

This repository packages those layers together with:

- `landable-implementation-loop` as the user-facing entry point
- `grill-me` as the third-party critique companion

## How This Repo Relates To The Others

Use the source repositories when you want to evolve one skill family in isolation.

Use `implementation-workflows` when you want:

- one installable home for the whole workflow
- one README that explains how the pieces fit together
- one place to distribute the full stack to multi-agent runtimes

In short:

- source repos are where individual skill families live and evolve
- `implementation-workflows` is the packaged integration layer

## Skill Map

| Installed skill name | Source directory in this repo | Purpose |
| --- | --- | --- |
| `parallel-decomposer-skill` | `skills/parallel-decomposer-skill/` | Manual or hybrid task decomposition |
| `parallel-decomposer-auto` | `skills/parallel-decomposer-skill/parallel-decomposer-auto/` | Auto-oriented decomposition |
| `code-analyzer-suite` | `skills/code-analyzer-suite/` | Manual or hybrid multidimensional code review |
| `code-analyzer-auto` | `skills/code-analyzer-suite/code-analyzer-auto/` | Auto-oriented review orchestration |
| `iterative-implementation-review` | `skills/iterative-implementation-review/iterative-implementation-review/` | Manual or standard implementation-review loop |
| `iterative-implementation-review-auto` | `skills/iterative-implementation-review/iterative-implementation-review-auto/` | Auto-first implementation-review loop |
| `landable-implementation-loop` | `skills/landable-implementation-loop/` | User-facing workflow entry point and final gate |
| `grill-me` | `skills/external/grill-me/` | Third-party critique companion |

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

## Installation

You can use this repository in two practical ways.

For a fuller cross-agent guide, see [docs/installation.md](D:/FakeC/MCP/offiiceMCP/_mergework/implementation-workflows/docs/installation.md).

### Install the full workflow

Copy the installable skill directories into your Codex or shared agent skills folder using the installed skill names shown above.

For Codex on Windows, a typical global layout is:

```text
C:\Users\<you>\.codex\skills\
  parallel-decomposer-skill\
  parallel-decomposer-auto\
  code-analyzer-suite\
  code-analyzer-auto\
  iterative-implementation-review\
  iterative-implementation-review-auto\
  landable-implementation-loop\
  grill-me\
```

The auto variants live inside the first-party skill folders in this repository, so install them as separate top-level skill directories if your runtime discovers skills by folder name.

The most common mistake in this repository is copying a suite folder instead of the actual installable skill folder. The safe rule is:

- copy the directory that directly contains the `SKILL.md` for the installed skill name you want
- use [skills/README.md](D:/FakeC/MCP/offiiceMCP/_mergework/implementation-workflows/skills/README.md) when in doubt

### Install one skill only

If you only want one capability, copy just that skill directory:

- `skills/parallel-decomposer-skill/`
- `skills/parallel-decomposer-skill/parallel-decomposer-auto/`
- `skills/code-analyzer-suite/`
- `skills/code-analyzer-suite/code-analyzer-auto/`
- `skills/iterative-implementation-review/iterative-implementation-review/`
- `skills/iterative-implementation-review/iterative-implementation-review-auto/`
- `skills/landable-implementation-loop/`

### Third-party companion skill

If you also want the critique layer, copy:

- `skills/external/grill-me/`

Keep its `LICENSE` and `UPSTREAM.md` with the skill when redistributing it.

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

The repository uses two different shapes:

- suite folders such as `skills/code-analyzer-suite/` and `skills/parallel-decomposer-skill/`
- single-skill folders such as `skills/landable-implementation-loop/`

The iterative suite is slightly different because both installable skills live under one wrapper folder:

- `skills/iterative-implementation-review/iterative-implementation-review/`
- `skills/iterative-implementation-review/iterative-implementation-review-auto/`

## Naming

Suggested repository names:

- `implementation-workflows`
- `agent-workflow-suite`
- `landable-implementation-loop`

If this repository is meant to host more workflows over time, `implementation-workflows` is the cleanest umbrella name.
