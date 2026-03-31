# Conventions

## 命名

- agent 文件：`agents/<agent-name>.md`
- 人物/实体记忆：`memories/<topic>.md`
- 项目：`projects/<project-name>.md`
- 决策：`decisions/YYYY-MM-DD-<topic>.md`
- 日志：`daily/YYYY-MM-DD.md`

## 记录格式

每条核心记录建议包含：

- `time`: 记录时间
- `source`: 来源，人工 / agent / 对话 / 系统
- `type`: preference / fact / behavior / decision / task
- `confidence`: high / medium / low

## 写入原则

- 事实和推测分开写
- 重要结论写明依据
- 能结构化就结构化
- 尽量追加，不覆盖历史
