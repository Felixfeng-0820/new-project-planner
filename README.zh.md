# Big Jump

[![check-skill](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml/badge.svg)](https://github.com/Felixfeng-0820/big-jump/actions/workflows/check-skill.yml)

🌐 网站：**https://felixfeng-0820.github.io/big-jump/**（[中文版](https://felixfeng-0820.github.io/big-jump/index.zh.html)）

> [English version](README.md)

一个给 AI 助手（Codex、Claude Code、Cursor、DeepSeek Harness 等工具）用的 skill，它把 AI 变成**自主执行的建设型教练**：你只丢给它一个模糊想法，它就自己拆解、给一句方向、自己把项目建出来——第一天就用 git、每个阶段都做真实验证——**每个模块验证通过后才简短讲解，讲完自动进入下一步**，直到项目在本地通过一份书面验收清单，并在你的账号连好的那一刻上线公网网址。

建设者会：

- 用一行说明自己的假设，然后立刻开工——不采访、不问"你会不会什么"、每一步都不申请许可
- 给**每个阶段写一行"完成标准"**，并跑一份最终验收清单：主路径走过、持久化以重载为证、边界输入试过、控制台干净（含 404）、损坏数据要警告并提供导出而不是静默清空、git 干净且每次提交过按赋值上下文判断的密钥闸门（不误报说明文字里的词）
- **先验证再声称**：功能的检查通过了才算完成，不是按钮有反应就算完成；每个阶段跑一套分层测试——`tests/check.sh --fast`（静态检查、`.gitignore` 生效性、密钥闸门、基线哈希、阶段对账、逻辑测试）和 `--full`（加一个可移植的浏览器冒烟测试，强制 try/finally 清理，或诚实降级到 jsdom 并标注"视觉检查已跳过"）
- **闸门是硬的**：密钥闸门是自测过的脚本，由真正的 git pre-commit hook 强制执行；任何失败步骤中止提交并打印可读的"什么/为什么/哪类/下一步"块——坏掉的闸门比没有闸门更糟
- **诚实地提交**：每阶段一个 `phase N:` 提交，与 `PROJECT_NOTES.md` 阶段清单自动对账——agent 没法用"一个提交 + 六行 passed"蒙混过关
- **动手前先问**：建仓库、推送、部署之前永远等你明确点头——"已登录"不等于"已允许"
- **保护你的工作**：动手前先记录工作区基线、绝不碰你已存在的文件、绝不 reset 或覆盖你未提交的改动、绝不 force-push；失败时只回滚它自己的修改
- **诚实地部署**：查授权、征得你同意，然后部署并验证公网网址——或者交给你一份简短清单（登录 + 确认 + 注意事项）。绝不声称一个它没打开验证过的网址
- 每个模块做完后用 4 行讲解（做了什么 / 为什么这样做 / 你学到了什么 / 验证了什么），聊天输出保持稀疏——没有进度卡、没有废话——然后自动继续
- 只在真正的卡点停下：它修不动的报错、缺密钥或账号、只有你能拍板的选择、花钱
- 带你避开经典大坑：密钥泄露、不加验证就信 AI、教程地狱、半途烂尾
- 带一个"不知道做什么"的方向指路器：问题猎取法、验证清单、产品化示例（`/ideas`）

它还包括：

- 一条用来安静调节讲解深度的 6 级学习路径
- 9 个可直接复制的提示词模板（规划、做功能、报错、解释代码、复盘、讲概念、代码审查、部署、先给方案）
- 一段完整工作流示范
- 10 个产品化项目点子，各带最小第一版和升级方向
- 一份 33 个词的人话版术语表
- 快捷指令：`/pause`、`/next`、`/explain`、`/review`、`/error`、`/deploy`、`/showcase`、`/teach`、`/stack`、`/ideas`、`/retrospective`

## 安装

这个 skill 使用标准的 Agent Skills 格式（一个文件夹里放一个 `SKILL.md`），所以任何支持 SKILL.md 的工具都能装。

### Codex

一条命令（macOS / Linux）：

```bash
bash install.sh
```

它会从 GitHub 仓库下载 `SKILL.md` 到 `~/.codex/skills/big-jump/`，并在旁边写一份 `install-info.txt`（来源仓库、提交号、安装时间），让你随时知道装的是什么、从哪来的。想更新就再跑一次。

### DeepSeek Harness

把 `big-jump` 文件夹放进项目里的 `.dsh/skills` 或 `.agents/skills` 目录，或者放进 `~/.dsh/skills`：

```
~/.dsh/skills/big-jump/SKILL.md
```

### Claude Code / Cursor

把文件夹放进对应工具的 skills 目录（例如 Claude Code 的 `~/.claude/skills/`，或 Cursor 项目里的 `.agents/skills` 文件夹）。

## 使用

开一个新对话，说一句模糊想法，例如：

> 我想做一个把 PDF 变成可提问摘要的 AI 工具。

加载了这个 skill 的 AI 应该：用一行说明假设、给一句方向、把项目拆成阶段，然后立刻开工——每个模块做完后回顾，不用你说"继续"。

如果 AI 没有自动加载，就明说一句：

> 使用 big-jump 这个 skill。

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
