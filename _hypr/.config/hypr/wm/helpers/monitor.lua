----------------------
--- Monitor Helper ---
----------------------

_G.M = _G.M or {}

M.monitors = M.monitors or {}


local function calculate_position(ref, width, height, pos)
    local side  = pos.side
    local align = pos.align or "center"

    local x, y = ref.x, ref.y

    if side == "right" then
        x = ref.x + ref.width
    elseif side == "left" then
        x = ref.x - width
    end

    if side == "right" or side == "left" then
        if align == "top" then
            y = ref.y
        elseif align == "center" then
            y = ref.y + (ref.height - height) / 2
        elseif align == "bottom" then
            y = ref.y + ref.height - height
        end
    end

    if side == "top" then
        y = ref.y - height
    elseif side == "bottom" then
        y = ref.y + ref.height
    end

    if side == "top" or side == "bottom" then
        if align == "left" then
            x = ref.x
        elseif align == "center" then
            x = ref.x + (ref.width - width) / 2
        elseif align == "right" then
            x = ref.x + ref.width - width
        end
    end

    return math.floor(x), math.floor(y)
    -- return 0, 0
end

function M.add(name, mode, scale, pos)
    local width  = mode[1]
    local height = mode[2]
    local hz     = mode[3]

    scale = scale or 1.0

    local x, y = 0, 0

    if pos and pos.relative_to then
        local ref = M.monitors[pos.relative_to]

        if ref then
            x, y = calculate_position(ref, width, height, pos)
        end
    elseif not M.primary then
        M.primary = name
    end

    hl.monitor({
        output = name,
        mode = width .. "x" .. height .. "@" .. hz,
        position = x .. "x" .. y,
        scale = scale
    })

    M.monitors[name] = {
        width = width,
        height = height,
        x = x,
        y = y,
    }

    return M.monitors[name]
end