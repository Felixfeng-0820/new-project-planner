# Big Jump 🚀

> **One vague idea in. Verified software out.**

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml) · 🌐 [Website](https://felixfeng-0820.github.io/big-jump/) · [中文版 README](README.zh.md)

Big Jump turns a coding agent into an autonomous builder-coach. Give it a substantial product idea and it scopes the smallest useful release, chooses a practical route, builds in testable slices, verifies through the real entry point, protects your existing work, and teaches one concept per phase.

It is no longer a static-website recipe. It can route and combine:

- browser applications and full-stack products;
- APIs, workers, databases, and backends;
- CLI tools, batch jobs, and safe automation;
- data pipelines, models, RAG, and LLM systems;
- reusable libraries and SDKs;
- mobile and desktop applications;
- substantial changes inside an existing repository.

A successful release might be a public site, a tested API, an installable CLI, a reproducible model, a packaged library, or an app build. Big Jump does not force every idea into a public URL.

## Three-step start

1. **Install** — clone this repository and run `bash install.sh`.
2. **Describe the outcome** — for example: “Build a CLI that safely renames my photos from EXIF dates. It needs dry-run and interruption recovery.”
3. **Review the evidence** — Big Jump implements locally, runs stack-appropriate checks, records limitations, and asks before unapproved external actions.

## What makes it different

| Generic coding prompt | Big Jump |
|---|---|
| Picks a familiar framework immediately | Inspects the repository and routes by the product's real entry point |
| Uses the same test recipe everywhere | Chooses browser, API, subprocess, data, consumer-install, or simulator evidence as appropriate |
| “Tests pass” with no scope | Maps each claim to a fresh command or interaction and names limitations |
| Treats all existing files as safe to rewrite | Records dirty state and never stashes, commits, or discards user work without permission |
| Deploys because credentials exist | Separates capability from consent and verifies the delivered version |
| Stops after arbitrary retry counts | Continues while a materially different safe diagnostic path exists |

## How the skill is organized

The core `SKILL.md` is deliberately small. It contains routing, the build loop, safety boundaries, evidence rules, and the final acceptance review. It loads only the detail needed for the selected project:

- `references/project-profiles.md` — web, backend, CLI, data/AI, library, mobile/desktop, existing-project, and risk overlays;
- `references/verification-playbook.md` — fast/full evidence sets and real-boundary testing;
- `references/guided-mode.md` — honest operation when commands cannot be run;
- `references/release-and-deployment.md` — websites, APIs, packages, models, and app releases;
- `references/ideation-and-coaching.md` — direction finding, teaching, and retrospectives;
- `assets/PROJECT_NOTES.template.md` — optional durable outcome and evidence log;
- `evals/evals.json` — realistic trigger and project-routing scenarios;
- `scripts/validate_skill.py` — dependency-free structural validation;
- `scripts/test_validator.py` / `scripts/test_installer.py` — negative validation and atomic-update regression tests.

This progressive layout keeps irrelevant stack instructions out of the agent's context while preserving detailed guidance when it matters.

## Safety and honesty

- Uses repository-native tooling before adding new frameworks, hooks, or wrappers.
- Never silently stages unrelated files, overwrites an existing hook, stashes user work, force-pushes, or uses destructive Git recovery.
- Uses fixtures, temporary directories, disposable databases, provider test modes, and clean consumer environments.
- Treats secret scanners as limited evidence, never invents or exposes credentials, and stops for account-owner rotation after suspected leakage.
- Reports outcomes as verified, partially verified, or not verified.
- Treats explicit authorization for a named repository modification, push, or deployment as permission for that scope, without asking twice.

## Install

### Codex

```bash
bash install.sh
```

The installer copies the complete skill—not only `SKILL.md`—to `${CODEX_HOME}/skills/big-jump/` when `CODEX_HOME` is set, otherwise to `~/.codex/skills/big-jump/`. It stages and validates the whole update before replacing the prior version, rejects unsafe symlink layouts, and records a content fingerprint. Re-run it to update.

The destination directory must be named `big-jump`; the installer refuses any other name so it cannot silently land in the wrong folder. To install somewhere else, point `BIG_JUMP_SKILL_DIR` at a path that ends in `big-jump`:

```bash
BIG_JUMP_SKILL_DIR=/my/own/skills/big-jump bash install.sh
```

### Other Agent Skills-compatible tools

Copy the whole repository skill set—`SKILL.md`, `references/`, `assets/`, `agents/`, `evals/`, and `scripts/`—into the tool's skill directory. Do not copy only `SKILL.md`, because the core intentionally loads profile guidance on demand.

## Example requests

> Build a local-first meal-splitting web app. Balances must survive reloads, but I do not want deployment yet.

> In this FastAPI repository, add a Postgres-backed import endpoint. Preserve my unrelated edits and do not touch production data.

> Turn these transaction CSVs into a fraud-risk baseline. Split by time, compare against a naive baseline, and do not overclaim accuracy.

> Create a Flutter habit tracker for Android and iOS. I have no Apple signing credentials, so report exactly what you can verify.

If the skill is not selected automatically, say: **“Use the big-jump skill.”**

## Design influences

Big Jump uses newly written instructions and templates while adapting general workflow ideas from [OpenAI's current skill guidance](https://learn.chatgpt.com/docs/build-skills), the [Agent Skills standard](https://github.com/agentskills/agentskills), [GitHub Spec Kit](https://github.com/github/spec-kit), [Anthropic's skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator), and [Superpowers](https://github.com/obra/superpowers). The synthesis emphasizes progressive disclosure, outcome-first planning, stack-native verification, realistic evals, and fresh evidence before completion claims.

No third-party skill text or templates are bundled here.

## Repository files

- `SKILL.md` — English runtime instructions loaded by the agent;
- `notes/SKILL-zh.md` — Chinese reading translation;
- `README.md` / `README.zh.md` — English and Chinese project pages;
- `docs/` — bilingual GitHub Pages showcase;
- `install.sh` — atomic full-folder installer with rollback, path guards, provenance, and validation;
- `.github/workflows/check-skill.yml` — CI validation and installer test;
- `LICENSE` — MIT.

## License

MIT
