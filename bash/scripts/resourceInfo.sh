#!/bin/bash

CPU_USAGE=$(grep 'cpu ' /proc/stat |awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')

RAM_TOTAL=$(free -g |grep Mem |awk '{print $2}')
RAM_USAGE=$(free |grep Mem |awk '{print $3/$2 * 100.0}')

DISK_SIZE=$(df --output=size -h / |sed 1d |sed 's/ //g')
DISK_USAGE=$(df --output=pcent / |sed 1d |sed 's/ //g')


echo "cpu_usage:${CPU_USAGE}"
echo "ram_total:${RAM_TOTAL}"
echo "ram_usage:${RAM_USAGE}"
echo "disk_size:${DISK_SIZE}"
echo "disk_usage:${DISK_USAGE}"
