# Landable Loop

This workflow is for tasks where "done" means usable, releasable, or trustworthy in real operation.

## Core Rule

Do not stop at code edits.

A task is finished only when:

- the requested behavior exists
- the public surface exposes it
- the relevant checks pass
- packaging or installation works when relevant
- real integration has been exercised when relevant

## Default Sequence

1. Restate the user-visible outcome.
2. Inventory the actual touch points.
3. Decompose only when it improves ownership and speed.
4. Implement the smallest complete slice.
5. Review the changed surface for blocking risk.
6. Stress-test assumptions.
7. Validate in layers.
8. Close only on verified readiness.

## Companion Relationship

The usual orchestration is:

1. `landable-implementation-loop` as the entry point and final gate
2. `iterative-implementation-review` as the repair loop
3. `parallel-decomposer-skill` as the decomposition layer
4. `code-analyzer-suite` as the review layer
5. `grill-me` as the adversarial critique layer
