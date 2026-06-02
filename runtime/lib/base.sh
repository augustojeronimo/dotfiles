#!/usr/bin/env bash

# ---- errors ----

die() {
    echo "${0##*/}: $*" >&2
    exit 1
}

# ---- env ----

require_env() {
    for var in "$@"; do
        [[ -n "${!var:-}" ]] || die "missing env '$var'"
    done
}

# ---- dependencies ----

require() {
    local cmd
    for cmd in "$@"; do
        command -v "$cmd" >/dev/null 2>&1 || die "missing dependency '$cmd'"
    done
}


# ---- safety ----

set -o pipefail

