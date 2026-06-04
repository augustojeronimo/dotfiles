#################
###   TOOLS   ###
#################


# Bat #
if (( $+commands[bat] )); then
    export MANPAGER="bat -l man -p"
    alias cat="bat"
fi

# Eza #
if (( $+commands[eza] )); then
    alias ls="eza --icons --group-directories-first --color=auto -I .git"
    alias la="ls -A"
    alias ll="ls -lhA"
    alias lr="ls -RA"
    alias tree="eza --icons --tree"
fi

# Neovim #
if (( $+commands[nvim] )); then
    alias vi="nvim"
    alias vim="nvim"
fi

# Yay #
if (( $+commands[yay] )); then
    alias u="yay -Syu"
    alias i="yay -S --needed"
    alias r="yay -Rns"
    alias s="yay -Ss"
    alias q="yay -Q"
fi

# Wl-clipboard #
if (( $+commands[wl-copy] )); then
    alias cpf="wl-copy <"
fi

