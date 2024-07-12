#!/bin/bash

tomorrow=$(date -d 'tomorrow' +'%-m-%-d-%y')

# Construct the filename and paths
filename="${today}.md"
template_path="$HOME/Documents/Notes/templates/daily.md"
note_path="$HOME/Documents/Notes/daily/$filename"

# Check if the note file exists, if not, copy the template
if [ ! -f "$note_path" ]; then
    cp "$template_path" "$note_path"
fi
