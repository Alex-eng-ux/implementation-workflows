# Installation Guide

This repository is designed to work across multiple agent runtimes, not only Codex.

## Supported Targets

- Claude Code
- GitHub Copilot
- VS Code Copilot project skills
- Cursor
- Windsurf
- Cline
- Trae
- Gemini CLI
- Goose
- OpenCode
- Roo Code
- Kiro
- Codex
- universal agent path under `~/.agents/skills`

## Recommended Install Paths

Use the root installers:

```bash
./install.sh --all-skills --platform codex
./install.sh --all-skills --all-platforms
./install.sh --skill landable-implementation-loop --skill grill-me --platform claude
```

On Windows PowerShell:

```powershell
.\install.ps1 -AllSkills -Platform codex
.\install.ps1 -AllSkills -AllPlatforms
.\install.ps1 -Skill landable-implementation-loop,grill-me -Platform claude
```

## Skill Selection

For the full workflow, install:

- `parallel-decomposer-skill`
- `parallel-decomposer-auto`
- `code-analyzer-suite`
- `code-analyzer-auto`
- `iterative-implementation-review`
- `iterative-implementation-review-auto`
- `landable-implementation-loop`
- `grill-me`

If you only want the top-level entry point, install:

- `landable-implementation-loop`

If you want the default full critique path, add:

- `grill-me`

## Notes

- `grill-me` is third-party. Keep its `LICENSE` and `UPSTREAM.md` when redistributing it.
- Auto variants live inside suite folders in this repository, but the root installers install them under their own top-level skill names.
- Cursor, Trae, and Windsurf get small compatibility adapter files during installation.
