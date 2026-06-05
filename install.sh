#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false
PROJECT_LEVEL=false
PLATFORM=""
ALL_PLATFORMS=false
ALL_SKILLS=false

SKILL_NAMES=(
  "parallel-decomposer-skill"
  "parallel-decomposer-auto"
  "code-analyzer-suite"
  "code-analyzer-auto"
  "iterative-implementation-review"
  "iterative-implementation-review-auto"
  "landable-implementation-loop"
  "grill-me"
)

usage() {
  cat <<'EOF'
Usage: ./install.sh [OPTIONS]

Install one or more skills from this repository into a supported agent runtime.

OPTIONS
  --skill <name>        Install a specific skill. Repeatable.
  --all-skills          Install the full workflow set.
  --platform <name>     Install to a specific platform.
  --all-platforms       Install to all detected platforms.
  --project             Prefer project-level paths when a platform supports them.
  --dry-run             Show what would be installed without copying files.
  -h, --help            Show this help.

SUPPORTED PLATFORMS
  claude, copilot, copilot-project, cursor, windsurf, cline, trae,
  gemini, goose, opencode, roo-code, kiro, codex, universal

EXAMPLES
  ./install.sh --all-skills --platform codex
  ./install.sh --skill landable-implementation-loop --skill grill-me --platform claude
  ./install.sh --all-skills --all-platforms --dry-run
EOF
}

info() { printf '[INFO] %s\n' "$*"; }
warn() { printf '[WARN] %s\n' "$*"; }
error() { printf '[ERROR] %s\n' "$*" >&2; }

declare -a REQUESTED_SKILLS=()

skill_source_dir() {
  case "$1" in
    parallel-decomposer-skill) echo "$SCRIPT_DIR/skills/parallel-decomposer-skill" ;;
    parallel-decomposer-auto) echo "$SCRIPT_DIR/skills/parallel-decomposer-skill/parallel-decomposer-auto" ;;
    code-analyzer-suite) echo "$SCRIPT_DIR/skills/code-analyzer-suite" ;;
    code-analyzer-auto) echo "$SCRIPT_DIR/skills/code-analyzer-suite/code-analyzer-auto" ;;
    iterative-implementation-review) echo "$SCRIPT_DIR/skills/iterative-implementation-review/iterative-implementation-review" ;;
    iterative-implementation-review-auto) echo "$SCRIPT_DIR/skills/iterative-implementation-review/iterative-implementation-review-auto" ;;
    landable-implementation-loop) echo "$SCRIPT_DIR/skills/landable-implementation-loop" ;;
    grill-me) echo "$SCRIPT_DIR/skills/external/grill-me" ;;
    *)
      error "Unknown skill: $1"
      return 1
      ;;
  esac
}

detect_platforms() {
  local platforms=()

  [[ -d "$HOME/.claude" ]] && platforms+=("claude")
  [[ -d "$HOME/.copilot" ]] && platforms+=("copilot")
  ([[ -d ".github" ]] || [[ -d "$HOME/.github" ]]) && platforms+=("copilot-project")
  ([[ -d ".cursor" ]] || [[ -d "$HOME/.cursor" ]]) && platforms+=("cursor")
  ([[ -d "$HOME/.codeium/windsurf" ]] || [[ -d ".windsurf" ]]) && platforms+=("windsurf")
  ([[ -d "$HOME/.cline" ]] || [[ -d ".clinerules" ]]) && platforms+=("cline")
  ([[ -d ".trae" ]] || [[ -d "$HOME/.trae" ]]) && platforms+=("trae")
  [[ -d "$HOME/.gemini" ]] && platforms+=("gemini")
  [[ -d "$HOME/.config/goose" ]] && platforms+=("goose")
  ([[ -d "$HOME/.config/opencode" ]] || [[ -d ".opencode" ]]) && platforms+=("opencode")
  ([[ -d "$HOME/.roo" ]] || [[ -d ".roo" ]]) && platforms+=("roo-code")
  ([[ -d "$HOME/.kiro" ]] || [[ -d ".kiro" ]]) && platforms+=("kiro")
  ([[ -d "$HOME/.codex" ]] || [[ -d "$HOME/.agents" ]]) && platforms+=("codex")

  if [[ "${#platforms[@]}" -eq 0 ]]; then
    platforms+=("universal")
  fi

  printf '%s\n' "${platforms[@]}"
}

get_install_base() {
  case "$1" in
    claude) echo "$HOME/.claude/skills" ;;
    copilot) echo "$HOME/.copilot/skills" ;;
    copilot-project) echo ".github/skills" ;;
    cursor) echo ".cursor/skills" ;;
    windsurf)
      if [[ -d "$HOME/.codeium/windsurf" && "$PROJECT_LEVEL" == false ]]; then
        echo "$HOME/.codeium/windsurf/skills"
      else
        echo ".windsurf/rules"
      fi
      ;;
    cline)
      if [[ -d "$HOME/.cline" && "$PROJECT_LEVEL" == false ]]; then
        echo "$HOME/.cline/skills"
      else
        echo ".clinerules/skills"
      fi
      ;;
    trae) echo ".trae/rules" ;;
    gemini) echo "$HOME/.gemini/skills" ;;
    goose) echo "$HOME/.config/goose/skills" ;;
    opencode)
      if [[ -d "$HOME/.config/opencode" && "$PROJECT_LEVEL" == false ]]; then
        echo "$HOME/.config/opencode/skills"
      else
        echo ".opencode/skills"
      fi
      ;;
    roo-code)
      if [[ -d "$HOME/.roo" && "$PROJECT_LEVEL" == false ]]; then
        echo "$HOME/.roo/skills"
      else
        echo ".roo/skills"
      fi
      ;;
    kiro)
      if [[ -d "$HOME/.kiro" && "$PROJECT_LEVEL" == false ]]; then
        echo "$HOME/.kiro/skills"
      else
        echo ".kiro/skills"
      fi
      ;;
    codex) echo "$HOME/.codex/skills" ;;
    universal) echo "$HOME/.agents/skills" ;;
    *)
      error "Unknown platform: $1"
      return 1
      ;;
  esac
}

render_cursor_mdc() {
  local target_dir="$1"
  local skill_name="$2"
  cat > "$target_dir/$skill_name.mdc" <<EOF
---
description: Installed from implementation-workflows: $skill_name
globs: *
alwaysApply: false
---

# $skill_name

This skill was installed from the implementation-workflows repository.
Use the bundled SKILL.md as the primary instruction source.
EOF
}

render_trae_rule() {
  local target_dir="$1"
  local skill_name="$2"
  cat > "$target_dir/$skill_name.md" <<EOF
---
type: Agent Requested
---

# $skill_name

This rule mirrors the installed skill directory. Read the bundled SKILL.md when this skill is invoked.
EOF
}

render_windsurf_rule() {
  local target_dir="$1"
  local skill_name="$2"
  cat > "$target_dir/rule.md" <<EOF
# $skill_name

Installed from the implementation-workflows repository.
Use the bundled SKILL.md as the instruction source for this skill.
EOF
}

adapt_platform_format() {
  local target_dir="$1"
  local skill_name="$2"
  local platform="$3"

  case "$platform" in
    cursor) render_cursor_mdc "$target_dir" "$skill_name" ;;
    trae) render_trae_rule "$target_dir" "$skill_name" ;;
    windsurf) render_windsurf_rule "$target_dir" "$skill_name" ;;
  esac
}

install_one() {
  local skill_name="$1"
  local platform="$2"
  local source_dir
  local base_dir
  local target_dir

  source_dir="$(skill_source_dir "$skill_name")"
  base_dir="$(get_install_base "$platform")"
  target_dir="$base_dir/$skill_name"

  if [[ ! -d "$source_dir" ]]; then
    error "Source directory missing for $skill_name: $source_dir"
    return 1
  fi

  if [[ "$DRY_RUN" == true ]]; then
    info "[DRY-RUN] $skill_name -> $target_dir"
    return 0
  fi

  mkdir -p "$base_dir"
  rm -rf "$target_dir"
  cp -R "$source_dir" "$target_dir"
  adapt_platform_format "$target_dir" "$skill_name" "$platform"
  info "Installed $skill_name to $target_dir"
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --skill)
        REQUESTED_SKILLS+=("$2")
        shift 2
        ;;
      --all-skills)
        ALL_SKILLS=true
        shift
        ;;
      --platform)
        PLATFORM="$2"
        shift 2
        ;;
      --all-platforms)
        ALL_PLATFORMS=true
        shift
        ;;
      --project)
        PROJECT_LEVEL=true
        shift
        ;;
      --dry-run)
        DRY_RUN=true
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        error "Unknown option: $1"
        usage
        exit 1
        ;;
    esac
  done
}

main() {
  parse_args "$@"

  if [[ "$ALL_SKILLS" == true ]]; then
    REQUESTED_SKILLS=("${SKILL_NAMES[@]}")
  fi

  if [[ "${#REQUESTED_SKILLS[@]}" -eq 0 ]]; then
    REQUESTED_SKILLS=("landable-implementation-loop")
    warn "No skills selected. Defaulting to landable-implementation-loop."
  fi

  local platforms=()
  if [[ "$ALL_PLATFORMS" == true ]]; then
    while IFS= read -r item; do
      platforms+=("$item")
    done < <(detect_platforms)
  elif [[ -n "$PLATFORM" ]]; then
    platforms+=("$PLATFORM")
  else
    while IFS= read -r item; do
      platforms+=("$item")
    done < <(detect_platforms)
    platforms=("${platforms[0]}")
  fi

  info "Skills: ${REQUESTED_SKILLS[*]}"
  info "Platforms: ${platforms[*]}"
  [[ "$DRY_RUN" == true ]] && info "Running in dry-run mode"

  local platform
  local skill_name
  for platform in "${platforms[@]}"; do
    for skill_name in "${REQUESTED_SKILLS[@]}"; do
      install_one "$skill_name" "$platform"
    done
  done

  echo
  info "Done."
}

main "$@"
