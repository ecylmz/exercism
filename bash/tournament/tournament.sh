#!/usr/bin/env bash

declare -ar characteristics=(
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma
)

split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}

main() {
    local input team=()

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;win
Blithering Badgers;Courageous Californians;win
Courageous Californians;Allegoric Alaskans;loss
INPUT
)

    # for i in $(split "$input" ";"); do
    #     echo "$i"
    # done
    # split "$input" ";"
    local t1 t2 result
    while read -r line; do
        t1=$(echo "$line" | cut --delimiter=";" -f 1)
        t2=$(echo "$line" | cut --delimiter=";" -f 2)
        result=$(echo "$line" | cut --delimiter=";" -f 3)
        echo T1: "$t1" T2: "$t2" Result: "$result"
    done <<< "$input"


    # echo "$input"
}

main "$@"
