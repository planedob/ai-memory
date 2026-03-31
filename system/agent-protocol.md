# Agent Protocol

所有 agent 进入仓库后，默认遵守这份协议。

## 开始工作前要读

- `README.md`
- `system/conventions.md`
- `system/taxonomy.md`
- 与当前任务相关的 `projects/`、`memories/`、`decisions/`

## 工作时怎么写

1. 关键行为先写入 `logs/events.jsonl`
2. 临时观察写到 `inbox/capture.md`
3. 确认稳定的信息再整理到正式目录

## 什么算关键行为

- 接收了什么任务
- 做了什么修改
- 为什么这样做
- 得到了什么结果
- 是否有阻塞和风险

## 最小事件字段

- `time`
- `agent`
- `type`
- `summary`
- `topic`
- `confidence`

## 推荐整理频率

- 单次会话结束前整理一次
- 每天结束前整理一次
- 重要决策发生后立即写入 `decisions/`

## 冲突处理

- 不覆盖别的 agent 的原始记录
- 如果结论不同，分别记录并注明依据
- 后续由人或主 agent 进行合并判断
