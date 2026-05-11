#################
###   BINDS   ###
#################


# Mode #
bindkey -e


# Navigation #

# up/down
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# [ctrl +] home/end
bindkey "^[[1;5H" beginning-of-line
bindkey "^[[1;5F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# ctrl + left/right
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word


# Edit #

# delete key
bindkey "^[[3~" delete-char

# ctrl + backspace/delete
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word

