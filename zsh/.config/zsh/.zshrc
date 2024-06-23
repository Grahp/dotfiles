# Plugins
source $ZDOTDIR/plugins/alias.zsh
source $ZDOTDIR/plugins/vim.zsh
source $ZDOTDIR/plugins/fzf.zsh
source $ZDOTDIR/plugins/path.zsh
source $ZDOTDIR/plugins/syntax.zsh
source $ZDOTDIR/plugins/suggestions.zsh
source $ZDOTDIR/plugins/completion.zsh
source $ZDOTDIR/plugins/env.zsh

# Set Terminal Prompt
PS1=$'%F{blue}%~ %F{white}󱦰 '

# History
setopt histignorealldups sharehistory
HISTSIZE=10000
SAVEHIST=10000

HISTFILE=$ZDOTDIR/.zsh_history

# Stop C-s Freezing Terminal
stty stop undef

# Plugin Configuration
ZSH_AUTOSUGGEST_MANUAL_REBIND="disable"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HISTORY_IGNORE='(c|cd|l|ls|v|nvim|rm|mv|cp) *'
