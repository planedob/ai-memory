#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
today="$(date +%F)"
daily_file="$repo_dir/daily/$today.md"
inbox_file="$repo_dir/inbox/capture.md"

if [ ! -f "$daily_file" ]; then
  "$repo_dir/scripts/new-day.sh"
fi

{
  echo ""
  echo "## Inbox Review"
  echo ""
  sed -n '/## Entries/,$p' "$inbox_file"
} >> "$daily_file"

echo "Appended inbox snapshot to: $daily_file"
echo "You can now manually prune or rewrite $inbox_file"
