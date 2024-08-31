#!/bin/bash

# Define color codes
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

# Get a list of unique authors
authors=$(git log --format='%aN' | sort -u)

echo -e "${CYAN}Author${RESET} | ${GREEN}First Commit${RESET} | ${YELLOW}First Commit Date${RESET} | ${GREEN}Latest Commit${RESET} | ${YELLOW}Latest Commit Date${RESET}"
echo -e "${CYAN}------${RESET} | ${GREEN}------------${RESET} | ${YELLOW}----------------${RESET} | ${GREEN}-------------${RESET} | ${YELLOW}-----------------${RESET}"

# Loop through each author
while IFS= read -r author; do
  # Get the first commit by the author
  first_commit=$(git log --author="$author" --reverse --format="%H" | head -n 1)
  first_commit_date=$(git log --author="$author" --reverse --format="%ad" --date=iso-strict | head -n 1)

  # Get the latest commit by the author
  latest_commit=$(git log --author="$author" --format="%H" | head -n 1)
  latest_commit_date=$(git log --author="$author" --format="%ad" --date=iso-strict | head -n 1)

  # Output the information with colors
  echo -e "${CYAN}$author${RESET} | ${GREEN}$first_commit${RESET} | ${YELLOW}$first_commit_date${RESET} | ${GREEN}$latest_commit${RESET} | ${YELLOW}$latest_commit_date${RESET}"
done <<< "$authors"

