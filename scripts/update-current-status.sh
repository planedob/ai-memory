#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/status/current.json"
timestamp="$(date '+%Y-%m-%dT%H:%M:%S%z')"
timestamp="${timestamp:0:22}:${timestamp:22:2}"

task="${1:-}"
phase="${2:-}"
summary="${3:-}"
topic="${4:-}"
blocked="${5:-false}"
cwd="${6:-$repo_dir}"
last_error="${7:-}"

if [ -z "$task" ] || [ -z "$phase" ] || [ -z "$summary" ]; then
  echo "Usage: scripts/update-current-status.sh <task> <phase> <summary> [topic] [blocked] [cwd] [last_error]"
  exit 1
fi

escaped_task="${task//\"/\\\"}"
escaped_phase="${phase//\"/\\\"}"
escaped_summary="${summary//\"/\\\"}"
escaped_cwd="${cwd//\"/\\\"}"
escaped_error="${last_error//\"/\\\"}"

existing_started_at="$(sed -n 's/.*"started_at": "\(.*\)",*/\1/p' "$target" | head -n 1)"
if [ -z "$existing_started_at" ] || [ "$phase" = "started" ]; then
  existing_started_at="$timestamp"
fi

cat > "$target" <<EOF
{
  "task": "$escaped_task",
  "phase": "$escaped_phase",
  "started_at": "$existing_started_at",
  "updated_at": "$timestamp",
  "blocked": $blocked,
  "last_summary": "$escaped_summary",
  "cwd": "$escaped_cwd",
  "last_error": "$escaped_error"
}
EOF

echo "Updated: $target"
