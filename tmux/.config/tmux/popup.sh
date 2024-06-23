#!/bin/bash

current_session=$(tmux display-message -p '#S')
popup_session="${current_session}-popup"
session_exists=$(tmux ls | grep -c "$popup_session")

if [[ $current_session == *"-popup" ]]; then
    tmux detach-client
else
    if [ "$session_exists" -eq 0 ]; then
        tmux popup -w 80% -h 80% -E "tmux new-session -s $popup_session -c '#{pane_current_path}'\; set-option -g status off"
    else
        tmux popup -w 80% -h 80% -E "tmux attach-session -t $popup_session"
    fi
fi
