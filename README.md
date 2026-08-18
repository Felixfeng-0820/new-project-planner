# new-project-planner

[![check-skill](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml)

🌐 Website: **https://felixfeng-0820.github.io/new-project-planner/**

> [中文版 README](README.zh.md)

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into a vibe-coding coach for **the college student who watches classmates shipping their own websites in freshman year, feels a mix of envy and ambition, and has no idea where to start.**

The coach opens with hook questions — *"Have you ever seen a classmate show off their own website and thought: I want to do that too — but where do I even start?"* — matches the user's level, and then:

- clarify the goal and a minimal first version **before** writing code
- place the user on a 6-rung learning path (HTML/CSS → JavaScript → git → deployment → APIs/data → going deeper) and teach what they are missing
- help a lost beginner find a direction: a problem-hunting method, a validation checklist, and a 3-question picker that aims at product-shaped tools with real users, not one-off scripts (`/ideas`)
- break the project into phases with **real engineering**: git from day one, a first deploy in phase 2, an API or database when it is needed
- **guarantee a public URL as the final result** — never a local-only page; deployment is taught step by step as part of the journey
- raise the bar: make it work, then make it good, then make it impressive (clean UI, dark mode, real data, custom domain)
- guide one small step at a time, faster when the user keeps up
- teach prompt-writing along the way, with 9 ready-to-copy prompt templates
- say no honestly when an idea is too big for a first version
- keep the user out of the classic traps: tutorial hell, pasting code they cannot explain, API keys leaked into git, and AI output taken on faith
- verify everything: treat AI output as a draft — run it, ask for reasons, check the official docs
- close the loop after deploy: feedback from friends, a README with a screenshot, and a one-line resume bullet (`/showcase`)
- keep a "progress card" at the end of every reply, so the user can resume after a break or in a new chat
- explain every change and every error in clear, non-condescending language

It also includes:

- 9 ready-to-copy prompt templates (plan a project, build a feature, report an error, explain code, retrospective, teach a concept, review code, deploy a project, give me options first)
- a worked example of a good coaching conversation
- 10 product-shaped project ideas (portfolio page, AI document reader, creator formatting tool, price watcher, open-data product, …) with minimal first versions and upgrade ideas
- a plain-language glossary of 33 common terms
- quick commands: `/start`, `/breakdown`, `/next`, `/teach-prompt`, `/check`, `/error`, `/explain`, `/ideas`, `/teach`, `/review`, `/stack`, `/deploy`, `/showcase`, `/retrospective`

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

> I want to build an AI tool that turns PDFs into summaries I can ask questions about.

The assistant, with this skill loaded, should reply as a coach: clarify the idea, place you on the learning path, agree on a minimal first version, and hand you one small step.

If the assistant does not pick the skill up automatically, mention it explicitly:

> Use the new-project-planner skill.

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
