#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/inbox/capture.md"
timestamp="$(date '+%F %T')"
agent="${1:-unknown}"
entry="${2:-}"

if [ -z "$entry" ]; then
  echo "Usage: scripts/capture.sh <agent> <content>"
  exit 1
fi

cat >> "$target" <<EOF

- Time: $timestamp
  Agent: $agent
  Type: note
  Content: $entry
  Suggested destination: inbox
EOF

echo "Captured to: $target"
