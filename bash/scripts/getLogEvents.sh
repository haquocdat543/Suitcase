#!/bin/bash

LOG_GROUP_NAME=$1
LOG_STREAM_NAME=$2

aws logs get-log-events --log-group-name $LOG_GROUP_NAME --log-stream-name $LOG_STREAM_NAME
