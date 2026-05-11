#!/bin/bash


[[ -z "$WALLPAPERS" || ! -d "$WALLPAPERS"  ]] && exit 1


mapfile -t wallpapers < <( \
    find "$WALLPAPERS" -type f "(" \
	-iname "*.jpg" -o \
	-iname "*.jpeg" -o \
	-iname "*.png" -o \
	-iname "*.webp" \
	")" \
)

# If no wallpapers found #
[[ ${#wallpapers[@]} -eq 0 ]] && { echo "No wallpapers found"; exit 1; }

# Create relative path list for Wofi #
mapfile -t relative_list < <(printf "%s\n" "${wallpapers[@]}" | sed "s|$WALLPAPERS/||")

# Wofi selection #
selected_relative=$(printf "%s\n" "${relative_list[@]}" | sort | wofi --dmenu --prompt "Select wallpaper:")

# Exit if nothing selected #
[[ -z "$selected_relative" ]] && exit 0

# Absolute path for selected wallpaper #
selected_absolute="$WALLPAPERS/$selected_relative"

# Create or update synlink to current wallpaper #
ln -sf "$selected_absolute" "$WALLPAPER"
notify-send "Wallpaper defined" "$selected_absolute"

theme-update

