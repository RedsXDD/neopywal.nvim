---@diagnostic disable: undefined-field
local cwd = vim.uv.cwd()
local root = "/tmp/neopywal_manual_tests"

if vim.fn.isdirectory(root) == 0 then vim.fn.mkdir(root, "p") end

for _, name in ipairs({ "config", "data", "state", "cache" }) do
    vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    { dir = cwd },
}, {
    root = root .. "/plugins",
    dev = {
        path = debug.getinfo(1).source:sub(2, -21),
    },
})

vim.g.neopywal_debug = true

require("neopywal").setup({
    colorscheme_file = "" .. cwd .. "/tests/colors-wal.vim",
})
vim.cmd.colorscheme("neopywal")
