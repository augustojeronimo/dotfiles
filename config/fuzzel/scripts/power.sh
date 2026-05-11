#!/bin/bash


choice=$(printf "Logout\nSuspend\nShutdown\nReboot\n" | fuzzel -d --config ~/.config/fuzzel/menus/power.ini)

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



