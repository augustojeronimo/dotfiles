#!/usr/bin/env bash

source "$DOT_APPS/dot/_lib/_core.sh"

require hyprsunset

[[ $# -ne 1 ]] && die "filter {on|off|toggle}"

gamma=90
temperature=4000

case "$1" in
    on)     is_running  hyprsunset || run hyprsunset --gamma "$gamma" --temperature "$temperature" ;;
    off)    kill_proc   hyprsunset ;;
    toggle) kill_proc   hyprsunset || run hyprsunset --gamma "$gamma" --temperature "$temperature" ;;

    *) die "unknown option '$1'" ;;
esac

