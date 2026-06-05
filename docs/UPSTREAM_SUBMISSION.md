# Upstream Submission Plan

This document captures the recommended path for proposing this workflow suite to larger open-source ecosystems.

## Recommended first submission

Submit `landable-implementation-loop` as the first standalone skill.

Reason:

- it has one clear user-facing purpose
- it does not require maintainers to understand the whole multi-repository lineage first
- it can be evaluated as a single workflow skill
- it represents the strongest idea in the suite: finishing implementation work only after review, critique, and validation

## Do not submit the full repository first

The full `implementation-workflows` repository is useful as the home distribution, but it is too broad for a first upstream contribution.

Submitting the whole suite first would require reviewers to evaluate:

- manual and auto variants
- multiple skill families
- third-party vendored material
- cross-agent installers
- repository history and source relationships

That is a much larger review than a focused flagship skill.

## Candidate target repositories

### Anthropic Agent Skills

Repository:

- https://github.com/anthropics/skills

Why it fits:

- it uses the `SKILL.md` folder model
- it documents reusable Agent Skills as a distribution primitive
- `landable-implementation-loop` can stand alone as a development workflow skill

Preparation needed:

- keep the standalone folder minimal
- include `SKILL.md`, `README.md`, and `LICENSE`
- avoid runtime-specific assumptions in the first submission
- describe the companion skills as optional rather than required
- use [ANTHROPIC_SKILLS_PR_DRAFT.md](ANTHROPIC_SKILLS_PR_DRAFT.md) as the starting PR text

### GitHub Agentic Workflows

Reference:

- https://github.github.com/gh-aw/

Why it partly fits:

- the theme is close: agentic workflows for development work
- it has a stronger runtime and GitHub Actions focus

Why it should not be first:

- the current repository is skill-folder based, not GitHub Actions workflow based
- a good contribution would need a separate GitHub Agentic Workflow version of the idea

## Suggested PR framing

Title:

- Add landable implementation loop skill for shippable coding tasks

Short description:

- Adds a development workflow skill that guides coding agents through scoped implementation, changed-surface review, adversarial critique, layered validation, and concise readiness reporting.

What to emphasize:

- the skill is workflow-oriented, not tool-specific
- it is useful when a task must end in a verified, usable result
- it keeps packaging and integration checks visible
- companion skills are optional accelerators, not hard dependencies

What not to emphasize first:

- the full multi-repo history
- private local setup
- Codex-specific behavior
- the complete manual and auto workflow suite

## Standalone folder checklist

Before submitting, the standalone folder should contain:

- `SKILL.md`
- `README.md`
- `LICENSE`

It should not contain:

- local machine paths
- private repository references
- corrupted non-ASCII text
- instructions that require one specific agent runtime
- vendored third-party content

## Review posture

Expect maintainers to ask whether this is a reusable skill or just a personal workflow. The answer should be evidence-based:

- the trigger condition is broad and common
- the workflow is organized into clear gates
- it works with optional companion skills but does not depend on them
- it names validation as part of completion, not as an afterthought
