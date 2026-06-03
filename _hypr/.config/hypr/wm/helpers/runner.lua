------------------
--- Run Helper ---
------------------

_G.R = _G.R or {}


-- Dispatchers
function R.resize(x, y)
    return hl.dsp.window.resize({
        x = x,
        y = y,
        relative = true
    })
end

function R.focus(dir)
    return hl.dsp.focus({ direction = dir })
end

function R.move(dir)
    return hl.dsp.window.move({ direction = dir })
end

function R.focus_ws(ws)
    return hl.dsp.focus({ workspace = ws })
end

function R.move_ws(ws)
    return hl.dsp.window.move({ workspace = ws })
end
