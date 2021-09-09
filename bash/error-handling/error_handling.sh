#!/usr/bin/env bash

set -euo pipefail

die() {
    echo "$*" >&2
    exit 1
}

main() {
    [[ $# -eq 1 ]] || die "Usage: ${0##*/} <person>"

    echo "Hello, $1"
}

main "$@"
