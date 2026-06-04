#!/usr/bin/env bash

source "$DOT_APPS/dot/audio/_audio.sh"


TARGET="@DEFAULT_AUDIO_SOURCE@"

[[ $# -lt 1 ]] && die "usage: source {mute|set}"

case "$1" in
    mute)
        [[ "$2" == "toggle" ]] || die "usage: source mute toggle"

        audio_toggle_mute "$TARGET"
        audio_notify
    ;;

    set)
        [[ $# -ne 2 ]] && die "Usage: source set <device>"

        audio_set_default "$2"
    ;;

    *) die "Unknown command" ;;
esac
