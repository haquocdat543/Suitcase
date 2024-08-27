#!/bin/bash

# Get the total disk size in GB
TOTAL_SIZE=$(df --block-size=1G --total | awk '/^total/ {print $2}')

echo "Total Disk Size: ${TOTAL_SIZE} GB"
