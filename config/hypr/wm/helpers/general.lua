----------------------
--- General Helper ---
----------------------

_G.H = _G.H or {}

function H.file_exists(path)
    local f = io.open(path, "r")

    if f then
        f:close()
        return true
    end

    return false
end

function H.prequire(module, fallback)
    local base = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
    local path = base .. "/hypr/" .. module:gsub("%.", "/") .. ".lua"

    if H.file_exists(path) then
        return require(module)
    elseif fallback then
        return require(fallback)
    end

    return nil
end
