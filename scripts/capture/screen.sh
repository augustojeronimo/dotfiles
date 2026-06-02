#!/usr/bin/env bash

source "$DOTFILES/scripts/capture/_capture.sh"


[[ $# -ne 0 ]] && die "no required args"

capture_screen

