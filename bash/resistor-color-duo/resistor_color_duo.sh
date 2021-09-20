#!/usr/bin/env bash

set -euo pipefail

declare -Ar lookup_table=(
    [black]=0 [brown]=1 [red]=2    [orange]=3 [yellow]=4
    [green]=5 [blue]=6  [violet]=7 [grey]=8   [white]=9
)

die() {
    echo "$*" >&2
    exit 1
}

main() {
    local first=${1:-} second=${2:-}

    [[ -v lookup_table[$first] && -v lookup_table[$second] ]] || die "invalid color"

    echo "${lookup_table[$first]}${lookup_table[$second]}"
}

main "$@"
