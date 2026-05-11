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
relative_path=$(printf "%s\n" "${relative_list[@]}" | sort | fuzzel -d --config ~/.config/fuzzel/menus/wallpaper.ini)

# Exit if nothing selected #
[[ -z "$relative_path" ]] && exit 0

# Absolute path for selected wallpaper #
absolute_path="$WALLPAPERS/$relative_path"

# Exit if file not exists #
[[ ! -f "$absolute_path" ]] && exit 1

# Create or update synlink to current wallpaper #
ln -sf "$absolute_path" "$WALLPAPER"
notify-send "Wallpaper defined" "$absolute_path"

theme-update

