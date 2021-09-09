#!/usr/bin/env bash

set -eo pipefail

is_question() {
    [[ ${1: -1} == "?" ]]
}

is_yelling() {
    [[ $1 =~ [A-Za-z] && $1 == "${1^^}" ]]
}

main() {
    local sentence=$1
    sentence=${sentence//[[:blank:]]/}
    sentence=${sentence//[[:space:]]/}

    if [[ -z $sentence ]]; then
        echo "Fine. Be that way!"
    elif is_question "$sentence"; then
        if is_yelling "$sentence"; then
            echo "Calm down, I know what I'm doing!"
        else
            echo "Sure."
        fi
    elif is_yelling "$sentence"; then
        echo "Whoa, chill out!"
    else
        echo "Whatever."
    fi
}

main "$@"
