#!/bin/bash

IPV4_ADDRESS=${1}

URL="ipinfo.io"
FULL_URL="${URL}/${IPV4_ADDRESS}"

echo "Checking IP: ${FULL_URL}"

curl "${FULL_URL}"
