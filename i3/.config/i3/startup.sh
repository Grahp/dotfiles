#!/bin/bash

# Restore Tmux Sessions
~/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh &

wait

# Workspace 3
i3-msg workspace 3
wait


# Make Today's not if there isn't one
~/.config/nvim/today.sh
wait
kitty bash -c "tmux attach-session -t Notes" &

sleep 2


i3-msg workspace 4

sleep 0.1

~/Applications/plover-4.0.0rc2+6.g53c416f-x86_64_5c6089eb07b1d3f7f0016644e69179ce.AppImage &

# Very scientific
sleep 3
~/Applications/plover-4.0.0rc2+6.g53c416f-x86_64_5c6089eb07b1d3f7f0016644e69179ce.AppImage -s plover_send_command toggle &

sleep 0.1

i3-msg workspace 1
wait

kitty bash -c "tmux attach-session -t Dotfiles" &

