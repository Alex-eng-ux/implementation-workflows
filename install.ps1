param(
    [string[]]$Skill,
    [switch]$AllSkills,
    [string]$Platform,
    [switch]$AllPlatforms,
    [switch]$Project,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$SkillMap = @{
    "parallel-decomposer-skill" = "skills/parallel-decomposer-skill"
    "parallel-decomposer-auto" = "skills/parallel-decomposer-skill/parallel-decomposer-auto"
    "code-analyzer-suite" = "skills/code-analyzer-suite"
    "code-analyzer-auto" = "skills/code-analyzer-suite/code-analyzer-auto"
    "iterative-implementation-review" = "skills/iterative-implementation-review/iterative-implementation-review"
    "iterative-implementation-review-auto" = "skills/iterative-implementation-review/iterative-implementation-review-auto"
    "landable-implementation-loop" = "skills/landable-implementation-loop"
    "grill-me" = "skills/external/grill-me"
}

function Get-DetectedPlatforms {
    $items = New-Object System.Collections.Generic.List[string]

    if (Test-Path "$HOME/.claude") { $items.Add("claude") }
    if (Test-Path "$HOME/.copilot") { $items.Add("copilot") }
    if ((Test-Path ".github") -or (Test-Path "$HOME/.github")) { $items.Add("copilot-project") }
    if ((Test-Path ".cursor") -or (Test-Path "$HOME/.cursor")) { $items.Add("cursor") }
    if ((Test-Path "$HOME/.codeium/windsurf") -or (Test-Path ".windsurf")) { $items.Add("windsurf") }
    if ((Test-Path "$HOME/.cline") -or (Test-Path ".clinerules")) { $items.Add("cline") }
    if ((Test-Path ".trae") -or (Test-Path "$HOME/.trae")) { $items.Add("trae") }
    if (Test-Path "$HOME/.gemini") { $items.Add("gemini") }
    if (Test-Path "$HOME/.config/goose") { $items.Add("goose") }
    if ((Test-Path "$HOME/.config/opencode") -or (Test-Path ".opencode")) { $items.Add("opencode") }
    if ((Test-Path "$HOME/.roo") -or (Test-Path ".roo")) { $items.Add("roo-code") }
    if ((Test-Path "$HOME/.kiro") -or (Test-Path ".kiro")) { $items.Add("kiro") }
    if ((Test-Path "$HOME/.codex") -or (Test-Path "$HOME/.agents")) { $items.Add("codex") }

    if ($items.Count -eq 0) { $items.Add("universal") }
    return $items
}

function Get-InstallBase([string]$Name) {
    switch ($Name) {
        "claude" { return "$HOME/.claude/skills" }
        "copilot" { return "$HOME/.copilot/skills" }
        "copilot-project" { return ".github/skills" }
        "cursor" { return ".cursor/skills" }
        "windsurf" {
            if ((Test-Path "$HOME/.codeium/windsurf") -and -not $Project) { return "$HOME/.codeium/windsurf/skills" }
            return ".windsurf/rules"
        }
        "cline" {
            if ((Test-Path "$HOME/.cline") -and -not $Project) { return "$HOME/.cline/skills" }
            return ".clinerules/skills"
        }
        "trae" { return ".trae/rules" }
        "gemini" { return "$HOME/.gemini/skills" }
        "goose" { return "$HOME/.config/goose/skills" }
        "opencode" {
            if ((Test-Path "$HOME/.config/opencode") -and -not $Project) { return "$HOME/.config/opencode/skills" }
            return ".opencode/skills"
        }
        "roo-code" {
            if ((Test-Path "$HOME/.roo") -and -not $Project) { return "$HOME/.roo/skills" }
            return ".roo/skills"
        }
        "kiro" {
            if ((Test-Path "$HOME/.kiro") -and -not $Project) { return "$HOME/.kiro/skills" }
            return ".kiro/skills"
        }
        "codex" { return "$HOME/.codex/skills" }
        "universal" { return "$HOME/.agents/skills" }
        default { throw "Unknown platform: $Name" }
    }
}

function Write-CursorAdapter([string]$TargetDir, [string]$SkillName) {
    @"
---
description: Installed from implementation-workflows: $SkillName
globs: *
alwaysApply: false
---

# $SkillName

This skill was installed from the implementation-workflows repository.
Use the bundled SKILL.md as the primary instruction source.
"@ | Set-Content -Encoding UTF8 "$TargetDir/$SkillName.mdc"
}

function Write-TraeAdapter([string]$TargetDir, [string]$SkillName) {
    @"
---
type: Agent Requested
---

# $SkillName

This rule mirrors the installed skill directory. Read the bundled SKILL.md when this skill is invoked.
"@ | Set-Content -Encoding UTF8 "$TargetDir/$SkillName.md"
}

function Write-WindsurfAdapter([string]$TargetDir, [string]$SkillName) {
    @"
# $SkillName

Installed from the implementation-workflows repository.
Use the bundled SKILL.md as the instruction source for this skill.
"@ | Set-Content -Encoding UTF8 "$TargetDir/rule.md"
}

function Install-One([string]$SkillName, [string]$PlatformName) {
    if (-not $SkillMap.ContainsKey($SkillName)) {
        throw "Unknown skill: $SkillName"
    }

    $sourceDir = Join-Path $ScriptDir $SkillMap[$SkillName]
    $baseDir = Get-InstallBase $PlatformName
    $targetDir = Join-Path $baseDir $SkillName

    if (-not (Test-Path $sourceDir)) {
        throw "Missing source directory for ${SkillName}: $sourceDir"
    }

    if ($DryRun) {
        Write-Host "[DRY-RUN] $SkillName -> $targetDir"
        return
    }

    New-Item -ItemType Directory -Force -Path $baseDir | Out-Null
    if (Test-Path $targetDir) {
        Remove-Item -Recurse -Force $targetDir
    }

    Copy-Item -Recurse -Force $sourceDir $targetDir

    switch ($PlatformName) {
        "cursor" { Write-CursorAdapter $targetDir $SkillName }
        "trae" { Write-TraeAdapter $targetDir $SkillName }
        "windsurf" { Write-WindsurfAdapter $targetDir $SkillName }
    }

    Write-Host "[INFO] Installed $SkillName to $targetDir"
}

if ($AllSkills) {
    $Skill = @(
        "parallel-decomposer-skill",
        "parallel-decomposer-auto",
        "code-analyzer-suite",
        "code-analyzer-auto",
        "iterative-implementation-review",
        "iterative-implementation-review-auto",
        "landable-implementation-loop",
        "grill-me"
    )
}

if ($Skill) {
    $ExpandedSkills = New-Object System.Collections.Generic.List[string]
    foreach ($item in $Skill) {
        foreach ($part in ($item -split ",")) {
            $trimmed = $part.Trim()
            if ($trimmed) {
                $ExpandedSkills.Add($trimmed)
            }
        }
    }
    $Skill = $ExpandedSkills.ToArray()
}

if (-not $Skill -or $Skill.Count -eq 0) {
    $Skill = @("landable-implementation-loop")
    Write-Host "[WARN] No skills selected. Defaulting to landable-implementation-loop."
}

$Platforms = New-Object System.Collections.Generic.List[string]
if ($AllPlatforms) {
    foreach ($item in Get-DetectedPlatforms) { $Platforms.Add($item) }
} elseif ($Platform) {
    $Platforms.Add($Platform)
} else {
    $detected = Get-DetectedPlatforms
    $Platforms.Add($detected[0])
}

Write-Host "[INFO] Skills: $($Skill -join ', ')"
Write-Host "[INFO] Platforms: $($Platforms -join ', ')"
if ($DryRun) { Write-Host "[INFO] Running in dry-run mode" }

foreach ($platformName in $Platforms) {
    foreach ($skillName in $Skill) {
        Install-One $skillName $platformName
    }
}

Write-Host ""
Write-Host "[INFO] Done."
