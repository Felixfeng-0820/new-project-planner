# Big Jump 🚀

> **一句模糊想法进，一个验证过的产品出。**

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml) · 🌐 [网站](https://felixfeng-0820.github.io/big-jump/index.zh.html) · [English README](README.md)

- 你有没有见过同学晒出自己做的网站，心想：*我也想做——但我根本不知道从哪开始？*
- 你想要的是一个任何人能打开的公开网址，而不是一个只能在自己电脑上打开的本地网页吗？
- 你是不是受够了玩具教程，想要一个真正能写进简历的东西？

只要点过头：**别再刷教程了。把这个 skill 交给你的 AI，说一句话，看它发生。**

## 3 步上手

1. 📦 **安装** —— 一条命令：`bash install.sh`
2. 💬 **说一句话** —— *"我想做一个背单词网站。"*
3. 🌍 **拿网址** —— 它自己建、自己测、自己提交、自己部署（经你同意 + 账号连好时），每个模块做完才给你讲 4 行。你负责验收，它负责执行。

## 以前 vs 现在

| 没有它 | 有了 Big Jump |
|---|---|
| 刷 100 小时教程，一个项目没做出来 | 一句话 → 6 个阶段 → 上线网址 |
| AI 倒出一堆代码，不敢信 | 每阶段过书面验收清单，含真实浏览器测试 |
| API key 泄露进 GitHub | 自测过的 pre-commit 密钥闸门挡住它 |
| 换个对话，项目就丢了 | 自动读 `PROJECT_NOTES.md` 续跑 |
| "按钮有反应"就当"做完了" | 持久化以重载为证；损坏数据警告 + 导出，绝不静默消失 |

## 凭什么信它

- 🔨 **不是纸上谈兵。** 这套规则经历过 6 轮真实项目测试，每一轮暴露的 bug——假部署、静默丢数据、不会失败的测试、残留进程——都修进了规则本身。
- ✅ **有真实作品背书。** 一个背单词网站已用它完整做出：6 个阶段、双层测试、浏览器冒烟测试，端到端验证通过。
- 🛡️ **硬约束，不靠自觉**：任何东西离开你的电脑前都要你点头 · 你的文件绝不碰 · 每阶段一个提交、自动对账 · 闸门坏了就中止提交。

## 它到底做什么

建设者用一行说明假设、立刻开工——不采访，不每步问"继续吗？"。然后：

- 给每个阶段写一行完成标准，最后跑一份书面验收清单
- 先验证再声称：每阶段跑 `tests/check.sh --fast`（静态检查、`.gitignore` 生效性、密钥闸门、哈希基线、阶段对账、逻辑测试），验收跑 `--full`（可移植浏览器冒烟测试，或诚实降级的 jsdom 方案）
- 建仓库、推送、部署前先征得你同意——"已登录"不等于"已允许"
- 保护你的工作：哈希基线、绝不 `reset --hard` 你的改动、绝不 force-push
- 诚实地部署：自己验证公网网址，或交给你一份简短登录清单——绝不声称它没打开过的网址
- 每个验证过的模块做完后讲 ≤4 行（做了什么/为什么/学到什么/验证了什么），聊天稀疏，没有进度卡
- 带方向指路器（`/ideas`）：不知道写啥时，一套问题猎取法 + 产品化示例

还包含：6 级学习路径、9 个提示词模板、10 个产品化项目点子、45 词人话术语表，以及快捷指令（`/pause`、`/next`、`/test`、`/explain`、`/review`、`/error`、`/deploy`、`/showcase`、`/teach`、`/stack`、`/ideas`、`/retrospective`）。

## 安装

这个 skill 使用标准 Agent Skills 格式（一个文件夹里放一个 `SKILL.md`），任何支持 SKILL.md 的工具都能装。

### Codex —— 一条命令

```bash
bash install.sh
```

它会从 GitHub 下载 `SKILL.md` 到 `~/.codex/skills/big-jump/`，并在旁边写一份 `install-info.txt`（来源仓库、提交号、安装时间）。想更新就再跑一次。

### DeepSeek Harness

把 `big-jump` 文件夹放进项目里的 `.dsh/skills` 或 `.agents/skills` 目录，或者放进 `~/.dsh/skills`。

### Claude Code / Cursor

把文件夹放进对应工具的 skills 目录（例如 `~/.claude/skills/`，或项目里的 `.agents/skills` 文件夹）。

## 使用

开新对话，说一句模糊想法：

> 我想做一个把 PDF 变成可提问摘要的 AI 工具。

AI 应该：一行说明假设、列出带完成标准的阶段、立刻开工——每个模块做完后回顾，不用你说"继续"。如果没自动加载，就说：*"使用 big-jump 这个 skill。"*

## 文件说明

- `SKILL.md` — skill 本体（英文，实际被 AI 加载）
- `README.md` / `README.zh.md` — 英文 / 中文说明书
- `docs/index.html` / `docs/index.zh.html` — 展示网站（英文 / 中文，托管在 GitHub Pages）
- `install.sh` — 一键安装脚本，带来源和版本记录
- `.github/workflows/check-skill.yml` — 每次推送自动健康检查
- `notes/draft-zh-original.md` — 最初的中文草稿（存档）
- `notes/SKILL-zh.md` — `SKILL.md` 的完整中文翻译（仅供阅读）
- `LICENSE` — MIT 开源许可

## 许可

MIT
