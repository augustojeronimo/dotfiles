-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

local home          = os.getenv("HOME")
local config        = os.getenv("XDG_CONFIG_HOME")

local zsh_config    = config.."/zsh"

local dot_path      = home.."/dotfiles"
local dot_bin       = home.."/dotfiles/bin"
local local_bin     = home.."/.local/bin"

local path          = "/usr/local/bin:/usr/bin:/bin:"..local_bin..":"..dot_bin

local wall_path     = home.."/wallpapers"
local wall_cur      = home.."/wallpapers/current.png"


local d_editor      = "nvim"
local d_terminal    = "kitty"


-- DOTFILES
hl.env("DOTFILES", dot_path)
hl.env("PATH", path)

hl.env("ZDOTDIR", zsh_config)

hl.env("WALLPAPERS", wall_path)
hl.env("WALLPAPER", wall_cur)

-- DEFAULT
hl.env("TERMINAL", d_terminal)
hl.env("EDITOR", d_editor)

-- XDG
hl.env("XDG_CURRENT_DESKTOP",	"Hyprland")
hl.env("XDG_SESSION_TYPE",	    "wayland")
hl.env("XDG_SESSION_DESKTOP",	"Hyprland")

-- QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Hypr
hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")

