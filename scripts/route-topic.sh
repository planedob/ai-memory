#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
routes_file="$repo_dir/system/routes.csv"
kind="${1:-}"
key="${2:-}"

if [ -z "$kind" ] || [ -z "$key" ]; then
  echo "Usage: scripts/route-topic.sh <project|memory> <key>"
  exit 1
fi

target="$(awk -F',' -v kind="$kind" -v key="$key" '
  $1 == kind && $2 == key { print $3; exit }
' "$routes_file")"

if [ -n "$target" ]; then
  echo "$target"
  exit 0
fi

case "$kind" in
  project)
    echo "projects/$key.md"
    ;;
  memory)
    echo "memories/$key.md"
    ;;
  *)
    echo "Unknown kind: $kind"
    exit 1
    ;;
esac
