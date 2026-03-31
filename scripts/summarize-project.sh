#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
project="${1:-}"
events_file="$repo_dir/logs/events.jsonl"
project_file="$repo_dir/projects/$project.md"
tmp_file="$(mktemp)"

if [ -z "$project" ]; then
  echo "Usage: scripts/summarize-project.sh <project-name>"
  exit 1
fi

if [ ! -f "$project_file" ]; then
  echo "Missing project file: $project_file"
  exit 1
fi

awk -v topic="$project" '
  index($0, "\"topic\":\""topic"\"") > 0 {
    line=$0
    time=line; sub(/^.*"time":"?/, "", time); sub(/".*$/, "", time)
    agent=line; sub(/^.*"agent":"?/, "", agent); sub(/".*$/, "", agent)
    type=line; sub(/^.*"type":"?/, "", type); sub(/".*$/, "", type)
    summary=line; sub(/^.*"summary":"?/, "", summary); sub(/","topic".*$/, "", summary)
    print "- " time " | " agent " [" type "]: " summary
  }
' "$events_file" > "$tmp_file"

{
  echo ""
  echo "## Recent Event Summary"
  if [ -s "$tmp_file" ]; then
    cat "$tmp_file"
  else
    echo "- No events found for topic: $project"
  fi
} >> "$project_file"

rm -f "$tmp_file"
echo "Updated project summary: $project_file"
