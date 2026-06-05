# Implementation Workflows

Implementation Workflows is an agent-agnostic workflow suite for coding tasks that need more than a single prompt pass. It packages decomposition, changed-surface review, adversarial critique, repair loops, and final landability checks into one installable distribution.

The goal is simple: help coding agents produce outcomes that are easier to trust, easier to review, and easier to ship.

## Why this repository exists

Most agent workflows stop at "the code looks plausible." This repository is for teams that want a stronger operating model:

- split broad work into ownership-safe tracks
- review the changed surface instead of trusting first-pass output
- challenge assumptions before declaring success
- keep iterating until the result is actually usable
- support both manual and auto-oriented runtimes

This repository is the integration layer for that workflow, not just a loose bundle of prompts.

## Who this is for

- teams using coding agents for implementation work
- maintainers who want reusable review and repair workflows
- runtimes that discover skills from filesystem folders
- users who need one distribution that works across multiple agent ecosystems

## What is included

### First-party skills

- `parallel-decomposer-skill`: manual or hybrid task decomposition
- `parallel-decomposer-auto`: auto-oriented worker planning
- `code-analyzer-suite`: multidimensional changed-surface review
- `code-analyzer-auto`: auto-oriented review orchestration
- `iterative-implementation-review`: repair and verification loop
- `iterative-implementation-review-auto`: auto-first repair and verification loop
- `landable-implementation-loop`: top-level workflow entry point and final readiness gate

### Third-party companion skill

- `grill-me`: adversarial critique and pressure-testing

`grill-me` remains a third-party component. Keep its attribution and license materials intact when redistributing it.

## Quick start

If you want one default entry point, start with:

- `landable-implementation-loop`

If you want the full stack, install:

- `parallel-decomposer-skill`
- `parallel-decomposer-auto`
- `code-analyzer-suite`
- `code-analyzer-auto`
- `iterative-implementation-review`
- `iterative-implementation-review-auto`
- `landable-implementation-loop`
- `grill-me`

Install map:

- [skills/README.md](skills/README.md)

Cross-platform installer examples:

```bash
./install.sh --all-skills --platform codex
./install.sh --all-skills --all-platforms
```

```powershell
.\install.ps1 -AllSkills -Platform codex
.\install.ps1 -AllSkills -AllPlatforms
```

## Recommended operating model

For broad or risky work, the intended flow is:

1. Split the work with `parallel-decomposer-skill` or `parallel-decomposer-auto`.
2. Implement and iterate with `iterative-implementation-review` or its auto variant.
3. Review the changed surface with `code-analyzer-suite` or its auto variant.
4. Pressure-test assumptions with `grill-me`.
5. Let `landable-implementation-loop` decide whether the finish line is credible.

That sequence is meant to reduce a common failure mode in agentic coding: elegant-looking output that was never truly challenged.

## Manual and auto workflow generations

This repository packages two workflow generations and one integrated entry point.

### Generation 1: manual or hybrid

- `parallel-decomposer-skill`
- `code-analyzer-suite`
- `grill-me`
- `iterative-implementation-review`

This path is optimized for visible prompts, manual multi-window use, and explicit control.

### Generation 2: auto-oriented

- `parallel-decomposer-auto`
- `code-analyzer-auto`
- `grill-me`
- `iterative-implementation-review-auto`

This path is optimized for runtimes that can dispatch workers or sub-agents directly.

### Final integrated suite

`implementation-workflows` packages both generations together and adds:

- `landable-implementation-loop` as the main user-facing entry
- unified installers
- cross-agent installation guidance
- a clearer top-level story for adoption and redistribution

## How this repository relates to the source repositories

This repository is the packaged integration layer, not the original authoring home of every first-party skill.

Primary source repositories:

- decomposition layer: [Alex-eng-ux/parallel-decomposer-skill](https://github.com/Alex-eng-ux/parallel-decomposer-skill)
- review layer: [Alex-eng-ux/code-analyzer-suite](https://github.com/Alex-eng-ux/code-analyzer-suite)
- workflow layer: [Alex-eng-ux/iterative-implementation-review](https://github.com/Alex-eng-ux/iterative-implementation-review)

Use the source repositories when you want to evolve one skill family in isolation. Use `implementation-workflows` when you want one installable distribution with one coherent workflow story.

## Compatibility

This suite is designed to be agent-agnostic. It is intended to work with runtimes such as:

- Codex
- Claude Code
- GitHub Copilot and VS Code Copilot project skills
- Cursor
- Windsurf
- Cline
- Trae
- Gemini CLI
- Goose
- OpenCode
- Roo Code
- Kiro
- generic shared skill directories such as `~/.agents/skills`

For the current support model and caveats, see [docs/COMPATIBILITY.md](docs/COMPATIBILITY.md).

## Repository layout

```text
implementation-workflows/
  README.md
  LICENSE
  THIRD_PARTY_NOTICES.md
  CONTRIBUTING.md
  SECURITY.md
  docs/
    ANTHROPIC_SKILLS_PR_DRAFT.md
    ARCHITECTURE.md
    COMPATIBILITY.md
    UPSTREAM_SUBMISSION.md
    installation.md
    workflows/
      landable-loop.md
      skill-relationships.md
  skills/
    parallel-decomposer-skill/
    code-analyzer-suite/
    iterative-implementation-review/
    landable-implementation-loop/
    external/
      grill-me/
```

## Installable skill map

| Installed skill name | Source directory in this repo | Purpose |
| --- | --- | --- |
| `parallel-decomposer-skill` | `skills/parallel-decomposer-skill/` | Manual or hybrid task decomposition |
| `parallel-decomposer-auto` | `skills/parallel-decomposer-skill/parallel-decomposer-auto/` | Auto-oriented decomposition |
| `code-analyzer-suite` | `skills/code-analyzer-suite/` | Manual or hybrid multidimensional code review |
| `code-analyzer-auto` | `skills/code-analyzer-suite/code-analyzer-auto/` | Auto-oriented review orchestration |
| `iterative-implementation-review` | `skills/iterative-implementation-review/iterative-implementation-review/` | Manual or standard implementation-review loop |
| `iterative-implementation-review-auto` | `skills/iterative-implementation-review/iterative-implementation-review-auto/` | Auto-first implementation-review loop |
| `landable-implementation-loop` | `skills/landable-implementation-loop/` | Main workflow entry point and final gate |
| `grill-me` | `skills/external/grill-me/` | Third-party critique companion |

## Installation

Use the root installers for most setups:

- [docs/installation.md](docs/installation.md)

The most common installation mistake is copying a wrapper directory instead of the actual installable skill directory. The safe rule is:

- copy the directory that directly contains the `SKILL.md` for the installed skill name
- use [skills/README.md](skills/README.md) when in doubt

## Governance and adoption notes

If you want to evaluate this repository for organization-wide use, start with:

- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- [docs/COMPATIBILITY.md](docs/COMPATIBILITY.md)
- [docs/UPSTREAM_SUBMISSION.md](docs/UPSTREAM_SUBMISSION.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [SECURITY.md](SECURITY.md)

## Third-party attribution

Third-party components should remain under `skills/external/`.

For `grill-me`, keep these files together:

- `SKILL.md`
- `LICENSE`
- `UPSTREAM.md`

Also maintain the root-level [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## License

MIT
