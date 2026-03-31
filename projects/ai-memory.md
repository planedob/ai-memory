# Project - ai-memory

## Goal

- 建一个适合多 agent / 多 AI 共用的 GitHub 记忆系统

## Current State

- 本地与 GitHub 私有仓库已建立
- 已有基础模板、事件流、capture 脚本
- 已切换到专用 SSH key

## Important Context

- 这个仓库应该优先保存文本化、可 diff 的记忆
- 不存放明文 secrets
- 关键行为需要进入 `logs/events.jsonl`

## Next Actions

- 持续把真实任务行为写入事件流
- 把用户偏好整理到 `memories/user-preferences.md`
- 为不同 agent 分别建立 `agents/*.md`

## Risks

- 如果不定期整理，inbox 会很快堆积
- 若多个 agent 不遵守协议，信息会变得混乱
