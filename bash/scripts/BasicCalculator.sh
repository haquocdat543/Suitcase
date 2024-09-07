#!/bin/bash

# Get all argument as a string
FORMULA=$@

echo "${FORMULA}" | bc
