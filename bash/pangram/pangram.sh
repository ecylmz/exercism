#!/usr/bin/env bash

set -euo pipefail

clean() {
    local a=${1//[^[:alnum:]]/}
    echo "${a,,}"
}

main() {
    local alphabet="abcdefghijklmnopqrstuvwxyz"
    local string

    string=$(clean "$1")

    for (( i=0; i<${#string}; i++ )); do
        if [[ $alphabet == *"${string:$i:1}"* ]]; then
            alphabet=${alphabet//${string:$i:1}/}
        fi
    done

    if [[ ${#alphabet} -eq 0 ]]; then
        echo true
    else
        echo false
    fi

}

main "$@"
