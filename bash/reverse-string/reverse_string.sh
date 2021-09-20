#!/usr/bin/env bash

set -euo pipefail

# We can use the `rev` command but let's do it the harder way.

main() {
	local input=$1 output=

	for (( i = (${#input} - 1); i >= 0; i-- )); do
  		output=${output}${input:i:1}
  	done

  	echo "$output"
}

main "$@"

