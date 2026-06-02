#!/bin/bash


source "$DOT_APPS/dot/menu/_menu.sh"

mapfile -t menu_options < <(
    dot __complete actions menu | grep -v '^main$'
)

choice=$(menu_select main "${menu_options[@]}")

[[ -z "$choice" ]] && exit 0

cmd="dot menu $choice"

exec $cmd

