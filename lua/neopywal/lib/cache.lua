local M = {}
local palette = require("neopywal.lib.palette")
local compiler = require("neopywal.lib.compiler")

---@param user_config NeopywalOptions?
function M.gen_cache(user_config, compiler_options)
    user_config = user_config or {}
    if not compiler_options then error("Neopywal(ERROR): Missing compiler options to gen_cache().") end

    -- Get cached hash.
    local cached_path = compiler_options.compile_path .. compiler_options.path_sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    -- Get current hash.
    local minimal_palette = palette.get(nil, true)
    local git_path = debug.getinfo(1).source:sub(2, -27) .. ".git"
    local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
    local hash = require("neopywal.lib.hashing").hash({ user_config, minimal_palette })
        .. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
        .. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
        .. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend

    -- Recompile if hash changed.
    if cached ~= hash then
        compiler.compile()
        file = io.open(cached_path, "wb")
        if file then
            file:write(hash)
            file:close()
        end
    end
end

return M
