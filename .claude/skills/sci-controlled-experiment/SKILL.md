---
name: sci-controlled-experiment
description: Design changes and comparisons as controlled experiments — establish a baseline, change one variable, hold everything else fixed, and measure against the control. Use for performance tuning, A/B comparisons, "did this change actually help?", config/parameter changes, and reproducing intermittent behavior.
---

# Controlled Experiments

If you change several things at once and the outcome shifts, you can't attribute the effect to any one of them. Isolate variables so results mean something.

## Setup

1. **Baseline first.** Measure the current state *before* touching anything. No baseline → no way to know if you improved or regressed. Record the exact conditions (inputs, environment, version).
2. **One independent variable.** Decide the single thing you're changing. Everything else is held constant — same data, same machine, same seed, same warm-up.
3. **Define the metric up front.** State what you'll measure and what counts as better, before you see results, so you can't move the goalposts.
4. **Control the noise.** Run multiple trials for anything variable (latency, flaky tests). Report spread, not a single lucky run. Use fixed seeds where randomness exists.
5. **Compare against the control**, not against your expectation. The control is the unchanged baseline run under identical conditions.

## Reporting

- State the delta *with* the baseline: "320ms → 180ms (median of 10 runs)," not "much faster."
- Note confounds you couldn't eliminate.
- If the effect is within run-to-run noise, say so — that's a real (null) result, not a failure.

## Common mistakes

- Comparing a warm cache against a cold one.
- One trial each and treating the difference as signal.
- Changing the code *and* the input *and* the environment, then crediting the code.
