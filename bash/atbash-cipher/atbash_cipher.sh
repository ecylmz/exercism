#!/usr/bin/env bash

set -euo pipefail

declare -Ar lookup_table=(
    [a]=z [b]=y [c]=x [d]=w [e]=v [f]=u [g]=t [h]=s [i]=r
    [j]=q [k]=p [l]=o [m]=n [n]=m [o]=l [p]=k [q]=j [r]=i
    [s]=h [t]=g [u]=f [v]=e [w]=d [x]=c [y]=b [z]=a
)

main() {
    local type=$1 string result=
    
    string=${2,,}
    string=${string// /}
    string=${string//[^[:alnum:]]/}

    local i
    for (( i = 0; i < ${#string}; i++ )); do
        local letter=${string:i:1}
        result="$result${lookup_table[$letter]:-$letter}"
        if [[ $type == encode && $(( (i + 1) % 5)) -eq 0 ]]; then
            result="$result "
        fi
    done

    echo "${result%% }"
}

main "$@"
