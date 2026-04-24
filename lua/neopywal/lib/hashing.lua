local M = {}

-- Use the bxor/lshift functions inside Neovim's builtin bit/bit32 library tables.
-- If neither exist use the functions on lib/bit.lua.
---@diagnostic disable-next-line: undefined-global
local B = bit or bit32 or require("neopywal.lib.bit")

-- djb2, https://theartincode.stanis.me/008-djb2/
local hash_str = function(str)
    local hash = 5381
    for i = 1, #str do
        hash = B.lshift(hash, 5) + hash + string.byte(str, i)
    end
    return hash
end

--[[
    https://github.com/catppuccin/nvim/blob/bad9c23f12944683cd11484d9570560849efc101/lua/catppuccin/lib/hashing.lua
    https://codeforces.com/blog/entry/85900 -- Xor hashing.
]]
function M.hash(v)
    local t = type(v)
    if t == "table" then
        local hash = 0
        for p, u in next, v do
            hash = B.bxor(hash, hash_str(p .. M.hash(u)))
        end
        return hash
    elseif t == "function" then
        return M.hash(v({
            background = "#000000",
            foreground = "#000000",
            color0 = "#000000",
            color1 = "#000000",
            color2 = "#000000",
            color3 = "#000000",
            color4 = "#000000",
            color5 = "#000000",
            color6 = "#000000",
            color7 = "#000000",
            color8 = "#000000",
            color9 = "#000000",
            color10 = "#000000",
            color11 = "#000000",
            color12 = "#000000",
            color13 = "#000000",
            color14 = "#000000",
            color15 = "#000000",
        }))
    end

    return tostring(v)
end

return M
