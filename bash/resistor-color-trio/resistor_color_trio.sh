#!/usr/bin/env bash

set -euo pipefail

declare -Ar lookup_table=(
    [black]=0 [brown]=1 [red]=2    [orange]=3 [yellow]=4
    [green]=5 [blue]=6  [violet]=7 [grey]=8   [white]=9
)

declare -ar units=( ohms kiloohms megaohms gigaohms )

die() {
    echo "$*" >&2
    exit 1
}

resistor_value() {
    local value="${1}${2}" zero_count=$3 idx=0

    for (( i = 0; i < zero_count; i++ )); do
        value+=0
    done

    while [[ $value == *000 ]]; do
        value=${value%000}
        (( ++idx ))
    done

    value=${value#0}

    echo "$value" "${units[$idx]}"
}

main() {
    local first=${1:-} second=${2:-} third=${3:-}

    [[ -v lookup_table[$first] && -v lookup_table[$second]  && -v lookup_table[$third] ]] || die "invalid color"

    resistor_value "${lookup_table[$first]}" "${lookup_table[$second]}" "${lookup_table[$third]}"
}

main "$@"
