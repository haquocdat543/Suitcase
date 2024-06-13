#!/bin/bash

SERVICE=$1
QUOTA=$2
L_CODE=$2

aws service-quotas request-service-quota-increase --service-code $SERVICE --quota-code $L_CODE --desired-value $QUOTA
