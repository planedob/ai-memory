#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
src_dir="$repo_dir/codex/skills"
codex_home="${CODEX_HOME:-$HOME/.codex}"
dest_dir="$codex_home/skills"

if [ ! -d "$src_dir" ]; then
  echo "Missing source skills directory: $src_dir" >&2
  exit 1
fi

mkdir -p "$dest_dir"

for skill_dir in "$src_dir"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  rsync -a --delete "$skill_dir/" "$dest_dir/$skill_name/"
  echo "Installed skill: $skill_name -> $dest_dir/$skill_name"
done

echo "Restart Codex to pick up updated skills."
echo "Optional plugin assets are in: $repo_dir/codex/plugins"
