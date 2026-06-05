# landable-implementation-loop

`landable-implementation-loop` is the top-level workflow skill in this repository.

It is for coding tasks that should end in a genuinely usable result, not a plausible patch or a polished analysis.

## What it does

This skill pushes work through five gates:

1. scope the user-visible outcome
2. implement the smallest complete slice
3. review the changed surface
4. pressure-test assumptions
5. verify packaging, installation, or integration when relevant

In practice, it acts as the final readiness gate above the lower-level decomposition, review, and repair skills.

## When to use it

Use this skill when the user wants outcomes such as:

- "make this project actually usable"
- "keep going until it really works"
- "don't stop at analysis"
- "make this releasable"

## Companion skills

This skill can run on its own. It works better when the runtime also has:

- `parallel-decomposer-skill` or `parallel-decomposer-auto`
- `code-analyzer-suite` or `code-analyzer-auto`
- `iterative-implementation-review` or `iterative-implementation-review-auto`
- `grill-me`

Those companion skills are accelerators, not hard dependencies. The skill should stay the top-level controller rather than absorb those responsibilities into one oversized prompt.

## Why this skill is separate

Many agent workflows can generate code, but fewer can reliably answer:

- does the public surface actually expose the behavior
- do packaging and install paths still work
- has a real integration path been exercised
- are the remaining risks small and explicit

This skill exists to keep that finish-line standard visible.

## Repository role

Inside `implementation-workflows`, this is the main user-facing entry point.

If you only install one skill from this repository, this is usually the best starting choice.
