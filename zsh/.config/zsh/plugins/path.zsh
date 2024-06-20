# Add to path
function add() {
    if [ -d "$1" ]; then
        PATH="$1:$PATH"
    fi
}

add "$HOME/.local/share/bob/nvim-bin"
add "$HOME/.cargo/bin"
add "$HOME/.local/bin"
add "/usr/local/go/bin"
