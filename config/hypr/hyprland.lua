-----------------------
--- HYPRLAND CONFIG ---
-----------------------

-- This config was splited in modules


-- Global Helpers
require("wm.helpers.general")
require("wm.helpers.runner")
require("wm.helpers.binder")
require("wm.helpers.monitor")

-- Theme
_G.THEME = H.prequire("wm.dynamic.colors", "wm.theme.colors")

-- Enviroment
require("wm.core.env")

-- Base
require("wm.core.input_base")
require("wm.core.binds")
require("wm.core.autostart")

require("wm.core.misc")
require("wm.core.windowrules")
require("wm.core.layout")
require("wm.core.animation")
require("wm.core.decorations")


-- Context
require("wm.context")
