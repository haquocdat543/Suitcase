#!/bin/bash

black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
gray2='\033[1;30m'
red2='\033[1;31m'
green2='\033[1;32m'
yellow='\033[1;33m'
blue2='\033[1;34m'
purple2='\033[1;35m'
cyan2='\033[1;36m'
white='\033[1;37m'
nc='\033[0m' # No Color
read -p "$(echo -e "Enter ${yellow}name${nc} [${green2}nginx${nc}]: ")" name
name=${name:-nginx}
read -p "$(echo -e "Enter ${yellow}url${nc} [${green2}https://github.com/$GITHUB_USER/$GITHUB_REPO${nc}]: ")" url
url=${url:-https://github.com/$GITHUB_USER/$GITHUB_REPO}
read -p "$(echo -e "Enter ${yellow}branch${nc} [${green2}main${nc}]: ")" branch
branch=${branch:-main}
read -p "$(echo -e "Enter ${yellow}interval${nc} [${green2}30s${nc}]: ")" interval
interval=${interval:-30s}
read -p "$(echo -e "Enter ${yellow}location${green} export to${nc} [${green2}./deploy/flux_source.yaml${nc}]: ")" location
location=${location:-./deploy/flux_source.yaml}
flux create source git $name --url=$url --branch=$branch --interval=$interval --export > $location

