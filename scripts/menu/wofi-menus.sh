#!/bin/bash


# Dispatcher for wofi scripts #

RDIR="$DOTFILES/scripts/menu"

declare -A options

options=(
    ["Application menu"]="$RDIR/launcher.sh"
    ["Wallpaper selection"]="$RDIR/wallpaper-select.sh"
    ["Power options"]="$RDIR/menu-power.sh"
)

choice=$(
    printf "%s\n" "${!options[@]}" | sort |  wofi --dmenu
)

[[ -z "$choice" ]] && exit 0

cmd="${options[$choice]}"

[[ -z "$cmd" || ! -x "$cmd" ]] && exit 1

exec "$cmd"


