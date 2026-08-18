# new-project-planner

[![check-skill](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml)

🌐 Website: **https://felixfeng-0820.github.io/new-project-planner/**

> [中文版 README](README.zh.md)

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into a patient vibe-coding coach for beginners.

When a beginner says "I want to build a website" and nothing else, this skill makes the assistant:

- clarify the goal and a minimal first version **before** writing code
- break the project into clear phases
- guide one small 5–20 minute step at a time
- teach prompt-writing along the way, with ready-to-copy prompt templates
- say no honestly when an idea is too big for a first version
- keep a "progress card" at the end of every reply, so the user can resume after a break or in a new chat
- explain every change and every error in plain language
- never dump a huge amount of code at once

It also includes:

- 5 ready-to-copy prompt templates (plan a project, build a feature, report an error, explain code, retrospective)
- a worked example of a good coaching conversation
- 10 beginner project ideas with minimal first versions
- a plain-language glossary of common terms
- quick commands: `/start`, `/breakdown`, `/next`, `/teach-prompt`, `/check`, `/error`, `/explain`, `/ideas`, `/retrospective`

## Install

This skill uses the standard Agent Skills format (a folder containing a `SKILL.md` file), so it works with any tool that supports SKILL.md skills.

### Codex

One command (macOS / Linux):

```bash
bash install.sh
```

This copies `SKILL.md` into `~/.codex/skills/new-project-planner/`. Start a new Codex session and the skill is picked up automatically when it matches the task.

### DeepSeek Harness

Put the `new-project-planner` folder into a `.dsh/skills` or `.agents/skills` directory inside your project, or into `~/.dsh/skills`:

```
~/.dsh/skills/new-project-planner/SKILL.md
```

### Claude Code / Cursor

Install the `new-project-planner` folder into the tool's own skills directory (for example `~/.claude/skills/` in Claude Code, or the `.agents/skills` project folder in Cursor).

## Usage

In a new chat, just describe a vague idea, for example:

> I want to build a website.

The assistant, with this skill loaded, should reply as a coach: clarify the idea, agree on a minimal first version, and hand you one small step.

If the assistant does not pick the skill up automatically, mention it explicitly:

> Use the new-project-planner skill.

## Files

- `SKILL.md` — the skill itself
- `README.md` — this file
- `docs/index.html` — the showcase website (hosted on GitHub Pages)
- `install.sh` — one-command installer for Codex
- `.github/workflows/check-skill.yml` — automatic health check on every push
- `notes/draft-zh-original.md` — the original Chinese draft this skill was translated from (kept for reference)
- `LICENSE` — MIT license

## License

MIT
