#!/bin/bash

HOSTNAME=$1

openssl s_client -connect ${HOSTNAME}:443 -servername ${HOSTNAME} </dev/null 2>/dev/null | openssl x509 -noout -dates
curl -vI https://${HOSTNAME} 2>&1 | grep 'expire date'
