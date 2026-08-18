# Big Jump

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml)

🌐 Website: **https://felixfeng-0820.github.io/big-jump/**

> [中文版 README](README.zh.md)

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into an **autonomous builder-coach**: you hand it one vague idea, and it breaks the idea down, states a one-line direction, and builds the project itself — git from day one, real verification after each phase — **explaining each module only after it is verified and moving to the next step automatically**, until the project passes a written acceptance checklist locally and goes live at a public URL the moment your accounts are connected.

The builder:

- states its assumptions in one line and starts immediately — no interviews, no "what do you already know", no permission-asking per step
- defines a written **definition of done per phase** and a final acceptance checklist: main path walked, persistence proven by reload, edge cases tried, console clean (404s included), corrupt data warns and offers an export instead of silently wiping, git clean with an assignment-aware secrets gate per commit (no false alarms on prose words)
- verifies before it claims: a feature is done when its checks pass, not when a button reacts; a tiered suite runs every phase — `tests/check.sh --fast` (static checks, `.gitignore` effectiveness, secrets gate, baseline hashes, phase audit, logic tests) and `--full` (adds a portable browser smoke test with mandatory try/finally cleanup, or an honest jsdom fallback marked "visual checks skipped")
- treats gates as hard: the secrets gate is a self-tested script enforced by a real git pre-commit hook; any failing step aborts the commit and prints a readable what/why/kind/next block — a broken gate is worse than no gate
- commits honestly: one `phase N:` commit per phase, audited automatically against the `PROJECT_NOTES.md` phase list — an agent cannot fake six "passed" lines with one commit
- asks before acting: creating a repo, pushing, or deploying always waits for your explicit OK — being logged in is not permission
- protects your work: records a worktree baseline before touching anything, never edits your pre-existing files, never resets or overwrites your uncommitted changes, never force-pushes; on failure it reverts only its own edits
- deploys honestly: checks auth, gets your OK, then deploys and verifies the public URL — or hands you a short checklist (login + confirm + caveats). It never claims a URL it did not open and verify
- teaches after each module in 4 lines (what was done / why this way / what you learned / what was verified) and keeps chat output sparse — no progress cards, no filler, then continues automatically
- stops only for real blockers: an error it cannot fix alone, a missing secret or account, a choice only you can make, or a payment
- adapts to its own capabilities: autonomous when it can run commands; in a plain chat it switches to guided mode — files as code blocks plus the exact commands to run — and never claims to have run what it could not
- handles interruptions and resumes cleanly: mid-flow change requests are folded in or re-planned, never dropped; a new session reads `PROJECT_NOTES.md` and continues from where it left off
- keeps you out of the classic traps: leaked secrets, unverified AI output, tutorial hell, half-finished projects
- has a direction finder for "I don't know what to build": a problem-hunting method, a validation checklist, and product-shaped examples (`/ideas`)

It also includes:

- a 6-rung learning path used silently to pace explanations
- 9 ready-to-copy prompt templates (plan, build a feature, report an error, explain code, retrospective, teach a concept, review code, deploy, options-first)
- a worked example of the whole workflow
- 10 product-shaped project ideas with minimal first versions and upgrade ideas
- a plain-language glossary of 33 common terms
- quick commands: `/pause`, `/next`, `/explain`, `/review`, `/error`, `/deploy`, `/showcase`, `/teach`, `/stack`, `/ideas`, `/retrospective`

## Install

This skill uses the standard Agent Skills format (a folder containing a `SKILL.md` file), so it works with any tool that supports SKILL.md skills.

### Codex

One command (macOS / Linux):

```bash
bash install.sh
```

This downloads `SKILL.md` from the GitHub repo into `~/.codex/skills/big-jump/` and writes an `install-info.txt` beside it (source repo, commit, install date), so you can always tell what is installed and where it came from. Re-run the script anytime to update.

### DeepSeek Harness

Put the `big-jump` folder into a `.dsh/skills` or `.agents/skills` directory inside your project, or into `~/.dsh/skills`:

```
~/.dsh/skills/big-jump/SKILL.md
```

### Claude Code / Cursor

Install the `big-jump` folder into the tool's own skills directory (for example `~/.claude/skills/` in Claude Code, or the `.agents/skills` project folder in Cursor).

## Usage

In a new chat, just say a vague idea, for example:

> I want to build an AI tool that turns PDFs into summaries I can ask questions about.

The assistant, with this skill loaded, should state its assumptions in one line, give a one-sentence direction, break the project into phases, and start building immediately — recapping each module after it is done, without waiting for "continue".

If the assistant does not pick the skill up automatically, mention it explicitly:

> Use the big-jump skill.

## Files

- `SKILL.md` — the skill itself (English, what the AI actually loads)
- `README.md` / `README.zh.md` — English / Chinese readme
- `docs/index.html` / `docs/index.zh.html` — the showcase website (English / Chinese, hosted on GitHub Pages)
- `install.sh` — one-command installer for Codex
- `.github/workflows/check-skill.yml` — automatic health check on every push
- `notes/draft-zh-original.md` — the original Chinese draft (archived)
- `notes/SKILL-zh.md` — full Chinese translation of `SKILL.md` (for reading)
- `LICENSE` — MIT license

## License

MIT
