#!/bin/bash

# Script to check that all environment variables used in docker-compose.xxx.yml
# are properly defined in the .env.example file in the same directory.
# Excludes docker-compose.network.yml

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Initialize counters
total_compose_files=0
files_with_missing_vars=0
total_missing_vars=0

# Find all docker-compose files recursively but exclude network and specified folders
echo "Scanning for docker-compose files..."
compose_files=$(find . -name "docker-compose.*.yml" -not -name "docker-compose.network.yml" | sort)

if [ -z "$compose_files" ]; then
  echo -e "${RED}No docker-compose files found!${NC}"
  exit 1
fi

# Process each compose file
for compose_file in $compose_files; do
  dir_path=$(dirname "$compose_file")
  file_name=$(basename "$compose_file")
  env_example="${dir_path}/.env.example"
  missing_vars=0

  # Increment total count
  ((total_compose_files++))

  echo -e "\n${YELLOW}Processing: ${NC}${file_name} (${dir_path})"

  # Extract all environment variables (format: ${VAR_NAME})
  env_vars=$(grep -o '\${[A-Za-z0-9_]*}' "$compose_file" | sort | uniq | sed 's/\${//g' | sed 's/}//g')

  # Check if any environment variables were found
  if [ -z "$env_vars" ]; then
    echo -e "${GREEN}No environment variables used in this file. Skipping.${NC}"
    continue
  fi

  # Check if .env.example exists
  if [ ! -f "$env_example" ]; then
    echo -e "${RED}Error: .env.example file not found in ${dir_path}${NC}"
    ((files_with_missing_vars++))
    continue
  fi

  # Check each variable against .env.example
  for var in $env_vars; do
    # Skip checking if the variable is TZ or PUID or PGID as these are common defaults
    if [[ "$var" == "TZ" || "$var" == "PUID" || "$var" == "PGID" ]]; then
      continue
    fi

    if ! grep -q "^$var=" "$env_example" && ! grep -q "^# $var=" "$env_example"; then
      echo -e "${RED}Missing variable in .env.example: ${var}${NC}"
      ((missing_vars++))
      ((total_missing_vars++))
    fi
  done

  # Summary for this file
  if [ $missing_vars -eq 0 ]; then
    echo -e "${GREEN}All variables properly defined in .env.example${NC}"
  else
    echo -e "${RED}Found $missing_vars missing variables${NC}"
    ((files_with_missing_vars++))
  fi
done

# Final summary
echo -e "\n${YELLOW}=== Summary ===${NC}"
echo -e "Total compose files processed: $total_compose_files"
echo -e "Files with missing variables: $files_with_missing_vars"
echo -e "Total missing variables: $total_missing_vars"

if [ $total_missing_vars -eq 0 ]; then
  echo -e "\n${GREEN}All environment variables are properly defined!${NC}"
  exit 0
else
  echo -e "\n${RED}Some environment variables are missing in .env.example files!${NC}"
  exit 1
fi
  exit 0
else
  echo -e "\n${RED}Some environment variables are missing in .env.example files!${NC}"
  exit 1
fi
