#!/usr/bin/env bash

declare -ar characteristics=(
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma
)

modifier() {
    local -i n=$1

    (( n < 10 )) && (( n-- ))
    echo $(( (n - 10) / 2 ))
}

generate() {
    local a c

    for c in "${characteristics[@]}"; do
        a=$(ability)
        echo "$c $a"
        if [[ $c == constitution ]]; then
            echo "hitpoints $(( 10 + $(modifier "$a") ))"
        fi
    done
}

ability() {
    local roll sum min=6

    for _ in {1..4}; do
        roll=$(roll_dice)
        (( roll < min )) && min=$roll
        (( sum += roll ))
    done

    echo $(( sum - min ))
}


roll_dice() {
    echo $(( RANDOM % 6 + 1 ))
}

main() {
    case $1 in
    modifier|generate)
        "$@"
        ;;
    *)
        echo "unknown subcommand" >&2
        exit 1
        ;;
    esac
}

main "$@"
