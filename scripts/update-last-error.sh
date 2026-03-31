#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/status/last_error.json"
timestamp="$(date '+%Y-%m-%dT%H:%M:%S%z')"
timestamp="${timestamp:0:22}:${timestamp:22:2}"

agent="${1:-}"
topic="${2:-general}"
summary="${3:-}"
details="${4:-}"

if [ -z "$agent" ] || [ -z "$summary" ]; then
  echo "Usage: scripts/update-last-error.sh <agent> <topic> <summary> [details]"
  exit 1
fi

escaped_agent="${agent//\"/\\\"}"
escaped_topic="${topic//\"/\\\"}"
escaped_summary="${summary//\"/\\\"}"
escaped_details="${details//\"/\\\"}"

cat > "$target" <<EOF
{
  "time": "$timestamp",
  "agent": "$escaped_agent",
  "topic": "$escaped_topic",
  "summary": "$escaped_summary",
  "details": "$escaped_details"
}
EOF

echo "Updated: $target"
