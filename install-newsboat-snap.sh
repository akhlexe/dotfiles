#!/usr/bin/env bash

set -euo pipefail

target="$HOME/snap/newsboat/current"

if [ ! -d "$target" ]; then
    printf 'Snap target not found: %s\n' "$target" >&2
    printf 'Install the newsboat snap first, then re-run this script.\n' >&2
    exit 1
fi

stow -t "$target" newsboat

printf 'Installed newsboat stow package to %s\n' "$target"
