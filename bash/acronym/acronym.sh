#!/usr/bin/env bash

set -euo pipefail

main() {
    echo "$1" | sed -E 's/.*/\U&/; s/-/ /g; s/_//g; s/\*//g; s/(.)[^ ]* */\1/g'
}

main "$@"
