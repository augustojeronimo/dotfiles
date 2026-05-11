#!/bin/bash

# Wofi power menu #
choice=$(printf "Suspend\nShutdown\nReboot\n" | wofi --dmenu )

[[ -z "$choice" ]] && exit 0

case "$choice" in
    "Suspend")
	exec systemctl suspend
	;;
    "Shutdown")
	exec systemctl poweroff
	;;
    "Reboot")
	exec systemctl reboot
	;;
    *)
	exit 1
	;;
esac



