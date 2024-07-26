#!/bin/bash

OPTION="--dry-run --debug"
VALUE_PATH="values.yaml" 
NAME="rabbitmq" 
OUTPUT_FILE_BASENAME=$1
CHART_PATH="." 

helm install ${NAME} ${CHART_PATH} --values ${VALUE_PATH} ${OPTION} > ${OUTPUT_FILE_BASENAME}.yaml
# helm install ${NAME} ${CHART_PATH} --values ${VALUE_PATH} ${OPTION} > ${OUTPUT_FILE_BASENAME}.yaml
# helm upgrade ${NAME} ${CHART_PATH} --values ${VALUE_PATH} ${OPTION} > ${OUTPUT_FILE_BASENAME}.yaml
