---------------------
---- MY PROGRAMS ----
---------------------

local terminal          = "kitty"
local fileManager       = terminal.." yazi"
local launcher          = "fuzzel"
local bar_toggle        = "pkill -x waybar || waybar"
local browser           = "google-chrome-stable"

local print_area        = "dot --bg capture area"
local print_window      = "dot --bg capture window"
local print_screen      = "dot --bg capture screen"
local picker_toggle     = "dot --bg capture color"

local filter_toggle     = "dot --bg display filter toggle"
local lock              = "pidof hyprlock || hyprlock"
local menu_main         = "dot --bg menu main"
local menu_power        = "dot --bg menu power"


---------------------
---- KEYBINDINGS ----
---------------------

-- Manage keys
local main_mod   = "SUPER"
local move_mod   = "CONTROL"
local resize_mod = "ALT"
local dir_keys = {
    up      = "UP",
    down    = "DOWN",
    left    = "LEFT",
    right   = "RIGHT",
}
-- local dir_keys = {
--     up      = "K",
--     down    = "J",
--     left    = "H",
--     right   = "L",
-- }
local ws_keys = {
    prev = "PRIOR",
    next = "NEXT",
    -- special?
}

B.define_manage_keys(main_mod, move_mod, resize_mod, dir_keys, ws_keys)

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Apps
B.bind_cmd("SUPER + RETURN",  terminal)
B.bind_cmd("SUPER + F",       fileManager)
B.bind_cmd("SUPER + ESCAPE",  bar_toggle)
B.bind_cmd("SUPER + SPACE",   launcher)
B.bind_cmd("SUPER + B",       browser)

-- Print
B.bind_cmd("CONTROL + PRINT", print_area)
B.bind_cmd("ALT + PRINT",     print_window)
B.bind_cmd("SHIFT + PRINT",   print_screen)
B.bind_cmd("SUPER + PRINT",   picker_toggle)

B.bind_cmd("SUPER + Y",       filter_toggle)
B.bind_cmd("SUPER + L",       lock)

B.bind_cmd("SUPER + X",       menu_main)
B.bind_cmd("SUPER + DELETE",  menu_power)


B.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))

B.bind("SUPER + TAB", function()
    if (hl.get_config("general.layout") == "dwindle") then
        hl.dispatch(hl.dsp.layout("togglesplit"))
    end
end)

-- System
B.bind("SUPER + Q", hl.dsp.window.close())
B.bind("SUPER + M", hl.dsp.exit())
B.bind_cmd("SUPER + R", "hyprctl reload")

-- Laptop multimedia keys for volume, LCD brightness and power
B.bind_cmd("XF86PowerOff",            "dot --bg menu power")
B.bind_cmd("XF86AudioRaiseVolume",    "dot --bg audio sink volume up",        { locked = true, repeating = true })
B.bind_cmd("XF86AudioLowerVolume",    "dot --bg audio sink volume down",      { locked = true, repeating = true })
B.bind_cmd("XF86AudioMute",           "dot --bg audio sink mute toggle",      { locked = true, repeating = true })
B.bind_cmd("XF86AudioMicMute",        "dot --bg audio source mute toggle",    { locked = true, repeating = true })

B.bind_cmd("XF86MonBrightnessUp",     "dot --bg display brightness up",   { locked = true, repeating = true })
B.bind_cmd("XF86MonBrightnessDown",   "dot --bg display brightness down", { locked = true, repeating = true })

B.bind_cmd("XF86AudioNext",           "dot --bg audio media next",        { locked = true })
B.bind_cmd("XF86AudioPrev",           "dot --bg audio media prev",        { locked = true })
B.bind_cmd("XF86AudioPause",          "dot --bg audio media play-pause",  { locked = true })
B.bind_cmd("XF86AudioPlay",           "dot --bg audio media play-pause",  { locked = true })
