# Compatibility

This repository is designed to be agent-agnostic, but not every runtime supports the same discovery rules, prompt semantics, or worker orchestration model.

## Support levels

| Runtime | Intended support level | Notes |
| --- | --- | --- |
| Codex | first-class | primary authoring environment for this suite |
| Claude Code | first-class | straightforward skill-folder installation model |
| GitHub Copilot | best effort | project or user setup may vary by host surface |
| VS Code Copilot skills | best effort | verify skill discovery conventions in the target environment |
| Cursor | best effort | installer may add compatibility adapter files |
| Windsurf | best effort | installer may add compatibility adapter files |
| Cline | best effort | filesystem layout is usually the main concern |
| Trae | best effort | installer may add compatibility adapter files |
| Gemini CLI | best effort | manual verification recommended |
| Goose | best effort | manual verification recommended |
| OpenCode | best effort | manual verification recommended |
| Roo Code | best effort | manual verification recommended |
| Kiro | experimental | treat as compatibility target, not guaranteed baseline |
| `~/.agents/skills` style runtimes | best effort | useful as a neutral distribution path |

## Manual versus auto variants

Use the standard variants when:

- the runtime expects visible prompts
- worker dispatch is manual or hybrid
- copy-paste task cards are still useful

Use the auto variants when:

- the runtime can dispatch sub-agents or worker threads directly
- the orchestration layer can preserve a shared brief
- the environment benefits from machine-oriented worker specs

## Known portability constraints

- runtimes differ in skill discovery folder rules
- some runtimes flatten directory depth while others preserve nested folders
- some environments support orchestration semantics only through conventions, not native features
- install adapters may be needed for Cursor, Trae, or Windsurf

## Validation guidance

For a target runtime, verify at least:

1. the installed skill names are discovered correctly
2. the runtime can read the intended `SKILL.md`
3. linked support files remain reachable after installation
4. manual or auto usage expectations match the runtime's capabilities

## Adoption advice for organizations

If your team wants one default starting point, standardize on:

- `landable-implementation-loop`

Then add the lower-level skills only when your runtime or operating model can benefit from them directly.
