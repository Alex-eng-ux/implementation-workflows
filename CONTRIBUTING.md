# Contributing

Thanks for contributing. This repository is meant to stay useful across multiple agent runtimes, so changes should improve the workflow without overfitting it to one tool.

## What we welcome

- clearer skill boundaries
- better installation and portability guidance
- improved evaluation material and examples
- compatibility fixes for supported agent runtimes
- documentation that makes adoption easier for new teams

## What good changes look like

- one skill still has one primary job
- manual and auto variants stay aligned in subject matter
- integration docs match the real repository layout
- third-party materials remain clearly attributed
- changes make the workflow easier to adopt, validate, or maintain

## Before opening a pull request

1. Confirm which installed skill names are affected.
2. Update any install or path guidance that changed.
3. Keep references to third-party content accurate.
4. Check whether the change belongs in a source repository instead of only in this integration repository.

## Repository boundaries

Use this repository for:

- integrated workflow packaging
- cross-agent installation guidance
- top-level workflow documentation
- distribution-ready skill layout

Prefer the source repositories for:

- changes to one skill family in isolation
- lower-level evolution of decomposition, review, or workflow internals

## Pull request guidance

In your PR description, include:

- the user-visible purpose of the change
- which installed skills are affected
- whether the change is runtime-specific or agent-agnostic
- any compatibility or redistribution implications

## Third-party materials

Third-party skills and files must keep their upstream attribution, license text, and provenance notes. Do not reframe third-party content as first-party work.

## Code of collaboration

Be specific, kind, and evidence-driven. The goal is not only to improve prompts or docs, but to improve whether teams can actually rely on this workflow.
