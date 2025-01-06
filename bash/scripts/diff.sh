#!/bin/bash

FIRST=${1}
SECOND=${2}

if [[ ${FIRST} == ${SECOND} ]]; then
        echo "Same"
else
        echo "Diff"
fi
