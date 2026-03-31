#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/status/heartbeat.json"
timestamp="$(date '+%Y-%m-%dT%H:%M:%S%z')"
timestamp="${timestamp:0:22}:${timestamp:22:2}"

agent="${1:-}"
heartbeat_status="${2:-running}"
note="${3:-}"
pid="${4:-$$}"

if [ -z "$agent" ]; then
  echo "Usage: scripts/update-heartbeat.sh <agent> [status] [note] [pid]"
  exit 1
fi

escaped_agent="${agent//\"/\\\"}"
escaped_status="${heartbeat_status//\"/\\\"}"
escaped_note="${note//\"/\\\"}"
escaped_pid="${pid//\"/\\\"}"

cat > "$target" <<EOF
{
  "agent": "$escaped_agent",
  "status": "$escaped_status",
  "updated_at": "$timestamp",
  "pid": "$escaped_pid",
  "note": "$escaped_note"
}
EOF

echo "Updated: $target"
