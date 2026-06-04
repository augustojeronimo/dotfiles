###################
###   ALIASES   ###
###################

# Dir stack #
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Navigation #
alias ~="cd ~"
alias ..="cd .."

# LS #
alias ls="ls --color=auto"
alias la="ls -A --color=auto"
alias ll="ls -lhA --color=auto"
alias lr="ls -RA --color=auto"

# Grep #
alias grep="grep --color=auto --ignore-case"

# File Security #
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

