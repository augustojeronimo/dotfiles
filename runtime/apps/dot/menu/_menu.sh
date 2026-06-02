#!/usr/bin/env bash


MENUS="${XDG_CONFIG_HOME:-$HOME/.config}/fuzzel/menus/"

menu_select()
{    
    local menu_type="${1:-}"
    shift || return 1
    
    local menu_config="$MENUS/$menu_type.ini"

    [[ -z "$menu_type" || $# -eq 0 || ! -f "$menu_config" ]] && return 1

    local choice
    choice=$(printf "%s\n" "$@" | fuzzel --dmenu --only-match --config "$menu_config") || return 1

    [[ -n "$choice" ]] && printf "%s\n" "$choice"
}
