#!/usr/bin/env bash

source "$DOTFILES/scripts/_core.sh"

require wpctl
require awk


audio_get_volume()
{
    local target="$1"

    wpctl get-volume "$target" | awk '{printf "%.0f\n", $2 * 100}'
}

audio_set_volume()
{
    local target="$1"
    local value="$2"

    wpctl set-volume -l 1 "$target" "$value" >/dev/null
}

audio_toggle_mute()
{
    local target="$1"

    wpctl set-mute "$target" toggle >/dev/null
}

audio_is_muted() {
    local target="$1"

    wpctl get-volume "$target" | grep -q '\[MUTED\]'
}

audio_set_default() {
    local target="$1"

    wpctl set-default "$target"
}

audio_notify_sink()
{
    local tag="AUDIO_SINK"
    local sink="@DEFAULT_AUDIO_SINK@"
    
    local value
    value=$(audio_get_volume "$sink")

    local message="Volume"

    if audio_is_muted "$sink"; then
        message+=" [muted]"
    fi

    notify_bar "$tag" "$message" "$value"
}

audio_notify_source()
{
     local tag="AUDIO_SOURCE"
    local source="@DEFAULT_AUDIO_SOURCE@"

    local message="Microphone"

    if audio_is_muted "$source"; then
        message+=" [muted]"
    else
        message+=" [on]"
    fi

    notify_stack "$tag" "$message"
}

audio_notify() { audio_notify_source; audio_notify_sink; }
