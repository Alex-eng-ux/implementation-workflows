# Architecture

This repository packages a layered workflow rather than a single monolithic skill.

## Architectural idea

The suite separates four concerns:

1. decomposition
2. changed-surface review
3. implementation and repair looping
4. final landability judgment

That separation keeps prompts smaller, responsibilities clearer, and installation more modular.

## Layer model

### Decomposition layer

- `parallel-decomposer-skill`
- `parallel-decomposer-auto`

Job:

- split broad work into ownership-safe subtasks
- preserve a shared handoff brief
- avoid unsafe parallel edits

### Review layer

- `code-analyzer-suite`
- `code-analyzer-auto`

Job:

- inspect changed code across focused dimensions
- produce findings-first review output
- consolidate risks before closure

### Workflow layer

- `iterative-implementation-review`
- `iterative-implementation-review-auto`

Job:

- orchestrate implementation, critique, repair, and verification
- convert findings into concrete next actions
- keep the loop moving until the result survives review

### Landability layer

- `landable-implementation-loop`

Job:

- act as the top-level entry point
- decide whether the result is actually ready to ship or hand off

### Companion critique layer

- `grill-me`

Job:

- pressure-test assumptions
- expose hidden risks and tradeoffs

This companion is intentionally separate from the main controller so its role stays adversarial rather than managerial.

## Repository model

This repository is the integration and distribution layer above three source repositories:

- `parallel-decomposer-skill`
- `code-analyzer-suite`
- `iterative-implementation-review`

It also packages:

- `landable-implementation-loop` as the top-level entry point
- `grill-me` as an attributed third-party companion

## Why not one giant skill

One giant skill tends to blur responsibilities, overfit to one runtime, and become hard to maintain. The layered model keeps:

- narrower prompts
- clearer ownership
- better portability
- easier selective installation
- more honest compatibility boundaries

## Evolution model

The suite evolved in three stages:

1. manual or hybrid workflow generation
2. auto-oriented workflow generation
3. integrated multi-agent distribution

That history matters because it explains why both manual and auto variants exist: they solve the same subject, but for different execution models.
