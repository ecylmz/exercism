#!/usr/bin/env bash

set -euo pipefail

declare -ar secrets=( "wink" "double blink" "close your eyes" "jump" )

declare -ar D2B=( {0..1}{0..1}{0..1}{0..1}{0..1} )

encrypt() {
    local i j symbols

    for (( i = 4, j = 0; i >= 1; i--, j++ )); do
        if [[ ${binary:i:1} == 1 ]]; then
            symbols+=( "${secrets[$j]}" )
        fi
    done

    if [[ ${binary:0:1} == 1 ]]; then
        local -a rev
        for i in "${symbols[@]}"; do
            rev=( "$i" "${rev[@]}" )
        done
        output "${rev[@]}"
    else
        output "${symbols[@]}"
    fi
}

output() {
    local IFS=,
    echo "$*"
}

main() {
    local binary=${D2B[$1]:-}

    encrypt "$binary"
}

main "$@"
