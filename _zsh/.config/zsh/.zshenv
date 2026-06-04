##################
###   ZSHENV   ###
##################


# XDG Base Directories
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}

export XDG_CONFIG_HOME
export XDG_CACHE_HOME
export XDG_DATA_HOME
export XDG_STATE_HOME

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_STATE="$XDG_STATE_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"


# Default apps
: "${EDITOR:=nvim}"
: "${VISUAL:=nvim}"
: "${TERMINAL:=kitty}"

export EDITOR
export VISUAL
export TERMINAL


# GPG
export GPG_TTY=$(tty)

