#!/usr/bin/env bash


source "$DOT_APPS/dot/menu/_menu.sh"

menu_type="idle"
menu_options=(Disabled Normal Patient Impatient)

choice=$(menu_select "$menu_type" "${menu_options[@]}")

[[ -z "$choice" ]] && exit 0

pkill -x hypridle
sleep 0.1

case "$choice" in
    Disable)
        notify-send -r 9991 "Idle Disabled"
        exit 0
        ;;
    Normal)
        profile="default"
        ;;
    Patient)
        profile="patient"
        ;;
    Impatient)
        profile="impatient"
        ;;
esac

hypridle -c "$CONFIG_DIR/$profile.conf" >/dev/null 2>&1 &
disown


if [[ -n "${DOT_BG:-}" ]];then
    dunstify --stack-tag="IDLE-PROFILE" "Idle" "Profile set to: $choice"
else
    echo "Idle profile set to: $choice"
fi

