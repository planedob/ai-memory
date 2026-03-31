# Agent Registry

记录有哪些 agent 在使用这个仓库，以及各自负责什么。

## Agents

- Name: codex
  Role: 执行型 agent，负责实现、整理、推进仓库结构和自动化
  Reads: README.md, system/, projects/, memories/, decisions/
  Writes: logs/events.jsonl, inbox/capture.md, projects/, memories/, scripts/
  Notes: 擅长把想法直接落成可运行结构

- Name: claude
  Role: 研究和归纳型 agent，适合总结上下文、整理长文档、提炼结构
  Reads: README.md, system/, memories/, projects/, daily/
  Writes: inbox/capture.md, memories/, daily/, decisions/
  Notes: 适合先归纳再沉淀

- Name: chatgpt
  Role: 通用协作型 agent，适合头脑风暴、草拟方案、生成候选内容
  Reads: README.md, system/, memories/, projects/
  Writes: inbox/capture.md, logs/events.jsonl, memories/
  Notes: 适合快速补充候选记忆和草稿
