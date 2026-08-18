# Big Jump 🚀

> **One vague sentence in. A verified, deployable product out.**

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml) · 🌐 [Website](https://felixfeng-0820.github.io/big-jump/) · [中文版 README](README.zh.md)

**For the student who watches classmates ship their own websites in freshman year — and wonders where to even start.**

- Have you ever seen a classmate show off a website they built by themselves, and thought: *I want to do that too — but where do I even start?*
- Do you want a real URL anyone can open — not a page that only runs on your laptop?
- Are you done with toy tutorials, and ready for something you can actually put on your resume?

If you nodded: stop watching tutorials. **Hand this skill to your AI, say one sentence, and watch it happen.**

## It takes 3 steps

1. 📦 **Install** — one command: `bash install.sh`
2. 💬 **Say the thing** — *"I want to build a vocabulary drill website."*
3. 🌍 **Get the URL** — it builds, tests, commits, and deploys (with your OK and your accounts connected), teaching you 4 lines per module along the way. You review; it executes.

## Before vs after

| Without it | With Big Jump |
|---|---|
| 100 hours of tutorials, zero projects shipped | One sentence → 6 phases → live URL |
| A wall of AI code you don't dare trust | Every phase passes a written acceptance checklist, including a real browser test |
| API keys leaked into GitHub | A self-tested pre-commit secrets gate blocks them |
| A new chat = a lost project | It resumes from `PROJECT_NOTES.md` automatically |
| "The button reacts" = "it's done" | Persistence proven by reload; broken data warns and exports, never silently vanishes |

## Why you can trust it

- 🔨 **Not paper rules.** This skill went through 6 rounds of real-project testing; every bug those runs exposed — fake deploys, silent data loss, tests that couldn't fail, leaked processes — is fixed in the rules themselves.
- ✅ **A real project already shipped with it**: a vocabulary drill site, 6 phases, tiered tests, browser smoke test — built by the skill, verified end-to-end.
- 🛡️ **Hard constraints, not vibes**: nothing leaves your machine without your OK · your files are never touched · one commit per phase, audited automatically · a broken gate aborts the commit.

## What it actually does

The builder states its assumptions in one line and starts immediately — no interviews, no "continue?" after every step. Then it:

- defines a written definition of done per phase and a final acceptance checklist
- verifies before it claims: `tests/check.sh --fast` every phase (static checks, `.gitignore` effectiveness, secrets gate, hashed baseline, phase audit, logic tests) and `--full` at acceptance (portable browser smoke test, or an honest jsdom fallback)
- asks your OK before creating a repo, pushing, or deploying — being logged in is not permission
- protects your work: worktree baseline with hashes, never `reset --hard` your changes, never force-push
- deploys honestly: verifies the public URL itself, or hands you a short login checklist — never claims a URL it did not open
- teaches after each verified module in ≤4 lines (what / why / learned / verified), sparse chat, no progress cards
- has a direction finder (`/ideas`) for "I don't know what to build": a problem-hunting method plus product-shaped examples

Also included: a 6-rung learning path, 9 prompt templates, 10 product-shaped project ideas, a 45-term plain-language glossary, and quick commands (`/pause`, `/next`, `/test`, `/explain`, `/review`, `/error`, `/deploy`, `/showcase`, `/teach`, `/stack`, `/ideas`, `/retrospective`).

## Install

This skill uses the standard Agent Skills format (a folder with a `SKILL.md`), so it works in any tool that supports SKILL.md skills.

### Codex — one command

```bash
bash install.sh
```

Downloads `SKILL.md` into `~/.codex/skills/big-jump/` and writes an `install-info.txt` (source repo, commit, install date) beside it. Re-run anytime to update.

### DeepSeek Harness

Put the `big-jump` folder into `.dsh/skills` or `.agents/skills` in your project, or into `~/.dsh/skills`.

### Claude Code / Cursor

Install the folder into the tool's skills directory (e.g. `~/.claude/skills/`, or the `.agents/skills` project folder).

## Usage

In a new chat, say a vague idea:

> I want to build an AI tool that turns PDFs into summaries I can ask questions about.

The assistant should state its assumptions in one line, list phases with definitions of done, and start building — recapping after each module without waiting for "continue". If it does not pick the skill up automatically, say: *"Use the big-jump skill."*

## Files

- `SKILL.md` — the skill itself (English, what the AI actually loads)
- `README.md` / `README.zh.md` — English / Chinese readme
- `docs/index.html` / `docs/index.zh.html` — the showcase website (English / Chinese, GitHub Pages)
- `install.sh` — one-command installer with provenance record
- `.github/workflows/check-skill.yml` — automatic health check on every push
- `notes/draft-zh-original.md` — the original Chinese draft (archived)
- `notes/SKILL-zh.md` — full Chinese translation of `SKILL.md` (for reading)
- `LICENSE` — MIT

## License

MIT
