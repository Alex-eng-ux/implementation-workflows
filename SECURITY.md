# Security Policy

This repository primarily distributes workflow skills and installation guidance rather than a networked service. Even so, security matters because these skills may influence agent behavior in codebases, CI environments, and local developer machines.

## Scope

Security-relevant issues may include:

- installer behavior that writes to unsafe locations
- documentation that encourages unsafe agent execution
- path handling mistakes in compatibility adapters
- accidental disclosure of secrets, tokens, or private prompts
- third-party attribution or provenance issues that create supply-chain risk

## Reporting

Please report suspected security issues privately to the maintainers before opening a public issue when possible.

When reporting, include:

- affected file paths
- reproduction steps
- expected behavior
- actual behavior
- why the issue matters in a real agent workflow

## Security expectations for contributions

- do not broaden install paths casually
- do not remove third-party provenance materials
- do not introduce instructions that encourage unsafe secret handling
- keep runtime-specific adapters narrow and explicit

## Response model

Maintainers should aim to:

1. acknowledge the report
2. validate impact
3. prepare a focused fix
4. document any user action needed after remediation

## Important limitation

This repository cannot guarantee the security posture of every downstream agent runtime. Users should still review local install locations, runtime permissions, and any execution model that can launch sub-agents automatically.
