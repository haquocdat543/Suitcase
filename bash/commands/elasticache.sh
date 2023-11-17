#!/bin/bash

read -p "Enter cache-cluster-id [my-cluster]:" cluster-id
cluster-id=${cluster-id:-my-cluster}
read -p "Enter engine [redis]:" engine
engine=${engine:-redis}
read -p "Enter cache-node-type [cache.m5.large]:" node-type
node-type=${node-type:-cache.m5.large}
read -p "Enter num-cache-nodes [1]:" num-node
num-node=${num-node:-1}
aws elasticache create-cache-cluster $cluster-id --engine $engine --cache-node-type $node-type --num-cache-nodes $num-node
