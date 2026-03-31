#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
mode="${1:-status}"

case "$mode" in
  status)
    cat "$repo_dir/status/current.json"
    ;;
  heartbeat)
    cat "$repo_dir/status/heartbeat.json"
    ;;
  error)
    cat "$repo_dir/status/last_error.json"
    ;;
  progress)
    tail -n 5 "$repo_dir/logs/events.jsonl"
    ;;
  telegram)
    sed -n '1,200p' "$repo_dir/inbox/telegram.md"
    ;;
  *)
    echo "Usage: scripts/read-status.sh <status|heartbeat|error|progress|telegram>"
    exit 1
    ;;
esac
