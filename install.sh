#!/usr/bin/env bash
# Install the big-jump skill into Codex.
# Usage: bash install.sh
set -euo pipefail

SKILL_DIR="${HOME}/.codex/skills/big-jump"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "${SKILL_DIR}"
cp "${SCRIPT_DIR}/SKILL.md" "${SKILL_DIR}/SKILL.md"

echo "Installed Big Jump to:"
echo "  ${SKILL_DIR}"
echo ""
echo "Start a new Codex session and it will be picked up automatically."
echo "Other tools: copy the SKILL.md into your tool's skills directory instead."
