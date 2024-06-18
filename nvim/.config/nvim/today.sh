#!/bin/bash

# Opens today's daily note, and creats it if it does not exist yet

today=$(date +'%-m-%-d-%y')
# today="1-2-3"

# Construct the filename and paths
filename="${today}.md"
template_path="$HOME/Documents/Notes/templates/daily.md"
note_path="$HOME/Documents/Notes/daily/$filename"

# Check if the note file exists, if not, copy the template
if [ ! -f "$note_path" ]; then
    cp "$template_path" "$note_path"
fi

# tmux new-session -s Notes 'echo "test"'
# tmux new-session -d -s Notes 'echo "Command executed in the Notes session"'




# tmux attach-session -t Notes

# Open the file with neovim
# nvim "$note_path"
