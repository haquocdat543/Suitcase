#!/bin/bash

LOCAL_PATH=$1
S3_PATH=$1

aws s3 cp $LOCAL_PATH s3://${S3_PATH}
