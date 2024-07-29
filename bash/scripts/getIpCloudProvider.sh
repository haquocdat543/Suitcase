#!/bin/bash

# Function to check if the input is a valid IP address
is_ip() {
  local ip=$1
  local stat=1

  if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    OIFS=$IFS
    IFS='.'
    ip=($ip)
    IFS=$OIFS
    [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
    stat=$?
  fi
  return $stat
}

INPUT=$1

URL="ipinfo.io"

# Check if the input is a valid IP address
if is_ip "${INPUT}"; then
  echo "${INPUT} is a valid IP address."
  curl "${URL}/${INPUT}"
else
  echo "${INPUT} is not a valid IP address. Converting to IP address..."
  IP_ADDRESS=$(dig +short "${INPUT}")
  
  if [ -z "${IP_ADDRESS}" ]; then
    echo "Failed to resolve domain name to IP address."
    exit 1
  else
    echo "The IP address for ${INPUT} is: ${IP_ADDRESS}"
    for IP in ${IP_ADDRESS}; do
      curl "${URL}/${IP}"
    done
  fi
fi
