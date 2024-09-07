#!/bin/bash

# Get all argument as a string
FORMULA="$@"

if [[ ${FORMULA} == "--help" || ${FORMULA} == "-h" || ${FORMULA} == "help" ]]; then
  echo "Usage: baca \"2 + 3 * 4 / 7\""
else
  echo "${FORMULA}" | bc
fi
