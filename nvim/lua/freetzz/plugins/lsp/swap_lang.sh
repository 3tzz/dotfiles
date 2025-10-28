#!/bin/bash

# Path to the file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="${SCRIPT_DIR}/lspconfig.lua"

echo "${SCRIPT_DIR}"
echo "${FILE}"

# Loop through all lines that match the pattern
grep -n 'language = ' "$FILE" | grep 'Change value for script swap_lang.sh' | while IFS= read -r LINE; do
  # Use regex to extract the line number and values
  if [[ $LINE =~ ^([0-9]+):.*language\ =\ \"([^\"]+)\".*\:\ \[([^\]]+)\] ]]; then
    LINE_NUMBER="${BASH_REMATCH[1]}" # Line number
    VALUE1="${BASH_REMATCH[2]}"      # Value inside ""
    VALUE2="${BASH_REMATCH[3]}"      # Value inside []

    # Modify the line (swap the values)
    sed -i "${LINE_NUMBER}s/${VALUE1}/${VALUE2}/" "$FILE"
    sed -i "${LINE_NUMBER}s/\[${VALUE2}\]/[${VALUE1}]/" "$FILE"

    echo "Swapped values in line $LINE_NUMBER"
  fi
done

echo "Language swapped and updated in $FILE"
