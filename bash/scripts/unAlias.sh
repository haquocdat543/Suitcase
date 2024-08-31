#!/bin/bash

ALIAS=${1}

unalias_and_print() {
    alias_name="$1"
    full_command=$(alias "$alias_name" | sed "s/alias $alias_name='\(.*\)'/\1/")
    echo "$full_command"
}

unalias_and_print ${ALIAS}
