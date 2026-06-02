#!/usr/bin/env bash

source "$DOTFILES/scripts/_core.sh"

require_env WALLPAPERS WALLPAPER


matugen image "$WALLPAPER"
