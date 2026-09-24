#!/usr/bin/env bash
# One GitHub sign-in per home. The token lands in the desktop keyring, not in a
# file this repository could ever pick up.
set -euo pipefail

if gh auth status --hostname github.com >/dev/null 2>&1; then
	exit 0
fi
if [[ ! -t 0 ]]; then
	echo "Not a terminal: skipping GitHub sign-in. Run: gh auth login --web" >&2
	exit 0
fi
gh auth login --hostname github.com --git-protocol https --web
