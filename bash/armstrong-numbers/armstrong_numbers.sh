#!/usr/bin/env bash

set -euo pipefail

main() {
    local power=${#1}
    local sum=0

    for (( i = 0; i < power; i++ )); do
        sum=$(( sum + (${1:$i:1} ** power) ))
    done

    if [[ $1 -eq $sum ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
