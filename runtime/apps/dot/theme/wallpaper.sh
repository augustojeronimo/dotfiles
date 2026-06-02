#!/usr/bin/env bash

source "$DOT_APPS/dot/_lib/_core.sh"

require_env WALLPAPERS WALLPAPER


usage()
{
    echo "Usage"
    echo "	wallpaper [flags] <wallpaper_option>"
    echo
    echo "Flags:"
    printf "	%-14s %s\n" \
        "-h, --help" "Show this help" \
        "-l, --list" "List available wallpapers"

    exit 0
}

get_wallpapers()
{
    find "$WALLPAPERS" -type f \( \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.png" -o \
        -iname "*.webp" \
    \) -printf "%P\n" | sort
}

list_wallpapers()
{
    echo "Available wallpapers:"
    get_wallpapers | while IFS= read -r line; do
        printf "\t%s\n" "$line"
    done
}

# Autocomplete integration

if [[ "${1:-}" == "__complete" ]]; then
    get_wallpapers
    exit 0
fi

# Flag handling

while [[ $# -gt 0 ]]; do
    case "$1" in
        --help | -h) usage ;;
        --list | -l) list_wallpapers; exit 0 ;;

        --) shift; break ;;
        -*) die "unknown flag '$1'" ;;
        *)  break ;;
    esac
done


#####################################################

[[ ! $# -eq 1 ]] && usage

[[ ! -f "$WALLPAPERS/$1" ]] && die "invalid wallpaper"

ln -sf "$WALLPAPERS/$1" "$WALLPAPER"

echo "Wallpaper set to $1"

dot theme reload

notify_stack "WALLPAPER" "Wallpaper defined" "$1"

