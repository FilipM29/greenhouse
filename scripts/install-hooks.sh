#!/bin/sh
# Points git at the committed hooks and checks the required tool is present.
set -e
cd "$(git rev-parse --show-toplevel)"
command -v gitleaks >/dev/null 2>&1 || { echo "Install gitleaks first: brew install gitleaks" >&2; exit 1; }
chmod +x .githooks/pre-commit
git config core.hooksPath .githooks
echo "Hooks installed (core.hooksPath=.githooks)."
