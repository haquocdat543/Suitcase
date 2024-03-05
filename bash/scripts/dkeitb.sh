#!/bin/bash

export HASH="$1"
docker exec -it $HASH /bin/bash
