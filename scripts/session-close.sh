#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
agent="${1:-}"
summary="${2:-}"
topic="${3:-general}"
confidence="${4:-high}"

if [ -z "$agent" ] || [ -z "$summary" ]; then
  echo "Usage: scripts/session-close.sh <agent> <summary> [topic] [confidence]"
  exit 1
fi

"$repo_dir/scripts/log-event.sh" "$agent" behavior "$summary" "$topic" "$confidence"
"$repo_dir/scripts/summarize-day.sh"
"$repo_dir/scripts/summarize-project.sh" "$topic" >/dev/null 2>&1 || true
"$repo_dir/scripts/route-event.sh" "$topic"

git -C "$repo_dir" add .

if git -C "$repo_dir" diff --cached --quiet; then
  echo "No staged changes."
  exit 0
fi

git -C "$repo_dir" commit -m "Session close: $agent - $topic"
git -C "$repo_dir" push origin main

echo "Session closed and pushed."
