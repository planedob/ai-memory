#!/bin/zsh

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"

echo "== Duplicate topic name scan =="
find "$repo_dir/memories" "$repo_dir/projects" -maxdepth 1 -type f -name "*.md" \
  | sed "s#^$repo_dir/##" \
  | awk -F'/' '
    {
      file=$NF
      sub(/\.md$/, "", file)
      count[file]++
      paths[file]=(paths[file] ? paths[file] ORS : "") $0
    }
    END {
      found=0
      for (name in count) {
        if (count[name] > 1) {
          found=1
          print "DUPLICATE_TOPIC: " name
          print paths[name]
          print ""
        }
      }
      if (!found) {
        print "No duplicate topic basenames found."
      }
    }
  '

echo ""
echo "== Route coverage =="
while IFS=, read -r kind key target; do
  [ "$kind" = "kind" ] && continue
  if [ -f "$repo_dir/$target" ]; then
    echo "OK: $kind,$key -> $target"
  else
    echo "MISSING_TARGET: $kind,$key -> $target"
  fi
done < "$repo_dir/system/routes.csv"
