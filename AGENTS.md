# AGENTS

这个文件是所有 AI 进入仓库后的第一入口。

## First Read

进入仓库后，按这个顺序阅读：

1. `AGENTS.md`
2. `README.md`
3. `system/preflight.md`
4. `system/change-control.md`
5. `system/agent-protocol.md`

## Hard Rules

- 开始前先执行 `git pull --rebase origin main`
- 开始前先检查 `git status --short`
- 开始前先确认目标 topic 是否已有主文件
- 不允许为同一个 topic 重复创建主文件
- 不允许删除 `logs/events.jsonl` 历史事件
- 不允许把 secrets 写进仓库
- 每次会话至少记录一条事件日志
- 每次会话结束必须形成一个 Git commit
- 所有改动必须可通过 Git 历史回溯

## Required Flow

1. 运行 `./scripts/preflight-check.sh`
2. 用 `./scripts/log-event.sh` 记录开始事件
3. 修改目标文件
4. 需要时运行 `./scripts/summarize-day.sh`、`./scripts/summarize-project.sh`、`./scripts/route-event.sh`
5. 最后运行 `./scripts/session-close.sh <agent> "<summary>" <topic>`

## One Topic, One Home

- 项目类信息优先进入 `projects/<topic>.md`
- 长期主题优先进入 `memories/<topic>.md`
- 路由规则以 `system/routes.csv` 为准
- 如发现重复文件，先合并，再删旧文件，并记录原因

## Traceability

每次改动必须留下三层痕迹：

1. `logs/events.jsonl`
2. 对应 Markdown 文件变化
3. Git commit

缺少其中任何一层，都算不完整变更。

## Rollback

- 查看历史：`git log --oneline`
- 查看具体改动：`git show <commit>`
- 回退优先使用：`git revert <commit>`
- 不要强推改写公共历史

## Working Agreement

- 小改也要记
- 结构改动先更新文档
- 不确定写哪里时，先查 `system/routes.csv`
- 不确定是否会冲突时，先停在 `inbox/` 或 `logs/events.jsonl`
