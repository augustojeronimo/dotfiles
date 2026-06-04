#######################
###   Completions   ###
#######################


# General
fpath+=($ZDOTDIR/completions/general)

# Dotfiles
if [[ ! -z "$DOTFILES" ]]; then
    fpath+=($ZDOTDIR/completions/dotfiles)
fi


# Apply
autoload -Uz compinit
compinit -d "$ZSH_CACHE/zcompdump"

# Completion style
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
