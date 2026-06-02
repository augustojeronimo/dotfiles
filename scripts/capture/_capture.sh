#!/usr/bin/env bash

source "$DOTFILES/scripts/_core.sh"

require hyprshot
require hyprpicker


capture_area()
{
    is_running hyprshot || run hyprshot -m region
}

capture_window()
{
    is_running hyprshot || run hyprshot -m window -m active
}

capture_screen()
{
    is_running hyprshot || run hyprshot -m output -m active
}

capture_color()
{
    is_running hyprpicker || run hyprpicker -a
}

