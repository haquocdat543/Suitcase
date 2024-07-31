#!/bin/bash

ENCRYPTED_TEXT=${1}

DECRYPTED_TEXT=$(echo "${ENCRYPTED_TEXT}" | base64 --decode)

echo "${DECRYPTED_TEXT}"
