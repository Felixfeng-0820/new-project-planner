# new-project-planner

[![check-skill](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/new-project-planner/actions/workflows/check-skill.yml)

🌐 网站：**https://felixfeng-0820.github.io/new-project-planner/**（[中文版](https://felixfeng-0820.github.io/new-project-planner/index.zh.html)）

> [English version](README.md)

一个给 AI 助手（Codex、Claude Code、Cursor、DeepSeek Harness 等工具）用的 skill，它能把 AI 变成一位 Vibe Coding 教练，服务对象是**那些看着同学大一大二就自己做出网站、心里又羡慕又憋着一股劲、却不知道从哪下手的大学生**。

教练会用直击内心的疑问句开场——*"你有没有见过同学晒出自己做的网站，心想：我也想做——但我根本不知道从哪开始？"*——匹配用户的水平，然后：

- 在写代码**之前**，先弄清楚目标和最小第一版
- 把用户放进一条 6 级学习路径（HTML/CSS → JavaScript → git → 部署 → 数据与 API → 进阶）里定位，缺什么教什么
- 帮迷茫的新手指方向：兴趣 → 项目地图、校园痛点 → 工具地图、三问指路器（`/ideas`）
- 把项目拆成包含**真实工程实践**的阶段：第一天就用 git、第 2 阶段就首次部署、需要时引入 API 和数据库
- **保证最终成果是一个公网网址**——绝不只是本地网页；部署作为旅程的一部分一步步教
- 提高标准：先能跑、再好看、最后惊艳（干净界面、深色模式、真实数据、自定义域名）
- 一次一小步地推进；用户跟得上就提速
- 一边做一边教提示词，附带 9 个可直接复制的模板
- 想法太大时诚实地"说不"
- 带用户避开经典大坑：教程地狱、粘贴看不懂的代码、密钥泄露进 git、对 AI 输出照单全收
- 验证一切：把 AI 输出当草稿——运行它、要理由、查官方文档
- 部署后闭环：朋友试用反馈、带截图的 README、一句简历话术（`/showcase`）
- 每条回复结尾附一张"进度卡"，换新对话也不丢进度
- 用清晰但不居高临下的语言解释每次改动和每个报错

它还包括：

- 9 个可直接复制的提示词模板（规划项目、做功能、报错求助、解释代码、复盘、讲透概念、代码审查、部署上线、先给方案再动手）
- 一段完整示范对话（以课程表网站为例）
- 10 个学生向项目点子（简历主页、GPA 计算器、校园二手平台、AI 学习助手……），各带最小第一版和升级方向
- 一份 33 个词的人话版术语表
- 快捷指令：`/start`、`/breakdown`、`/next`、`/teach-prompt`、`/check`、`/error`、`/explain`、`/ideas`、`/teach`、`/review`、`/stack`、`/deploy`、`/showcase`、`/retrospective`

## 安装

这个 skill 使用标准的 Agent Skills 格式（一个文件夹里放一个 `SKILL.md`），所以任何支持 SKILL.md 的工具都能装。

### Codex

一条命令（macOS / Linux）：

```bash
bash install.sh
```

它会自动把 `SKILL.md` 复制到 `~/.codex/skills/new-project-planner/`。开一个新的 Codex 会话，任务匹配时就会自动生效。

### DeepSeek Harness

把 `new-project-planner` 文件夹放进项目里的 `.dsh/skills` 或 `.agents/skills` 目录，或者放进 `~/.dsh/skills`：

```
~/.dsh/skills/new-project-planner/SKILL.md
```

### Claude Code / Cursor

把文件夹放进对应工具的 skills 目录（例如 Claude Code 的 `~/.claude/skills/`，或 Cursor 项目里的 `.agents/skills` 文件夹）。

## 使用

开一个新对话，随便说一个模糊想法，例如：

> 我想做一个课程表网站。

加载了这个 skill 的 AI 就会像教练一样回复：先理清想法、把你放到学习路径上定位、定好最小第一版，再交给你一个小步骤。

如果 AI 没有自动加载，就明说一句：

> 使用 new-project-planner 这个 skill。

## 文件说明

- `SKILL.md` — skill 本体（英文，实际被 AI 加载）
- `README.md` / `README.zh.md` — 英文 / 中文说明书
- `docs/index.html` / `docs/index.zh.html` — 展示网站（英文 / 中文，托管在 GitHub Pages）
- `install.sh` — 一键安装脚本（给 Codex 用）
- `.github/workflows/check-skill.yml` — 每次推送自动做健康检查
- `notes/draft-zh-original.md` — 最初的中文草稿（存档）
- `notes/SKILL-zh.md` — `SKILL.md` 的完整中文翻译（仅供阅读）
- `LICENSE` — MIT 开源许可

## 许可

MIT
