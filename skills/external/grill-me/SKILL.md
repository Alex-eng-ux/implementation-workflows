---
name: grill-me
description: Stress-test the user's plan, design, architecture, proposal, or decision by asking focused questions one at a time until the important risks, tradeoffs, dependencies, and recommended answers are clear. Use when the user asks to be grilled, challenged, stress-tested, poked full of holes, questioned deeply, or wants help validating a plan before committing.
---

Question the user relentlessly but constructively about the plan or design until there is shared understanding. Walk down the decision tree one branch at a time, resolving dependencies between decisions before moving on.

For each turn, ask exactly one question and include:

- **Question**: The next highest-leverage question.
- **Recommended answer**: Your best answer based on available context.
- **Why it matters**: The decision, risk, or dependency this question resolves.

If a question can be answered by inspecting local context, files, configuration, documentation, repository history, command output, or available tools, inspect that context instead of asking the user.

Stop grilling when the key decisions, tradeoffs, dependencies, failure modes, and recommended path are clear. Then provide a concise summary of the agreed understanding and any remaining open risks.
