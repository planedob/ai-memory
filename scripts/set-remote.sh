#!/bin/zsh

set -euo pipefail

repo_url="${1:-}"

if [ -z "$repo_url" ]; then
  echo "Usage: scripts/set-remote.sh <git@github.com:user/repo.git>"
  exit 1
fi

git remote remove origin >/dev/null 2>&1 || true
git remote add origin "$repo_url"
git remote -v
