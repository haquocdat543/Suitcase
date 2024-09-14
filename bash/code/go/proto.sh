#!/bin/bash

protoc --go_out=. --go-grpc_out=. order.proto
