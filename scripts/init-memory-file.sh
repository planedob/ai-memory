#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
kind="${1:-}"
name="${2:-}"

if [ -z "$kind" ] || [ -z "$name" ]; then
  echo "Usage: scripts/init-memory-file.sh <memory|project|agent|decision> <name>"
  exit 1
fi

case "$kind" in
  memory)
    template="$repo_dir/templates/memory-template.md"
    target="$repo_dir/memories/$name.md"
    ;;
  project)
    template="$repo_dir/templates/project-template.md"
    target="$repo_dir/projects/$name.md"
    ;;
  agent)
    template="$repo_dir/templates/agent-template.md"
    target="$repo_dir/agents/$name.md"
    ;;
  decision)
    template="$repo_dir/templates/decision-template.md"
    target="$repo_dir/decisions/$(date +%F)-$name.md"
    ;;
  *)
    echo "Unknown kind: $kind"
    exit 1
    ;;
esac

if [ -f "$target" ]; then
  echo "Already exists: $target"
  exit 0
fi

sed -e "s/{{name}}/$name/g" -e "s/{{topic}}/$name/g" -e "s/{{date}}/$(date +%F)/g" "$template" > "$target"
echo "Created: $target"
