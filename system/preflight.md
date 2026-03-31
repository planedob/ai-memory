# Preflight For All AI

所有 AI 在写入这个仓库前，必须先完成以下检查。

## 必读文件

- `README.md`
- `system/preflight.md`
- `system/change-control.md`
- `system/agent-protocol.md`
- `system/conventions.md`
- `system/taxonomy.md`

## 开始写之前

1. 先 `git pull --rebase origin main`
2. 先看 `git status --short`
3. 确认本次会写哪些文件
4. 先看目标 topic 是否已有对应的 `projects/` 或 `memories/` 文件
5. 先写一条 `logs/events.jsonl`，记录本次任务开始

## 写入约束

- 不直接覆盖别人的结论
- 不删除历史事件
- 不跳过 `logs/events.jsonl`
- 不把 secrets 写进仓库
- 不新增重复主题文件，优先复用已有文件

## 统一入口

- 记录行为：`./scripts/log-event.sh`
- 快速收件：`./scripts/capture.sh`
- topic 路由：`./scripts/route-topic.sh`
- 会话收尾：`./scripts/session-close.sh`

## 离开前

1. 运行 `./scripts/session-close.sh <agent> "<summary>" <topic>`
2. 确认 `git status --short` 为空
3. 确认远端已经 push 成功
