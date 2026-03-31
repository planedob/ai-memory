#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
target="$repo_dir/inbox/telegram.md"
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
sender="${1:-telegram-user}"
type="${2:-todo}"
content="${3:-}"
entry_status="${4:-new}"

if [ -z "$content" ]; then
  echo "Usage: scripts/telegram-inbox.sh <sender> <type> <content> [status]"
  exit 1
fi

cat >> "$target" <<EOF

- Time: $timestamp
  Sender: $sender
  Type: $type
  Content: $content
  Status: $entry_status
EOF

echo "Appended to: $target"
