#!/usr/bin/env bash

set -euo pipefail

die() {
    echo "$*" >&2
    exit 1
}

hamming() {
    local diff=0
    for (( i=0; i<${#1}; i++ )); do
        [[ ${1:$i:1} == "${2:$i:1}" ]] || (( ++diff ))
    done

    echo "$diff"
}

main() {
    [[ $#    -eq 2     ]] || die "Usage: hamming.sh <string1> <string2>"
    [[ ${#1} -eq ${#2} ]] || die "strands must be of equal length"

    hamming "$1" "$2"
}

main "$@"
