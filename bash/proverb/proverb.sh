#!/usr/bin/env bash

set -euo pipefail

main() {
    [[ $# -ge 1 ]] || exit 0

    for (( i = 1, j = 2; i < $#; i++, j++ )); do
        echo "For want of a ${!i} the ${!j} was lost."
    done

    echo "And all for the want of a $1."
}

main "$@"
