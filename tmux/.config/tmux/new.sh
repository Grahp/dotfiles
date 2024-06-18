pressed=false

function ctrl_t_pressed() {
    pressed=true
}

# selected_item=$(fzf --bind='ctrl-t:execute(ctrl_t_pressed),ctrl-t:accept')
selected_item=$(fzf --bind='ctrl-t:execute(ctrl_t_pressed)')

if [ "$pressed" = true ]; then
    echo "Ctrl+T was pressed"
    # Reset the variable
    pressed=false
fi

echo "Selected item: $selected_item"
