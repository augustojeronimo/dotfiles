#!/usr/bin/env bash

source "$DOTFILES/runtime/lib/base.sh"

run_detached()
{
    setsid "$@" >/dev/null 2>&1 < /dev/null &
}

run()
{
    if [[ -n "${DOT_BG:-}" ]]; then
        run_detached "$@"
    else
        "$@"
    fi    
}

is_running()
{
    pgrep -x "$1" >/dev/null
}

kill_proc()
{
    pkill -x "$@" >/dev/null
}

notify()
{
    [[ -n "${DOT_BG:-}" ]] || return 0
    require dunstify

    dunstify "$@"
}

notify_stack()
{
    local tag="$1"
    shift
    
    notify -t 2000 --stack-tag="$tag" "$@"
}

notify_bar()
{
    local tag="$1"
    local title="$2"
    local value="$3"
    
    notify_stack "$tag" "$title" -h "int:value:${value}"
}

