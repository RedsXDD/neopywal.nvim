local M = {}

-- Use the bxor/lshift functions inside Neovim's builtin bit/bit32 library tables.
-- If neither exist use the functions on lib/bit.lua.
---@diagnostic disable-next-line: undefined-global
local B = bit or bit32 or require("neopywal.lib.bit")

local hash_str = function(str) -- djb2, https://theartincode.stanis.me/008-djb2/
    local hash = 5381
    for i = 1, #str do
        hash = B.lshift(hash, 5) + hash + string.byte(str, i)
    end
    return hash
end

function M.hash(v) -- Xor hashing: https://codeforces.com/blog/entry/85900
    local t = type(v)
    if t == "table" then
        local hash = 0
        for p, u in next, v do
            hash = B.bxor(hash, hash_str(p .. M.hash(u)))
        end
        return hash
    elseif t == "function" then
        return M.hash(v(require("neopywal.lib.palette").get()))
    end

    return tostring(v)
end

return M
