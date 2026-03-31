# Telegram Bridge

这层只做本地实时状态，不把实时进度频繁同步到 GitHub。

## 设计原则

- Telegram 只读取本地状态文件
- Codex 只写本地状态文件
- GitHub 继续承担长期记忆和历史追溯，不承担实时状态总线

## 本地状态源

- `status/current.json`: 当前任务、阶段、最近摘要、是否阻塞
- `status/heartbeat.json`: 最近活跃时间、运行状态
- `status/last_error.json`: 最近错误
- `logs/events.jsonl`: 关键行为流水
- `inbox/telegram.md`: Telegram 投递进来的待办

## Telegram 命令建议

- `/status`: 读取 `status/current.json`
- `/progress`: 读取 `logs/events.jsonl` 最近几条
- `/error`: 读取 `status/last_error.json`
- `/todo <content>`: 追加到 `inbox/telegram.md`

## 最小桥接流程

1. Codex 开始任务时更新 `status/current.json`
2. Codex 保持刷新 `status/heartbeat.json`
3. Codex 每完成关键步骤追加 `logs/events.jsonl`
4. 如果报错，写 `status/last_error.json`
5. Telegram Bot 只负责读这些文件并返回给用户

## 为什么不直接用 GitHub 做实时层

- 实时更新会造成大量 commit 噪音
- 读取到的通常不是最新状态
- 多 agent 高频 push 更容易冲突
- 有些临时状态不值得长期同步
