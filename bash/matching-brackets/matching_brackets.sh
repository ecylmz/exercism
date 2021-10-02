#!/usr/bin/env bash

set -euo pipefail

declare -Ar brackets_table=(
    ["]"]="["
    [")"]="("
    ["}"]="{"
)

usage() {
    echo "Usage: matching_brackets.sh <string>" >&2
    exit 1
}

is_matching() {
    local brackets=${1//[^[\[\]\(\)\{\}]/} stack=

    for (( i = 0; i < ${#brackets}; i++ )); do
        local char=${brackets:i:1}
        case $char in
        "[" | "(" | "{")
            stack+=$char
            ;;
        *)
            [[ -n $stack && ${stack: -1} == "${brackets_table[$char]}" ]] || { echo false; return 0; }

            stack=${stack%?}
            ;;
        esac
    done

    if [[ -z $stack ]]; then
        echo true
    else
        echo false
    fi
}

main() {
    [[ $# -eq 1 ]] || usage

    is_matching "$1"
}

main "$@"
