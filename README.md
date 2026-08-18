# new-project-planner

[![check-skill](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml)

🌐 Website: **https://felixfeng-0820.github.io/new-project-planner/**

> [中文版 README](README.zh.md)

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into a vibe-coding coach for **college students and smart beginners** — people who learn fast and want real, deployed, portfolio-worthy projects, not toys.

When a student says "I want to build a course-schedule website" and nothing else, this skill makes the assistant:

- clarify the goal and a minimal first version **before** writing code
- place the user on a 6-rung learning path (HTML/CSS → JavaScript → git → deployment → APIs/data → going deeper) and teach what they are missing
- break the project into phases that include **real engineering**: git from day one, deployment early, an API or database when it is needed
- guide one small step at a time, faster when the user keeps up
- teach prompt-writing along the way, with 7 ready-to-copy prompt templates
- say no honestly when an idea is too big for a first version
- keep a "progress card" at the end of every reply, so the user can resume after a break or in a new chat
- explain every change and every error in clear, non-condescending language

It also includes:

- 7 ready-to-copy prompt templates (plan a project, build a feature, report an error, explain code, retrospective, teach a concept, review code)
- a worked example of a good coaching conversation
- 10 student-oriented project ideas (portfolio page, GPA calculator, campus marketplace, AI study assistant, …) with minimal first versions
- a plain-language glossary of 31 common terms
- quick commands: `/start`, `/breakdown`, `/next`, `/teach-prompt`, `/check`, `/error`, `/explain`, `/ideas`, `/teach`, `/review`, `/stack`, `/retrospective`

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

> I want to build a course-schedule website.

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
