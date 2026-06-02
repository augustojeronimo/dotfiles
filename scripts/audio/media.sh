#!/usr/bin/env bash

source "$DOTFILES/scripts/_core.sh"

require playerctl


[[ ! $# -eq 1 ]] && die "usage: media {play|pause|play-pause|next|prev}"


case $1 in
    play)		playerctl play ;;
    pause)		playerctl pause ;;
    play-pause)	playerctl play-pause ;;
    next)		playerctl next ;;
    prev)		playerctl previous ;;

    *) die "unknown argument '$1'" ;;
esac

sleep 1

title=$(playerctl metadata title 2>/dev/null)

notify_stack "MEDIA" "Media" "$title"

