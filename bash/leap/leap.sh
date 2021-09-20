#!/usr/bin/env bash

set -euo pipefail

declare -r PROGNAME=${0##*/}

usage() {
	echo "Usage: $PROGNAME <year>" >&2
	exit 1
}

result() {
	echo "$*"
	exit 0
}

is_divisible() {
	local year=$1 divisible_by=$2

	(( year % divisible_by == 0 ))
}

check_year() {
	local year=$1

	is_divisible "$year" 4 || result false
	is_divisible "$year" 100 || result true
	is_divisible "$year" 400 || result false

	result true
}

main() {
	[[ $# -eq 1 && $1 =~ ^[0-9]+$ ]] || usage

	check_year "$1"
}

main "$@"
