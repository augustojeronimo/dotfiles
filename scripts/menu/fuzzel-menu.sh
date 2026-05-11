#!/bin/bash


options="Option A\nOption B\nOption C\n"

choice=$(printf "$options" | fuzzel -d)

notify-send "Choice: $choice"


