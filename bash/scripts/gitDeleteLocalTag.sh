#!/bin/bash

PATTERN=$1

for tag in $(git tag -l "${PATTERN}"); do
  git tag -d "$tag"
done

for tag in $(git tag -l "${PATTERN}"); do
  git push origin --delete "$tag"
done
