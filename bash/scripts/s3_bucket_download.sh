#!/bin/bash

PATH=$1

aws s3 sync s3://${PATH} .
