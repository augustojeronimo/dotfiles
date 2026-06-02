#!/usr/bin/env bash

source "$DOTFILES/scripts/audio/_audio.sh"


TARGET="@DEFAULT_AUDIO_SINK@"
STEP=5

[[ $# -lt 1 ]] && die "usage: sink {volume|mute|get|set}"


case "$1" in
    volume)
        [[ $# -ne 2 ]] && die "usage: sink volume {get|up|down}"

        case "$2" in
            get)    audio_get_volume "$TARGET"              ; audio_notify ;;
            up)     audio_set_volume "$TARGET" "${STEP}%+"  ; audio_notify ;;
            down)   audio_set_volume "$TARGET" "${STEP}%-"  ; audio_notify ;;
            *)      die "invalid volume action" ;;
        esac    
    ;;

    mute)
        [[ "$2" == "toggle" ]] || die "usage: sink mute toggle"

        audio_toggle_mute "$TARGET"; audio_notify
    ;;

    *) die "unknown command" ;;
esac

