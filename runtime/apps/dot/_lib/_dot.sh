#!/usr/bin/env bash

source "$DOTFILES/runtime/lib/base.sh"

get_categories()
{
    for dir in "$DOT_APPS/dot"/*; do
        [ -d "$dir" ] || continue

        category="$(basename "$dir")"

        [[ "$category" == _* ]] && continue

        [ -n "$(get_actions "$category")" ] || continue

        printf '%s\n' "$category"
    done | sort
}

get_actions()
{
    category="$1"

    [[ -z "$category" || ! -d "$DOT_APPS/dot/$category" ]] && return

    find "$DOTFILES/runtime/apps/dot/$category" \
        -type f -executable \
        -name "*.sh" ! -name "_*" \
        -exec basename {} .sh \; | sort
}

