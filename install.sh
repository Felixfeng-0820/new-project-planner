#!/usr/bin/env bash
# Install the new-project-planner skill into Codex.
# Usage: bash install.sh
set -euo pipefail

SKILL_DIR="${HOME}/.codex/skills/new-project-planner"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "${SKILL_DIR}"
cp "${SCRIPT_DIR}/SKILL.md" "${SKILL_DIR}/SKILL.md"

echo "Installed new-project-planner to:"
echo "  ${SKILL_DIR}"
echo ""
echo "Start a new Codex session and it will be picked up automatically."
echo "Other tools: copy the SKILL.md into your tool's skills directory instead."
