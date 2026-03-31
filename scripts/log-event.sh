#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/logs/events.jsonl"
timestamp="$(date '+%Y-%m-%dT%H:%M:%S%z')"
timestamp="${timestamp:0:22}:${timestamp:22:2}"

agent="${1:-}"
type="${2:-}"
summary="${3:-}"
topic="${4:-general}"
confidence="${5:-medium}"

if [ -z "$agent" ] || [ -z "$type" ] || [ -z "$summary" ]; then
  echo "Usage: scripts/log-event.sh <agent> <type> <summary> [topic] [confidence]"
  exit 1
fi

escaped_summary="${summary//\"/\\\"}"
escaped_topic="${topic//\"/\\\"}"

printf '{"time":"%s","agent":"%s","type":"%s","summary":"%s","topic":"%s","confidence":"%s","tags":["%s"]}\n' \
  "$timestamp" "$agent" "$type" "$escaped_summary" "$escaped_topic" "$confidence" "$type" >> "$target"

echo "Logged event to: $target"
