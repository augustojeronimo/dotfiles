----------------------
--- Laptop Profile ---
----------------------

-- Config --

-- input
hl.config({
    input = {
        touchpad = {
            natural_scroll = true,
        },
    },

    general = {
        layout = "scrolling",

        gaps_in  = 3,
        gaps_out = 5,

        border_size = 2,
    },
})

-- Startup
hl.on("hyprland.start", function ()
    hl.exec_cmd("hypridle --config $XDG_CONFIG_HOME/hypr/idle/default.conf")
end)

