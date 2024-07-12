# FZF Keybindings & Settings

files_home() {

    selected=$(fdfind . '/home/grahp' -t d --hidden --exclude .git -d 5 | sed 's/\/home\/grahp\///' | fzf )

    if [[ -z "$selected" ]]; then
        return
    else

        if [ -d ~/"$selected" ]; then
            cd ~/"$selected"
        fi

        kill -INT $$
    fi

}

files_root() {

    # selected=$(fdfind . '/' --hidden --exclude .git | sed 's|^/||' | fzf )
    selected=$(fdfind . '/' -t d --hidden --exclude .git -d 5 | sed 's/\///' | fzf )

    if [[ -z "$selected" ]]; then
        return
    else

        if [ -d /"$selected" ]; then
            cd /"$selected"
        else
            v /"$selected"
        fi

        kill -INT $$
    fi

}

files() {

    # selected=$(fdfind . --hidden --exclude .git --exec sh -c 'if [ -d "$1" ]; then echo "$1/"; else echo "$1"; fi' sh {} | sed 's/\.///' | fzf )
    selected=$(fdfind . --hidden --exclude .git --exec sh -c 'if [ -d "$1" ]; then echo "$1/"; else echo "$1"; fi' sh {} | sed 's/\.\///' | fzf)
    # fd --exec sh -c 'if [ -d "$1" ]; then echo "$1/"; else echo "$1"; fi' sh {}

    if [[ -z "$selected" ]]; then
        return
    else
        if [ -d "$selected" ]; then
            cd "$selected"
        else
            v "$selected"
        fi

        kill -INT $$
    fi

}


current() {

    selected=$(fdfind . '/home/grahp' --hidden --exclude .git | sed 's|^./||' | fzf )

    if [[ -z "$selected" ]]; then
        return
    else
        v "$selected"
        # Return
        kill -INT $$
    fi

}

zle -N files_home-widget files_home
bindkey '^e' files_home-widget

zle -N files-widget files
bindkey '^o' files-widget

zle -N files_root-widget files_root
bindkey '^a' files_root-widget

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cdd6f4,fg+:#d0d0d0,bg:-1,bg+:#313244
  --color=hl:#f38ba8,hl+:#5fd7ff,info:#cba6f7,marker:#f5e0dc
  --color=prompt:#cba6f7,spinner:#f5e0dc,pointer:#f5e0dc,header:#f38ba8
  --color=gutter:-1,border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" "
  --marker="" --pointer="󱦰" --separator="─" --scrollbar="│"'
