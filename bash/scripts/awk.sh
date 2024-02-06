#!/bin/bash

read -p "Enter pattern [ubuntu]: " pattern
pattern=${pattern:-ubuntu}
read -p "Enter field [\$1]: " field
field=${field:-\$1}
read -p "Enter file path [.bashrc]: " path
path=${path:-.bashrc}
awk "/$pattern/ {print $field}" $path
