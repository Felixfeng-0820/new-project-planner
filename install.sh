#!/usr/bin/env bash
# Install or update the Big Jump skill into Codex.
# Usage: bash install.sh
set -euo pipefail

REPO_URL="https://github.com/Felixfeng-0820/big-jump"
RAW_URL="https://raw.githubusercontent.com/Felixfeng-0820/big-jump/main/SKILL.md"
SKILL_DIR="${HOME}/.codex/skills/big-jump"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "${SKILL_DIR}"

# Fetch the skill from the GitHub repo so the installed copy always has a known
# source and can be re-installed / updated by re-running this script.
if curl -fsSL "${RAW_URL}" -o "${SKILL_DIR}/SKILL.md" 2>/dev/null; then
  SOURCE="downloaded from ${REPO_URL}"
else
  # Offline fallback: copy the file next to this script.
  cp "${SCRIPT_DIR}/SKILL.md" "${SKILL_DIR}/SKILL.md"
  SOURCE="copied from local file ${SCRIPT_DIR}/SKILL.md (offline)"
fi

# Record provenance so anyone can tell what is installed and where it came from.
COMMIT_SHA="unknown"
if command -v gh >/dev/null 2>&1; then
  COMMIT_SHA="$(gh api repos/Felixfeng-0820/big-jump/commits/main --jq .sha 2>/dev/null || echo unknown)"
fi
cat > "${SKILL_DIR}/install-info.txt" <<EOF
repo: ${REPO_URL}
commit: ${COMMIT_SHA}
source: ${SOURCE}
installed: $(date -u +%Y-%m-%dT%H:%M:%SZ)
EOF

echo "Installed Big Jump to:"
echo "  ${SKILL_DIR}"
echo "  ${SKILL_DIR}/install-info.txt (source and version)"
echo ""
echo "To update later: re-run this script."
echo "Start a new Codex session and the skill will be picked up automatically."
echo "Other tools: copy the SKILL.md into your tool's skills directory instead."
