----------------------
--- Host Detection ---
----------------------

local f = io.open("/etc/hostname", "r")

local name = "unknown"

if f then
    name = f:read("*l")
    f:close()
end

return name

