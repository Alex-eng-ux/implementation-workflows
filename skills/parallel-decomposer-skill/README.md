# parallel-decomposer-skill

This repository contains two related skills:

- `parallel-decomposer-skill`: the original version, optimized for explicit task cards and manual multi-window workflows.
- `parallel-decomposer-auto`: the auto-orchestration version, optimized for runtimes that can dispatch sub-agents or worker threads automatically.

Use the original skill when you want visible worker prompts and manual control. Use the auto version when the runtime can orchestrate parallel workers directly.

## Skills In This Repo

### `parallel-decomposer-skill`

- Splits complex work into structured task cards
- Includes dependency checks, handoff brief generation, and merge guidance
- Works well for manual multi-window or hybrid workflows

### `parallel-decomposer-auto`

- Produces orchestration-ready worker specs instead of emphasizing copy-paste windows
- Assumes automatic sub-agent dispatch when available
- Falls back to manual prompts only when the runtime cannot orchestrate workers
- Uses phased sequencing instead of forcing unsafe parallel edits

## What It Does

These skills help break complex work into 3-7 independent subtasks that can run in parallel. They handle:

- Task analysis: understand the domain, goal, and constraints
- Smart decomposition: split work into independent units
- Dependency detection: avoid hidden ordering or file-ownership conflicts
- Context preservation: keep a shared handoff brief across workers
- Result integration: provide a merge strategy for the final result

## Related Skill

For code-specific parallel analysis, use [code-analyzer-suite](https://github.com/Alex-eng-ux/code-analyzer-suite).

## Installation

### Quick Install

```bash
./install.sh
```

The quick installer targets the original `parallel-decomposer-skill`. Install `parallel-decomposer-auto` as a separate skill directory when your runtime supports auto-discovery of multiple skills.

### Install Auto Skill

```bash
cp -R parallel-decomposer-auto ~/.codex/skills/parallel-decomposer-auto
cp -R parallel-decomposer-auto ~/.agents/skills/parallel-decomposer-auto
```

Use the first path for Codex and the second path for universal agent runtimes. On Windows, copy `parallel-decomposer-auto` to the matching skills directory for your tool.

### Manual Install

| Platform | Path |
| --- | --- |
| Claude Code | `~/.claude/skills/parallel-decomposer-skill` |
| GitHub Copilot | `~/.copilot/skills/parallel-decomposer-skill` |
| VS Code Copilot | `.github/skills/parallel-decomposer-skill` |
| Cursor | `.cursor/skills/parallel-decomposer-skill` |
| Windsurf | `.windsurf/rules/parallel-decomposer-skill` or `~/.codeium/windsurf/skills/parallel-decomposer-skill` |
| Cline | `~/.cline/skills/parallel-decomposer-skill` |
| Trae | `.trae/rules/parallel-decomposer-skill` |
| Gemini CLI | `~/.gemini/skills/parallel-decomposer-skill` |
| Goose | `~/.config/goose/skills/parallel-decomposer-skill` |
| OpenCode | `~/.config/opencode/skills/parallel-decomposer-skill` |
| Roo Code | `~/.roo/skills/parallel-decomposer-skill` |
| Universal | `~/.agents/skills/parallel-decomposer-skill` |

## Usage

### Original Skill

```text
/parallel-decomposer Analyze this codebase for security vulnerabilities, performance issues, and code quality
/parallel-decomposer Write a comprehensive report about AI trends covering technical, business, and ethical aspects
/parallel-decomposer Review this pull request for logic errors, style issues, and documentation completeness
```

### Auto Skill

```text
Use $parallel-decomposer-auto to split this work into orchestration-ready worker specs with a shared handoff brief and merge plan.
```

## How It Works

1. You provide a complex task.
2. The skill analyzes the task and identifies a useful split.
3. The skill creates a shared handoff brief.
4. The runtime dispatches worker specs to sub-agents when supported.
5. Fallback: if automatic dispatch is unavailable, you can still copy prompts manually.
6. The skill provides a merge strategy for the final result.

## Repository Structure

```text
parallel-decomposer-skill/
|-- SKILL.md
|-- AGENTS.md
|-- parallel-decomposer-auto/
|   |-- SKILL.md
|   |-- AGENTS.md
|   |-- agents/openai.yaml
|   |-- assets/worker-spec-template.md
|   |-- references/orchestration-patterns.md
|   `-- evals/parallel-decomposer-auto.eval.md
|-- agents/
|-- assets/
|-- references/
|-- scripts/
`-- evals/
```

## License

MIT
