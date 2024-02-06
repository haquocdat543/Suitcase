#!/bin/bash

sed -i "1s/^/bind 'set show-all-if-ambiguous on'\nbind 'TAB:menu-complete'\n /" ~/.bashrc
