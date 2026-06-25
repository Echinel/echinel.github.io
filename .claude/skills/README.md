# Scientific Thinking Skills

A small collection of Claude Code skills that encourage rigorous, scientific
reasoning — forming hypotheses, isolating variables, demanding evidence, and
trying to falsify your own conclusions before trusting them.

Each skill is a directory containing a `SKILL.md` with YAML frontmatter
(`name`, `description`) and a short, actionable method. Claude reads the
descriptions and invokes the matching skill when a task calls for it.

## Skills

| Skill | Use it when… |
|-------|--------------|
| `sci-hypothesis-debugging` | Chasing a bug, flaky test, or unexpected result — form a falsifiable hypothesis and test the cheapest thing that could disprove it. |
| `sci-first-principles` | Design decisions, feasibility/cost estimates, or challenging "we've always done it this way." Decompose to fundamentals and rebuild. |
| `sci-evidence-first` | Before claiming code works, a bug is fixed, or a fact is true — label evidence as observed / inferred / assumed and report faithfully. |
| `sci-controlled-experiment` | Performance tuning, A/B comparisons, "did this change help?" — baseline first, change one variable, measure against the control. |
| `sci-falsification` | Before reporting a finding as settled — state what would prove you wrong, then go look for it. |

## Installing globally

These skills live in this repo under `.claude/skills/`, so they're already
active for sessions opened here. To make them available in **every** project,
run the installer, which copies them into your user-global skills directory
(`~/.claude/skills/`):

```bash
./install.sh
```

Re-running is safe — it overwrites only the `sci-*` skills it manages.

## Layout

```
.claude/skills/
├── README.md                       (this file)
├── sci-hypothesis-debugging/SKILL.md
├── sci-first-principles/SKILL.md
├── sci-evidence-first/SKILL.md
├── sci-controlled-experiment/SKILL.md
└── sci-falsification/SKILL.md
```
