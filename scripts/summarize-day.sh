#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
day="${1:-$(date +%F)}"
events_file="$repo_dir/logs/events.jsonl"
inbox_file="$repo_dir/inbox/capture.md"
daily_file="$repo_dir/daily/$day.md"
tmp_file="$(mktemp)"
body_file="$(mktemp)"

if [ ! -f "$daily_file" ]; then
  "$repo_dir/scripts/new-day.sh"
fi

awk -v day="$day" '
  index($0, "\""day"T") > 0 {
    line=$0
    agent=line; sub(/^.*"agent":"?/, "", agent); sub(/".*$/, "", agent)
    type=line; sub(/^.*"type":"?/, "", type); sub(/".*$/, "", type)
    summary=line; sub(/^.*"summary":"?/, "", summary); sub(/","topic".*$/, "", summary)
    print "- " agent " [" type "]: " summary
  }
' "$events_file" > "$tmp_file"

awk '
  /<!-- AUTO_SUMMARY_START -->/ { skip=1; next }
  /<!-- AUTO_SUMMARY_END -->/ { skip=0; next }
  !skip { print }
' "$daily_file" > "$body_file"
mv "$body_file" "$daily_file"

{
  echo ""
  echo "<!-- AUTO_SUMMARY_START -->"
  echo "## Auto Summary"
  echo ""
  echo "### Event Stream"
  if [ -s "$tmp_file" ]; then
    cat "$tmp_file"
  else
    echo "- No events for $day"
  fi
  echo ""
  echo "### Inbox Snapshot"
  sed -n '/## Entries/,$p' "$inbox_file"
  echo "<!-- AUTO_SUMMARY_END -->"
} >> "$daily_file"

rm -f "$tmp_file"
echo "Summarized into: $daily_file"
