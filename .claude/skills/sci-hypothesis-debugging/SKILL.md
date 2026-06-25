---
name: sci-hypothesis-debugging
description: Debug and investigate problems the scientific way — form an explicit, falsifiable hypothesis, predict what you'd observe if it were true, then run the cheapest test that could prove it wrong. Use when chasing a bug, an unexpected result, a flaky test, or any "why is this happening?" investigation.
---

# Hypothesis-Driven Debugging

Stop guessing-and-patching. Treat every bug as an unknown cause to be identified by experiment.

## The loop

1. **Observe** — State the symptom precisely and reproducibly. What exactly happens, where, and under what inputs? Capture the actual error/output, not a paraphrase.
2. **Hypothesize** — Write down ONE concrete, falsifiable cause: "X is null because the cache is read before it's populated." Vague hypotheses ("something's wrong with state") can't be tested.
3. **Predict** — If this hypothesis is true, what *else* must be observable? ("Then the log should show the read at t < write, and forcing a delay should fix it.")
4. **Test** — Run the *cheapest* experiment that could falsify the prediction. A single log line or a one-character change beats a refactor.
5. **Decide** — Confirmed → fix the root cause and verify the fix removes the symptom. Falsified → discard the hypothesis (don't cling to it) and return to step 2 with what you learned.

## Rules

- **One variable at a time.** If you change three things and the bug disappears, you've learned nothing about the cause.
- **Predict before you peek.** Commit to what the experiment *should* show before running it, so you can't rationalize any result as "expected."
- **A fix you can't explain isn't a fix.** If the symptom vanished but you don't know why, you have a new mystery, not a solution.
- **Keep a short log** of hypotheses tried and ruled out, so you don't loop.

## Anti-patterns

- Shotgun debugging (changing many things hoping one works).
- "It works now" without identifying what was broken.
- Treating the first plausible story as proven without a test that could have refuted it.
