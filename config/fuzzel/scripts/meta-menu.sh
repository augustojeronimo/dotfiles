#!/bin/bash


# Dispatcher for fuzzel menu scripts #

RDIR="$XDG_CONFIG_HOME/fuzzel/scripts"

# Preservation of order

declare -A options
declare -a order

add_option()
{
    local label="$1"
    local cmd="$2"

    # evita adicionar entradas inválidas
    [[ -z "$label" || -z "$cmd" ]] && return 1

    options["$label"]="$cmd"
    order+=("$label")
}

add_option "Wallpaper selection" "$RDIR/wallpaper.sh"
add_option "Power Options" "$RDIR/power.sh"

# Execution
choice=$(
    printf "%s\n" "${order[@]}" | fuzzel -d --config ~/.config/fuzzel/menus/meta-menu.ini
)

[[ -z "$choice" ]] && exit 0

cmd="${options[$choice]}"

[[ -z "$cmd" || ! -x "$cmd" ]] && exit 1

exec "$cmd"


