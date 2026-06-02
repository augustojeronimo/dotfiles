#!/usr/bin/env bash

source "$DOTFILES/scripts/_core.sh"

require brightnessctl


STEP=5
DIM_STEP=40


get_brightness()
{
    local max cur
    max=$(brightnessctl max)
    cur=$(brightnessctl get)
    echo $(( cur * 100 / max ))
}

# 

[[ $# -ne 1 ]] && die "brightness {get|up|down|dim|resume}"

case "$1" in
    up)     brightnessctl -n2 set "${STEP}%+" >/dev/null ;;
    down)   brightnessctl -n2 set "${STEP}%-" >/dev/null ;;
    get)
        get_brightness
        exit 0
        ;;
    dim)
        brightnessctl -s set "${DIM_STEP}%-" >/dev/null
        exit 0
        ;;
    resume)
        brightnessctl -r >/dev/null
        exit 0
        ;;
        
    *) die "unknown option '$1'" ;;
esac

brightness=$(get_brightness)

echo "Bringhtness set to ${brightness}%"

notify_bar "BRIGHTNESS" "Brightness" "$brightness"
