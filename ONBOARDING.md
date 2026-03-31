# Onboarding

给新 agent 或新 AI 的最快接入路径。

## 30 秒版本

1. 读 `AGENTS.md`
2. 跑 `./scripts/preflight-check.sh`
3. 看 `system/routes.csv`
4. 看与你任务相关的 `projects/` 和 `memories/`
5. 开始前写一条 `logs/events.jsonl`
6. 结束时跑 `./scripts/session-close.sh`

## 推荐顺序

```bash
cd /Users/dc/ai-memory
./scripts/preflight-check.sh
git pull --rebase origin main
./scripts/log-event.sh <agent> behavior "start task" <topic> high
```

## 常见入口

- 用户偏好：`memories/user-preferences.md`
- 工作流规则：`memories/workflows.md`
- memory 总览：`memories/memory-map.md`
- 当前主项目：`projects/ai-memory.md`
- project 总览：`projects/project-map.md`
- topic 路由：`system/routes.csv`
- 统一规范：`AGENTS.md`

## 什么时候新建文件

- 只有当前 topic 没有主文件时才新建
- 新建前先查 `system/routes.csv`
- 新建后应考虑是否补一条 route

## 什么时候不要直接写正式文件

- 你不确定内容归属时
- 你不确定结论是否稳定时
- 你怀疑会和别的 agent 冲突时

这三种情况先写：

- `inbox/capture.md`
- `logs/events.jsonl`
