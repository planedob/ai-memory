# Change Control

这个仓库的目标不是“谁都能改”，而是“所有改动都可追溯、可复盘、可回档”。

## 强制规则

- 每次会话至少一条事件日志
- 每次会话结束必须形成一个 Git commit
- commit 必须能说明是谁、改了什么、作用于哪个 topic
- 重要结构调整必须更新 `README.md` 或 `system/` 文档

## 推荐流程

1. `git pull --rebase origin main`
2. 阅读 `system/preflight.md`
3. 记录任务开始事件
4. 编辑目标文件
5. 运行汇总和路由脚本
6. 用 `./scripts/session-close.sh` 收尾

## 防冲突规则

- 一个 topic 只保留一个主项目文件
- 一个长期主题只保留一个主 memory 文件
- 需要拆分时，必须先在 `README.md` 或 `system/routes.csv` 记录拆分原因
- 如果发现重复文件，优先合并内容，再删除旧文件

## 回档规则

- 以 Git commit 为唯一回档基准
- 不允许直接改写远端历史
- 回退优先使用 `git revert <commit>`
- 如果只是查历史，优先用 `git log --oneline` 和 `git show <commit>`

## 审计线索

改动需要同时留下这三层痕迹：

- `logs/events.jsonl`: 行为记录
- Markdown 文件变更: 内容记录
- Git commit: 版本记录

只改文件、不记事件，视为不完整变更。
