---------------------------------
--- HYPRLAND COLORS - MATUGEN ---
---------------------------------


local M = {}

M.colors = {
    -- Base
    bg = "{{ colors.background.default.hex }}",
    fg = "{{ colors.on_background.default.hex }}",

    -- Primary
    primary = "{{ colors.primary.default.hex }}",
    on_primary = "{{ colors.on_primary.default.hex }}",

    -- Secondary / Accent
    accent = "{{ colors.primary_container.default.hex }}",
    on_accent = "{{ colors.on_secondary.default.hex }}",

    -- Surface
    surface = "{{ colors.surface.default.hex }}",
    on_surface = "{{ colors.on_surface.default.hex }}",

    -- Extra
    error = "{{ colors.error.default.hex }}",
    outline = "{{ colors.outline.default.hex }}",
}

return M


