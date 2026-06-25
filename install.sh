#!/usr/bin/env bash
#
# install.sh — install the Scientific Thinking Skills into your user-global
# Claude Code skills directory (~/.claude/skills) so they're available in
# every project, not just this repo.
#
# Usage:
#   ./install.sh            # install to ~/.claude/skills
#   DEST=/path ./install.sh # install to a custom skills directory
#
set -euo pipefail

# Directory this script lives in (the repo root).
SRC_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SRC_ROOT/.claude/skills"

DEST="${DEST:-$HOME/.claude/skills}"

if [ ! -d "$SRC" ]; then
  echo "error: source skills directory not found: $SRC" >&2
  exit 1
fi

# Only the skills this installer manages (the sci-* family).
SKILLS=(
  sci-hypothesis-debugging
  sci-first-principles
  sci-evidence-first
  sci-controlled-experiment
  sci-falsification
)

echo "Installing Scientific Thinking Skills"
echo "  from: $SRC"
echo "  to:   $DEST"
echo

mkdir -p "$DEST"

for skill in "${SKILLS[@]}"; do
  if [ ! -f "$SRC/$skill/SKILL.md" ]; then
    echo "  ! skip $skill (missing SKILL.md in source)"
    continue
  fi
  rm -rf "${DEST:?}/$skill"
  cp -R "$SRC/$skill" "$DEST/$skill"
  echo "  + installed $skill"
done

echo
echo "Done. ${#SKILLS[@]} skills installed to $DEST"
echo "Open a Claude Code session and the sci-* skills will be available."
