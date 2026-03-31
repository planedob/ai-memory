# AI Memory Repo

一个给多 agent / 多 AI 共用的 GitHub 记忆仓库。

目标：

- 把行为、决策、偏好、项目状态集中存储
- 让不同 agent 读同一份上下文，减少重复解释
- 用 Git 历史保留变化过程，方便回溯
- 用统一事件流沉淀所有 agent 行为

## 目录

- `agents/`: 每个 agent 的角色说明、工作方式、偏好
- `memories/`: 长期记忆，例如人物、偏好、规则、事实
- `projects/`: 项目级上下文、进度、待办
- `daily/`: 每日工作日志
- `inbox/`: 临时记录，之后再整理
- `decisions/`: 重要决策记录
- `logs/`: 行为日志或自动化输出
- `system/`: 仓库级约定、标签、命名规范
- `templates/`: 模板
- `scripts/`: 辅助脚本

## 核心文件

- `logs/events.jsonl`: 所有 agent 的结构化行为流
- `inbox/capture.md`: 快速落地的临时收件箱
- `agents/registry.md`: agent 注册表
- `system/agent-protocol.md`: 多 agent 读写协议
- `system/taxonomy.md`: 统一标签与字段建议

## 建议工作流

1. 新的一天先运行 `scripts/new-day.sh`
2. agent 开始工作前先阅读 `system/agent-protocol.md`
3. 有临时想法、行为、对话结论时先写到 `inbox/capture.md`
4. 同时把关键行为写入 `logs/events.jsonl`
5. 每天结束前把 inbox 整理到 `memories/`、`projects/`、`decisions/` 或 `daily/`
6. 每次整理后提交到 Git

## 快速命令

```bash
cd /Users/dc/ai-memory
./scripts/new-day.sh
./scripts/capture.sh codex "用户希望把所有 agent 记忆统一到 GitHub"
./scripts/log-event.sh codex behavior "initialized repo structure" ai-memory high
./scripts/init-memory-file.sh memory user-preferences
```

## 建议存什么

- 用户偏好：说话风格、工具习惯、禁忌
- 事实记忆：账号、环境、目录、依赖关系
- 行为记忆：做过什么、什么时候做的、为什么做
- 决策记忆：做了什么选择、权衡是什么
- 项目记忆：目标、当前状态、阻塞点、下一步

## GitHub 使用建议

- 仓库设为私有
- 所有 agent 都只写 Markdown / JSON / YAML 这类可 diff 的文本
- 用 Pull Request 或最少 commit message 保留变更原因
- 不要存明文密码、令牌、私钥

## 最小规则

- 长期事实放 `memories/`
- 临时信息先放 `inbox/`
- 项目上下文放 `projects/`
- 有结论的选择放 `decisions/`
- 每条记录尽量带时间、来源、置信度
- 所有关键 agent 行为追加到 `logs/events.jsonl`

## 推荐协作方式

- 每个 agent 先声明自己会读哪些文件、写哪些文件
- 先把原始观察写进 `inbox/` 或 `logs/events.jsonl`
- 整理后再沉淀成长期记忆
- 事实、推断、计划分开写
