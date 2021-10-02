#!/usr/bin/env bash

set -euo pipefail

main() {
    local n=$1 prime=() p=2 result=""

    for (( i = 0; i < n + 1; i++ )); do
        prime[$i]=true
    done

    while (( p * p <= n )); do
        if [[ ${prime[$p]} == true ]]; then
            for (( j = p * p; j <= n + 1; j += p )); do
                prime[$j]=false
            done
        fi
        (( p++ ))
    done

    for (( i = 2; i < n + 1; i++ )); do
        [[ ${prime[$i]} == true ]] && result+="$i "
    done

    echo "${result% }"
}

main "$@"
