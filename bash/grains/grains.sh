#!/usr/bin/env bash

set -euo pipefail

die() {
    echo "Error: $*" >&2
    exit 1
}

square() {
    [[ $1 -gt 0 && $1 -lt 65 ]] || die "invalid input"

    printf "%u\n" $(( 2 ** ($1 - 1) ))
}

total() {
    printf "%u\n" $(( (2 ** 64 ) -1 ))
}

main() {
    if [[ $1 == total ]]; then
        total "$1"
    else
        square "$1"
    fi
}

main "$@"
