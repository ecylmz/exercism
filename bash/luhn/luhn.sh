#!/usr/bin/env bash

set -euo pipefail

result() {
    echo "$*" >&2
    exit 0
}

main() {
    local num=$1

    num="${num// /}"
    [[ $num =~ ^[0-9\s]+$ ]] || result false
    [[ ${#num} -gt 1 ]] || result false

    local counter=${#num} total=0 i
    for (( i = 0; i < ${#num}; i++ )); do
        local x=${num:i:1}
        if (( counter % 2 == 0 )); then
            local doubled
            if (( x * 2 >= 10 )); then
                doubled=$((x * 2 - 9))
            else
                doubled=$((x * 2))
            fi
            total=$((total + doubled))
        else
            total=$((total + x))
        fi
        (( counter-- ))
    done

    if (( total % 10 == 0 )); then
        result true
    else
        result false
    fi
}

main "$@"
