#!/usr/bin/env python3
"""Negative regression tests for the Big Jump structural validator."""

from __future__ import annotations

import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def copy_skill(parent: Path, name: str = "big-jump") -> Path:
    destination = parent / name
    shutil.copytree(
        ROOT,
        destination,
        ignore=shutil.ignore_patterns(".git", "__pycache__", ".DS_Store"),
    )
    return destination


def validate(root: Path, should_succeed: bool) -> None:
    result = subprocess.run(
        [sys.executable, str(ROOT / "scripts" / "validate_skill.py"), str(root)],
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if (result.returncode == 0) != should_succeed:
        expected = "success" if should_succeed else "failure"
        raise AssertionError(
            f"expected validator {expected}, got exit {result.returncode}:\n{result.stdout}"
        )


def main() -> int:
    with tempfile.TemporaryDirectory(prefix="big-jump-validator-tests-") as temp:
        temp_root = Path(temp)

        invalid_yaml = copy_skill(temp_root / "invalid-yaml")
        metadata = invalid_yaml / "agents" / "openai.yaml"
        metadata.write_text(
            metadata.read_text(encoding="utf-8") + "broken: [\n",
            encoding="utf-8",
        )
        validate(invalid_yaml, should_succeed=False)

        invalid_profile = copy_skill(temp_root / "invalid-profile")
        eval_path = invalid_profile / "evals" / "evals.json"
        eval_data = json.loads(eval_path.read_text(encoding="utf-8"))
        eval_data["cases"][0]["expected_route"]["profiles"] = ["invented-profile"]
        eval_path.write_text(json.dumps(eval_data, indent=2) + "\n", encoding="utf-8")
        validate(invalid_profile, should_succeed=False)

        invalid_overlay = copy_skill(temp_root / "invalid-overlay")
        eval_path = invalid_overlay / "evals" / "evals.json"
        eval_data = json.loads(eval_path.read_text(encoding="utf-8"))
        eval_data["cases"][0]["expected_route"]["risk_overlays"] = ["invented-overlay"]
        eval_path.write_text(json.dumps(eval_data, indent=2) + "\n", encoding="utf-8")
        validate(invalid_overlay, should_succeed=False)

        wrong_directory = copy_skill(temp_root / "wrong-directory", name="other-name")
        validate(wrong_directory, should_succeed=False)

        empty_cases = (
            "references/project-profiles.md",
            "scripts/validate_skill.py",
            "scripts/test_installer.py",
        )
        for index, relative_path in enumerate(empty_cases):
            empty_runtime = copy_skill(temp_root / f"empty-runtime-{index}")
            (empty_runtime / relative_path).write_text("", encoding="utf-8")
            validate(empty_runtime, should_succeed=False)

    print(
        "PASS: validator rejects malformed metadata, route enums, folder-name mismatches, "
        "and empty runtime files"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
