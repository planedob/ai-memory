#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"

echo "== Required docs =="
echo "Read: AGENTS.md"
echo "Read: README.md"
echo "Read: system/preflight.md"
echo "Read: system/change-control.md"
echo "Read: system/agent-protocol.md"

echo ""
echo "== Git status =="
git -C "$repo_dir" status -sb

echo ""
echo "== Route files =="
ls "$repo_dir/system/routes.csv" >/dev/null 2>&1 && echo "OK: system/routes.csv"
ls "$repo_dir/logs/events.jsonl" >/dev/null 2>&1 && echo "OK: logs/events.jsonl"

echo ""
echo "== Reminder =="
echo "Before editing: git pull --rebase origin main"
echo "Before leaving: ./scripts/session-close.sh <agent> \"<summary>\" <topic>"
