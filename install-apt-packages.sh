#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
package_file="$repo_dir/packages/apt.txt"

if ! command -v apt-get >/dev/null 2>&1; then
    printf 'apt-get is required to install these packages.\n' >&2
    exit 1
fi

mapfile -t packages < <(
    sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$package_file"
)

if ((${#packages[@]} == 0)); then
    printf 'No packages found in %s.\n' "$package_file" >&2
    exit 1
fi

sudo apt-get update
sudo apt-get install -y "${packages[@]}"

printf 'Installed packages listed in %s\n' "$package_file"
