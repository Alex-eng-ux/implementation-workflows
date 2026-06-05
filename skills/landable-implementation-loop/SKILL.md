---
name: landable-implementation-loop
description: Drive a coding task to a genuinely shippable state through scoped implementation, changed-surface review, adversarial self-critique, packaging checks, and real integration validation. Use when the user wants a project made usable, deployable, releasable, or "可落地" instead of merely analyzed.
---

# Landable Implementation Loop

Use this skill when the user wants a real outcome, not a partial patch or a paper plan.

This skill is especially useful when:

- a repo looks promising but is not yet trustworthy
- CI appears green only because meaningful checks are missing
- the public API or MCP tool surface may not match the implemented behavior
- packaging, installation, or runtime integration matters
- the user explicitly wants the work taken all the way to "usable"

## Core idea

Treat "done" as a verified product state, not a code-edit state.

A change is not finished just because:

- code compiles
- tests pass in a narrow path
- a README looks better
- a tool appears in a registry

It is finished when the requested behavior is implemented, exposed through the public surface, validated through the right layers, and any remaining caveats are explicit and small.

## Companion Skills Contract

This skill is a global entry point for a four-skill implementation workflow. It should actively orchestrate the companion skills by default when they are available and relevant.

Use this control hierarchy:

1. `landable-implementation-loop` is the user-facing entry point and final readiness gate.
2. `iterative-implementation-review-auto` is the preferred loop controller for complex or repeated repair work.
3. `parallel-decomposer-auto` is the decomposition and sub-agent dispatch layer.
4. `code-analyzer-auto` is the changed-surface review layer.
5. `grill-me` is the non-interactive adversarial critique layer.

When the user explicitly invokes `landable-implementation-loop`, default behavior is:

- read this skill first, then read the directly relevant companion skill bodies before applying them
- if the task is complex, use `iterative-implementation-review-auto` as the main repair/review/verification loop
- use `parallel-decomposer-auto` to split broad work into ownership-safe tracks when parallel work is useful
- use `code-analyzer-auto` to review the changed surface after each meaningful implementation or repair round
- use `grill-me` in non-interactive mode to pressure-test assumptions and convert plausible failure modes into repair todos
- keep `landable-implementation-loop` responsible for the final "is this genuinely usable?" judgment

For small tasks, do not force unnecessary sub-agent dispatch. Still preserve the same gates in miniature: scope, implement, review, critique, verify.

If one companion skill is unavailable in the current environment, keep the same workflow shape and perform that step manually rather than dropping it entirely. Stop only when the user explicitly required that exact automatic skill and no fallback is acceptable.

## Invocation rule

When the user explicitly names `landable-implementation-loop`, treat that as a request to run the full landable workflow, not just to do a normal implementation pass.

Minimum expected behavior after invocation:

- build a scoped implementation plan
- decide whether the task needs decomposition
- review the changed surface, not only the final code
- self-critique before stopping
- run layered verification
- continue repair loops until the remaining issues are non-blocking or an external blocker is real

Equivalent Chinese trigger phrases include:

- `按可落地工作流做`
- `修到能上线再停`
- `做到真能用`
- `别停在分析`
- `连上自己调试一下`

## Default loop

### 1. Restate the user-visible outcome

Before editing, say what the user should be able to do after the change.

Examples:

- "Codex can load this MCP server globally and successfully call a real tool."
- "The release pipeline can build and smoke-install a wheel without pretending the whole legacy repo is lint-clean."
- "A PowerPoint tool no longer registers successfully while failing on first use."

### 2. Inventory the real touch points

Identify the minimum real surface involved:

- public entry points
- runtime modules
- packaging metadata
- CI or release workflow
- tests
- integration path

Prefer reading the tool-facing layer before assuming the operations layer is enough.

### 3. Decompose by ownership, not by theater

If the task is large, split it into independent tracks with clear ownership.

Good splits:

- runtime fixes
- release/CI fixes
- integration/debug path
- changed-surface review

Bad splits:

- multiple workers editing the same unstable file
- multiple reviewers repeating the same observation
- a worker doing analysis that blocks the very next local action

If sub-agents are available and authorized, use them for sidecar work while you keep the critical path moving locally.

### 4. Implement the smallest complete slice

Prefer a completed vertical slice over shallow edits in many places.

Examples:

- public helper imports fixed and covered by a focused tool-surface test
- path contract fixed and verified through public tool calls
- packaging metadata corrected and validated by wheel install

Keep edits aligned with the codebase's current architecture unless a local refactor is required for correctness.

### 5. Review the changed surface for blocking risk

Do not reduce review to style.

Look for:

- undefined helper references
- wrong app/file activation logic
- path validation gaps
- broken entry points
- misleading or impossible CI gates
- build/install drift
- a mismatch between what docs claim and what the public surface exposes

Keep the focus on issues that could stop a real user or release.

### 6. Stress-test your own assumptions

Ask, non-interactively:

- what user-visible path still fails
- what did I claim without directly validating
- what happens with relative, missing, hostile, or blocked inputs
- what only works from the internal module but not from the public surface
- what passes locally but would fail after packaging or installation
- what depends on machine state, Office COM, or global config

Turn concrete answers into repair tasks. Ignore vague anxiety; fix plausible failure modes.

### 7. Validate in layers

Run validation from cheapest to most real:

1. Focused correctness lint or syntax checks
2. Focused tests
3. Build or packaging checks
4. Install or entry-point checks
5. Real integration checks

Examples:

```bash
python -m pytest tests
python count_tools.py --min-total 300 --require-prefix excel_ --require-prefix word_ --require-prefix ppt_
python -m build --wheel
```

For MCP or service-style projects, do not stop before a real client call if the user expects actual usability.

### 8. Close only on verified readiness

The task is ready to close when:

- requested behavior exists
- public surface exposes it
- focused checks pass
- packaging/install path works when relevant
- real integration has been exercised when relevant
- remaining caveats are clearly named and non-blocking

## Guidance for legacy repositories

Many repos contain historical style debt or oversized files. Do not confuse legacy cleanup with release readiness.

When a repository is not uniformly clean:

- keep correctness checks blocking
- narrow style gates to the changed support files or realistic hotspots
- avoid claiming the whole repo is clean if it is not
- prefer an honest green pipeline over a fake all-or-nothing gate

## MCP-specific guidance

For MCP servers, the minimum credible finish line is usually:

- server starts
- tools register
- a real client connects
- at least one representative tool call succeeds

If the task involves global client setup, also verify that the client actually loads the server after configuration, not just that the config file was edited.

## Anti-patterns

Avoid these:

- stopping at README edits when runtime is still broken
- claiming support based on lower-level functions when public tools still fail
- shipping with a CI gate that cannot pass against the actual repository
- marking work complete without a real integration call when the user asked for usability
- doing broad refactors when one narrow runtime fix would close the loop

## Suggested trigger phrases

This skill should be used when the user says things like:

- "把这个修成可落地的项目"
- "keep going until it really works"
- "don’t stop at analysis"
- "make this releasable"
- "ship this properly"
- "connect it and debug it yourself"

## Deliverable shape

When you finish, report:

- what was implemented
- what was reviewed
- what was repaired after critique
- what validation actually ran
- what still remains, if anything

Keep the report evidence-based and concise.
