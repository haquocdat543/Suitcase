#!/bin/bash

read -p "Enter cache-id [my-cluster]: " id
id=${id:-my-cluster}
read -p "Enter engine [redis]: " engine
engine=${engine:-redis}
read -p "Enter cache-type [cache.m5.large]: " type
type=${type:-cache.m5.large}
read -p "Enter num-cache-nodes [1]: " num
num=${num:-1}
aws elasticache create-cache-cluster --cache-cluster-id $id --engine $engine --cache-node-type $type --num-cache-nodes $num
