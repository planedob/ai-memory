#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
today="$(date +%F)"
target="$repo_dir/daily/$today.md"
template="$repo_dir/templates/daily-template.md"

if [ -f "$target" ]; then
  echo "Already exists: $target"
  exit 0
fi

sed "s/{{date}}/$today/g" "$template" > "$target"
echo "Created: $target"
