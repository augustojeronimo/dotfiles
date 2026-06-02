#!/usr/bin/env bash


source "$DOTFILES/scripts/menu/_menu.sh"

menu_type="wallpaper"
mapfile -t menu_options < <(dot --fg theme wallpaper __complete)

choice=$(menu_select "$menu_type" "${menu_options[@]}")

[[ -z "$choice" ]] && exit 0

dot --bg theme wallpaper "$choice"

