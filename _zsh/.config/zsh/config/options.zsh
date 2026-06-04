###################
###   OPTIONS   ###
##################


# History #
HISTFILE=$ZSH_STATE/history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Directory Stack #
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Shell Behavior #
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

