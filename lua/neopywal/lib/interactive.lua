-- Reference: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/interactive.lua

local M = {}
local Notify = require("neopywal.utils.notify")

local function get_filetype() return vim["bo"] and vim.bo.filetype or vim.eval("&filetype") end

local function attach()
    vim.cmd([[
        augroup NeopywalInteractiveModeAugroup
          autocmd!
          autocmd BufWritePost <buffer> lua require("neopywal.lib.interactive").run()
        augroup END
    ]])
end

local function detach()
    vim.cmd([[
        autocmd! NeopywalInteractiveModeAugroup
        augroup! NeopywalInteractiveModeAugroup
    ]])
end

function M.run()
    local source_method = get_filetype() == "lua" and "luafile" or "source"
    local name = vim["g"] and vim.g.colors_name or vim.eval("g:colors_name")

    require("neopywal.lib.config").reset()
    vim.cmd(string.format(
        [[
%s %%
colorscheme %s
doautoall ColorScheme]],
        source_method,
        name
    ))
end

M.state = false
function M.toggle()
    if M.state then
        detach()
    else
        attach()
    end
    M.state = not M.state
    Notify.info(string.format([[%s interactive mode.]], M.state and "Enabled" or "Disabled"))
end

return M
