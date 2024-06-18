#!/bin/bash

tmux popup -w 80% -h 80% -E "tmux new-session -c '#{pane_current_path}'\; set-option -g status off"

# SESSION="popup-session"
# WINDOW_NAME="popup"
#
# # Check if the popup session exists
# tmux has-session -t "$SESSION" 2>/dev/null
#
# if [ $? != 0 ]; then
#     # Session does not exist, create it and show popup window
#     tmux new-session -d -s "$SESSION" -n "$WINDOW_NAME" "tmux new-window -c '#{pane_current_path}' -n $WINDOW_NAME"
#     tmux popup -t "$SESSION:$WINDOW_NAME" -w 80% -h 80%
# else
#     # Session exists, check if the popup window is visible
#     tmux list-windows -t "$SESSION" -F "#{window_name},#{window_active}" | grep "^$WINDOW_NAME,true$"
#
#     if [ $? = 0 ]; then
#         # Window is active (visible), close it
#         tmux kill-window -t "$SESSION:$WINDOW_NAME"
#     else
#         # Window is not active (hidden), show it
#         tmux popup -t "$SESSION:$WINDOW_NAME" -w 80% -h 80%
#     fi
# fi
