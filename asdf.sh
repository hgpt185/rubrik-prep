#!/bin/bash

# Competitive Programming Template Generator
# Usage: asdf [filename]

if [ -z "$1" ]; then
    echo "Usage: asdf <filename>"
    echo "Example: asdf solution.cpp"
    exit 1
fi

FILENAME="$1"

# If filename doesn't end with .cpp, add it
if [[ ! "$FILENAME" =~ \.cpp$ ]]; then
    FILENAME="${FILENAME}.cpp"
fi

# Check if file already exists
if [ -f "$FILENAME" ]; then
    echo "File $FILENAME already exists. Overwrite? (y/n)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
fi

# Copy template to new file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="$SCRIPT_DIR/template.cpp"

if [ ! -f "$TEMPLATE" ]; then
    echo "Error: Template file not found at $TEMPLATE"
    exit 1
fi

cp "$TEMPLATE" "$FILENAME"
echo "Created $FILENAME from template"

# Open in editor if code command is available
if command -v code &> /dev/null; then
    code "$FILENAME"
fi

