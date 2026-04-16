#!/usr/bin/env bash
# bump.sh — increment patch version across burnwindow.html and README.md
set -e

CURRENT=$(grep -o 'v[0-9]*\.[0-9]*\.[0-9]*' burnwindow.html | head -1)
if [ -z "$CURRENT" ]; then
  echo "ERROR: could not find version in burnwindow.html" >&2
  exit 1
fi

MAJOR=$(echo "$CURRENT" | cut -d. -f1 | tr -d 'v')
MINOR=$(echo "$CURRENT" | cut -d. -f2)
PATCH=$(echo "$CURRENT" | cut -d. -f3)
NEW="v${MAJOR}.${MINOR}.$((PATCH + 1))"

sed -i '' "s/${CURRENT}/${NEW}/g" burnwindow.html
sed -i '' "s/${CURRENT}/${NEW}/g" README.md

git add burnwindow.html README.md
git commit -m "Bump version to ${NEW}

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"

echo "✓ ${CURRENT} → ${NEW}"
