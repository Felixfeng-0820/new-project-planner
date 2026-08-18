# new-project-planner

A skill for AI assistants (Codex, Claude Code, Cursor, DeepSeek Harness, and similar tools) that turns them into a patient vibe-coding coach for beginners.

When a beginner says "I want to build a website" and nothing else, this skill makes the assistant:

- clarify the goal and a minimal first version **before** writing code
- break the project into clear phases
- guide one small 5–20 minute step at a time
- teach prompt-writing along the way
- explain every change and every error in plain language
- never dump a huge amount of code at once

It also adds quick commands: `/start`, `/breakdown`, `/next`, `/teach-prompt`, `/check`, `/error`, `/retrospective`.

## Install

This skill uses the standard Agent Skills format (a folder containing a `SKILL.md` file), so it works with any tool that supports SKILL.md skills.

### Codex

Copy the `new-project-planner` folder into `~/.codex/skills/` so the file sits at:

```
~/.codex/skills/new-project-planner/SKILL.md
```

Start a new Codex session. The skill is picked up automatically when it matches the task.

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
- `notes/draft-zh-original.md` — the original Chinese draft this skill was translated from (kept for reference)
- `LICENSE` — MIT license

## License

MIT
