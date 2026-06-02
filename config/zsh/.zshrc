##################
###   ZSHELL   ###
##################


# Appearance #
source $ZDOTDIR/appearance/theme.zsh

# Completions #

fpath+=($XDG_CONFIG_HOME/zsh/completions)

autoload -Uz compinit
compinit

#compdef _dot dot

# Config #
source $ZDOTDIR/config/options.zsh
source $ZDOTDIR/config/zle.zsh
source $ZDOTDIR/config/binds.zsh

# Extra #
source $ZDOTDIR/extra/functions.zsh
source $ZDOTDIR/extra/aliases.zsh

# Plugin #
source $ZDOTDIR/plugins/plugins.zsh


