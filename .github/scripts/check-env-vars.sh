#!/bin/bash

# Script to check that all environment variables used in docker-compose.xxx.yml
# are properly defined in .env.default
# Excludes docker-compose.network.yml

set -e

ENV_DEFAULT_FILE=".env.default"
EXIT_CODE=0

# Function to extract environment variables from a file
extract_env_vars() {
    local file=$1
    # Search for strings starting with ${ and ending with }
    grep -o '\${[^}]*}' "$file" | sed 's/\${//g' | sed 's/}//g' | sed 's/:-.*//g' | sort | uniq

    # Also search for variables defined as $VAR (without braces)
    grep -o '\$[A-Za-z0-9_]*' "$file" | sed 's/\$//g' | grep -v '^{' | sort | uniq
}

# Check if .env.default exists
if [ ! -f "$ENV_DEFAULT_FILE" ]; then
    echo "Error: File $ENV_DEFAULT_FILE does not exist."
    exit 1
fi

# Create a temporary file to store all found variables
TEMP_FILE=$(mktemp)
ALL_FILES=$(mktemp)

# Find all docker-compose.*.yml files in subdirectories
find . -name "docker-compose.*.yml" | sort > "$ALL_FILES"

# Loop through the list of files
while read file; do
    # Exclude docker-compose.network.yml
    if [[ "$file" != "./docker-compose.network.yml" ]]; then
        echo "Checking variables in $file..."

        # Extract environment variables from the file
        extract_env_vars "$file" >> "$TEMP_FILE"
    fi
done < "$ALL_FILES"

# Remove the temporary file listing the files
rm "$ALL_FILES"

# Remove duplicates
sort "$TEMP_FILE" | uniq > "${TEMP_FILE}.uniq"
mv "${TEMP_FILE}.uniq" "$TEMP_FILE"

# Check if each variable is defined in .env.default
MISSING_VARS=()

while read var; do
    # Ignore empty lines or common system variables
    if [[ -z "$var" || "$var" == "PATH" || "$var" == "HOME" || "$var" == "USER" ]]; then
        continue
    fi

    if ! grep -q "^$var=" "$ENV_DEFAULT_FILE" && ! grep -q "^$var:" "$ENV_DEFAULT_FILE"; then
        echo "❌ Missing variable in $ENV_DEFAULT_FILE: $var"
        MISSING_VARS+=("$var")
        EXIT_CODE=1
    else
        echo "✅ Variable found in $ENV_DEFAULT_FILE: $var"
    fi
done < "$TEMP_FILE"

# Remove the temporary file
rm "$TEMP_FILE"

if [ $EXIT_CODE -eq 0 ]; then
    echo "All environment variables are properly defined in $ENV_DEFAULT_FILE."
else
    echo "ERROR: The following variables are missing in $ENV_DEFAULT_FILE:"
    for var in "${MISSING_VARS[@]}"; do
        echo "  - $var"
    done
fi

exit $EXIT_CODE
