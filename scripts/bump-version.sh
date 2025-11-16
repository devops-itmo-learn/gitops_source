#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${SCRIPT_DIR}/.."
VERSION_FILE="${REPO_ROOT}/VERSION"

usage() {
  cat <<'EOF'
Usage: scripts/bump-version.sh [major|minor|patch|none]

Increments the version stored in the VERSION file using semantic versioning rules.
  major - increment MAJOR, reset MINOR and PATCH to 0
  minor - increment MINOR, reset PATCH to 0
  patch - increment PATCH
  none  - leave the version untouched (useful for validation)
EOF
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

action="$1"
case "$action" in
  major|minor|patch|none)
    ;;
  -h|--help)
    usage
    exit 0
    ;;
  *)
    echo "Unknown action: $action" >&2
    usage
    exit 1
    ;;
esac

if [[ ! -f "$VERSION_FILE" ]]; then
  echo "VERSION file not found at $VERSION_FILE" >&2
  exit 1
fi

VERSION_RAW="$(tr -d '\r' < "$VERSION_FILE" | tr -d ' \t' | tr -d '\n')"
if [[ -z "$VERSION_RAW" ]]; then
  echo "VERSION file is empty" >&2
  exit 1
fi

if [[ ! "$VERSION_RAW" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  echo "VERSION must follow MAJOR.MINOR.PATCH format. Found: $VERSION_RAW" >&2
  exit 1
fi

MAJOR="${BASH_REMATCH[1]}"
MINOR="${BASH_REMATCH[2]}"
PATCH="${BASH_REMATCH[3]}"

case "$action" in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  none)
    ;;
 esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"

if [[ "$action" != "none" ]]; then
  printf '%s\n' "$NEW_VERSION" > "$VERSION_FILE"
fi

if [[ "$action" == "none" ]]; then
  echo "Version unchanged: $NEW_VERSION"
else
  echo "Version bumped: $VERSION_RAW -> $NEW_VERSION"
fi
