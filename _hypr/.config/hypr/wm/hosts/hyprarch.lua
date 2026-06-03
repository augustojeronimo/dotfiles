-----------------------
---- Thinkpad Host ----
-----------------------

-- Profile
require("wm.profiles.laptop")


-- Hardware

hl.config({
    input = {
        kb_model = "thinkpad",
    }
})

-- hl.monitor({
--     output   = "eDP-1",
--     mode     = "1920x1080@60",
--     position = "0x0",
--     scale    = "1.0",
-- })

M.add("eDP-1", {1920, 1080, 60}, 1.0)
