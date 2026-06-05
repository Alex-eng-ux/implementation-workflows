# Anthropic Skills PR Draft

This draft is for proposing `landable-implementation-loop` as a standalone skill to the Anthropic Agent Skills repository.

Target repository:

- https://github.com/anthropics/skills

## PR title

Add landable implementation loop skill for shippable coding tasks

## PR description

### Summary

This PR adds `landable-implementation-loop`, a development workflow skill for coding tasks that should end in a verified, usable result rather than a plausible first-pass patch.

The skill guides an agent through:

- scoping the user-visible outcome
- implementing the smallest complete slice
- reviewing the changed surface
- pressure-testing assumptions
- validating packaging, installation, or integration paths when relevant
- reporting remaining caveats clearly

### Why this is useful

Coding agents often produce output that looks complete before it has been challenged through public-surface review, packaging checks, or integration validation. This skill gives agents a reusable finish-line standard for implementation work that needs to be shippable or handoff-ready.

### Scope

This contribution is intentionally limited to the standalone `landable-implementation-loop` skill.

It does not require:

- a specific agent runtime
- a specific programming language
- automatic sub-agent orchestration
- any companion skill to be installed

Companion review or decomposition skills can improve the workflow when available, but they are optional accelerators rather than hard dependencies.

### Files

Proposed standalone folder:

```text
landable-implementation-loop/
  SKILL.md
  README.md
  LICENSE
```

### Notes for maintainers

The skill is workflow-oriented rather than tool-specific. It should be useful anywhere an agent is asked to continue past analysis into implementation, repair, validation, and concise readiness reporting.

## Standalone folder source

Use this repository path as the source for the proposed standalone folder:

```text
skills/landable-implementation-loop/
```

Before opening the PR, re-check that the folder contains only:

- `SKILL.md`
- `README.md`
- `LICENSE`

and that the content contains no local paths, runtime-specific assumptions, or vendored third-party files.
