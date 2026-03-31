#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
events_file="$repo_dir/logs/events.jsonl"
topic="${1:-}"

if [ -z "$topic" ]; then
  echo "Usage: scripts/route-event.sh <topic>"
  exit 1
fi

project_target="$("$repo_dir/scripts/route-topic.sh" project "$topic")"

if [ ! -f "$repo_dir/$project_target" ]; then
  "$repo_dir/scripts/init-memory-file.sh" project "$topic" >/dev/null
  project_target="projects/$topic.md"
fi

tmp_file="$(mktemp)"
body_file="$(mktemp)"

awk -v topic="$topic" '
  index($0, "\"topic\":\""topic"\"") > 0 {
    line=$0
    time=line; sub(/^.*"time":"?/, "", time); sub(/".*$/, "", time)
    agent=line; sub(/^.*"agent":"?/, "", agent); sub(/".*$/, "", agent)
    type=line; sub(/^.*"type":"?/, "", type); sub(/".*$/, "", type)
    summary=line; sub(/^.*"summary":"?/, "", summary); sub(/","topic".*$/, "", summary)
    print "- " time " | " agent " [" type "]: " summary
  }
' "$events_file" > "$tmp_file"

awk '
  /<!-- ROUTED_EVENTS_START -->/ { skip=1; next }
  /<!-- ROUTED_EVENTS_END -->/ { skip=0; next }
  !skip { print }
' "$repo_dir/$project_target" > "$body_file"
mv "$body_file" "$repo_dir/$project_target"

{
  echo ""
  echo "<!-- ROUTED_EVENTS_START -->"
  echo "## Routed Events"
  if [ -s "$tmp_file" ]; then
    cat "$tmp_file"
  else
    echo "- No routed events found for topic: $topic"
  fi
  echo "<!-- ROUTED_EVENTS_END -->"
} >> "$repo_dir/$project_target"

rm -f "$tmp_file"
echo "Routed events into: $repo_dir/$project_target"
