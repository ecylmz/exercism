#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage: darts.sh <float> <float>"
    exit 1
}

score() {
    local x=$1 y=$2 distance

    distance=$(bc <<< "scale = 2; sqrt( $x^2 + $y^2 )")

    if (( $(bc -l <<< "$distance <= 1") )); then
        echo 10
    elif (( $(bc -l <<< "$distance <= 5") )); then
        echo 5
    elif (( $(bc -l <<< "$distance <= 10") )); then
        echo 1
    else
        echo 0
    fi
}

main() {
    local reg='^[+-]?[0-9]+\.?[0-9]*$'

    [[ $# -eq 2 ]] || usage
    [[ $1 =~ $reg && $2 =~ $reg ]] || usage

    score "$1" "$2"
}

main "$@"
