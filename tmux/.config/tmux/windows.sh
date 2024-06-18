#!/bin/sh

active_window=$(tmux display-message -p "#I")
session_name=$(tmux display-message -p "#{session_name}")
#

selected_window=$(tmux list-windows | sed 's/://' | sed 's/ (.*//' | sed 's/*/ */' | sed 's/-/ -/' | fzf --border=none --header="$session_name")

window_index=$(echo "$selected_window" | awk '{print $1}')

tmux select-window -t "$window_index"

