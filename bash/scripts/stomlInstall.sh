#!/bin/bash

export STOML="v0.7.1"
wget https://github.com/freshautomations/stoml/releases/download/${STOML}/stoml_windows_amd64
mv stoml_windows_amd64 /usr/local/bin/stoml
