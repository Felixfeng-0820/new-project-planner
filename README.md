# Big Jump

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml)

🌐 Website: **https://felixfeng-0820.github.io/big-jump/**

> [中文版 README](README.zh.md)

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into an **autonomous builder-coach**: you hand it one vague idea, and it breaks the idea down, states a one-line direction, and builds the project end-to-end itself — git from day one, an early deploy, APIs and databases when needed — **explaining each module only after it is done and moving to the next step automatically**, until the project is live at a public URL.

The builder:

- states its assumptions in one line and starts immediately — no interviews, no "what do you already know", no permission-asking per step
- builds with its own tools: files, commands, tests, commits, deploys. You are the reviewer, not the executor
- teaches after each module in 3–4 lines (what was done / why this way / what you learned), then continues automatically
- stops only for real blockers: an error it cannot fix alone, a missing secret or account, a choice only you can make, or a payment
- guarantees the final result is a public URL anyone can open — never a local-only page
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

This copies `SKILL.md` into `~/.codex/skills/big-jump/`. Start a new Codex session and the skill is picked up automatically when it matches the task.

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
