#!/bin/bash

find . | fzf

export FZF_DEFAULT_COMMAND='find .'
fzf
