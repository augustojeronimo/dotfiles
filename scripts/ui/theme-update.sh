#!/bin/bash

[[ -z "$WALLPAPERS" || -z "$WALLPAPER" ]] && exit 0

matugen image "$WALLPAPER"

