#!/bin/bash


source "$DOT_APPS/dot/menu/_menu.sh"

menu_type="power"
menu_options=(Logout Suspend Shutdown Reboot)

choice=$(menu_select "$menu_type" "${menu_options[@]}" )

[[ -z "$choice" ]] && exit 0

case "$choice" in
    "Logout")
	hyprctl dispatch exit
	;;
    "Suspend")
	systemctl suspend
	;;
    "Shutdown")
	systemctl poweroff
	;;
    "Reboot")
	systemctl reboot
	;;
    *)
	exit 1
	;;
esac



