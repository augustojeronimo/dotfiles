###################
###   ALIASES   ###
###################


# ZSH #
#alias zz="source $ZDOTDIR/.zshrc"

# Apps #
alias vi="nvim"

# Dir stack #
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Navigation #
alias ~="cd ~"
alias ..="cd .."
#alias ...="cd ../.."

# Pacman/yay #
alias u="yay -Syu"
alias i="yay -S --needed"
alias r="yay -Rns"
alias s="yay -Ss"
alias q="yay -Q"

# LS #
alias ls="eza --icons --group-directories-first --color=auto"
alias la="ls -A"
alias ll="ls -lha"
alias lr="ls -RA"

# Grep #
alias grep="grep --color=auto --ignore-case"

# File Security #
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

