-------------------
--- Bind Helper ---
-------------------

_G.B = _G.B or {}


-- Binds
function B.bind(keys, action, opts)
    hl.bind(keys, action, opts)
end

function B.bind_cmd(keys, cmd, opts)
    B.bind(keys, hl.dsp.exec_cmd(cmd), opts)
end


-- Autobind
function B.bind_ws_abs(main_mod, move_mod)
    for ws = 1, 10 do
        local key = ws % 10

        -- focus
        B.bind(
            main_mod .. " + " .. key,
            R.focus_ws(ws)
        )

        -- move
        B.bind(
            main_mod .. " + " .. move_mod .. " + " .. key,
            R.move_ws(ws)
        )
    end
end

function B.define_manage_keys(main_mod, move_mod, resize_mod, direction_keys, workspace_keys)
    local dirs = {
        up      = "u",
        down    = "d",
        left    = "l",
        right   = "r",
    }

    local works = {
        prev = "m-1",
        next = "m+1",
    }

    local resize_step = 30

    local delta = {
        up    = { 0, -resize_step },
        down  = { 0,  resize_step },
        left  = { -resize_step, 0 },
        right = {  resize_step, 0 },
    }


    -- window
    for name, key in pairs(direction_keys) do
        local dir = dirs[name]

        if not dir then goto continue end

        -- Focus
        B.bind(
            main_mod .. " + " .. key,
            R.focus(dir)
        )

        -- Move
        B.bind(
            main_mod .. " + " .. move_mod .. " + " .. key,
            R.move(dir)
        )

        -- Resize
        local d = delta[name]
        local x, y = d[1], d[2]

        B.bind(
            main_mod .. " + " .. resize_mod .. " + " .. key,
            R.resize(x, y),
            { repeating = true, locked = true }
        )

        ::continue::
    end

    -- workspace
    B.bind_ws_abs(main_mod, move_mod)

    for name, key in pairs(workspace_keys or {}) do
        local ws = works[name]

        if not ws then goto continue end

        B.bind(
            main_mod .. " + " .. key,
            R.focus_ws(ws)
        )

        B.bind(
            main_mod .. " + " .. move_mod .. " + " .. key,
            R.move_ws(ws)
        )

        ::continue::
    end

end
