---
name: sci-first-principles
description: Reason from first principles — decompose a problem into the fundamental facts and constraints you can verify, then rebuild the answer upward instead of arguing by analogy or convention. Use for design decisions, "is this even possible?" questions, cost/performance estimates, and challenging assumptions like "we've always done it this way."
---

# First-Principles Reasoning

Reduce a problem to things that are true by definition or by direct evidence, then derive the rest. Reasoning by analogy ("X does it this way") copies others' assumptions; first principles tests them.

## Method

1. **State the goal** in terms of the actual outcome wanted, not the current mechanism. ("Get fresh data to the user in <200ms," not "make the cache faster.")
2. **List the assumptions** baked into the current approach. Mark each as *verified fact*, *convention*, or *guess*.
3. **Strip to fundamentals** — keep only what's true by physics, math, the spec, or measured data. Discard "because that's standard."
4. **Rebuild** the solution from those fundamentals. Often a constraint you assumed was fixed turns out to be a choice.
5. **Sanity-check with a back-of-envelope estimate.** Numbers expose impossible plans early (bandwidth, latency, memory, request counts).

## Prompts to ask yourself

- "What do I actually *know* here vs. what am I assuming?"
- "If I were building this for the first time today, would I do it this way?"
- "What's the theoretical floor (cost/time/size)? How far is the current approach from it?"
- "Which constraint is real, and which is just inherited?"

## Output

When you use this skill, make the decomposition visible: list the fundamentals you're relying on and the assumptions you discarded, so the reasoning can be checked — not just the conclusion.
