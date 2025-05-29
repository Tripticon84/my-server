#!/bin/bash

# Script to update docker-compose.yml with all docker-compose.xxx.yml files from services
# Excludes docker-compose.network.yml

set -e

# Path to the docker-compose.yml file
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Start of the new content
NEW_CONTENT="include:"

# Create a temporary list of files to include
TEMP_FILE=$(mktemp)

# Find all docker-compose.*.yml files in subdirectories
find . -maxdepth 2 -name "docker-compose.*.yml" | sort > "$TEMP_FILE"

# Loop through the list of files
while read file; do
    # Exclude docker-compose.network.yml
    if [[ "$file" != "./docker-compose.network.yml" ]]; then
        # Extract the relative path
        relative_path=${file:2}  # Remove the './' at the beginning

        # Add to the content
        NEW_CONTENT="$NEW_CONTENT\n  - \"$relative_path\""
    fi
done < "$TEMP_FILE"

# Remove the temporary file
rm "$TEMP_FILE"

# Write the new content to the file
echo -e "$NEW_CONTENT" > "$DOCKER_COMPOSE_FILE"
echo "The file $DOCKER_COMPOSE_FILE has been successfully updated."
