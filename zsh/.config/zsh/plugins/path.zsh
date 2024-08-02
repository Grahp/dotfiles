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
add "/usr/lib/jvm/java-21-openjdk-amd64/bin/java"
add "$HOME/.config/emacs/bin"
