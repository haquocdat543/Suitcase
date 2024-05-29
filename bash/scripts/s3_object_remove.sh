#!/bin/bash

PATH=$1

aws s3 rm s3://${PATH}
