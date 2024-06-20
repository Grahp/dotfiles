#!/bin/bash

tmux popup -w 80% -h 80% -E "tmux new-session -c '#{pane_current_path}'\; set-option -g status off"
