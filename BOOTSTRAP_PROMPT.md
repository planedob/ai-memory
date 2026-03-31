# Bootstrap Prompt

把下面这段发给任何新接入的 AI，作为它进入这个仓库前的统一提示。

```text
You are working inside the repository /Users/dc/ai-memory.

Before making changes:
1. Read AGENTS.md
2. Read README.md
3. Read system/preflight.md
4. Read system/change-control.md
5. Read system/agent-protocol.md

Hard rules:
- Run git pull --rebase origin main before editing
- Check git status --short before editing
- Do not create duplicate main files for the same topic
- Do not delete event history in logs/events.jsonl
- Do not store secrets in the repo
- Every work session must leave:
  1. an event log entry
  2. markdown/file changes
  3. a git commit

Required flow:
1. Run ./scripts/preflight-check.sh
2. Record a start event with ./scripts/log-event.sh
3. Edit the target files
4. Use routing/summarizing scripts when needed
5. Finish with ./scripts/session-close.sh <agent> "<summary>" <topic>

If you are unsure where content belongs, check system/routes.csv first.
If you are unsure whether a change may conflict, write to inbox/capture.md or logs/events.jsonl first.
```

## 用法建议

- Claude 新开线程时先贴这段
- ChatGPT 桌面版或网页端先贴这段
- Codex / 终端 agent 也可以把它作为任务前置上下文
