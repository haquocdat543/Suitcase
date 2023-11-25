#!/bin/bash

read -p "Enter your keyword [cabal]: " keyword
keyword=${keyword:-cabal}
ll | grep $keyword
