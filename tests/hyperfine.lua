---@diagnostic disable: undefined-field
local cwd = vim.uv.cwd()
local root = "/tmp/neopywal_hyperfine"
local colorscheme = os.getenv("COLORSCHEME") or "neopywal"

if vim.loader then vim.loader.enable() end
if vim.fn.isdirectory(root) == 0 then vim.fn.mkdir(root, "p") end

for _, name in ipairs({ "config", "data", "state", "cache" }) do
    vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)
local has_lazy, lazy = pcall(require, "lazy")
if not has_lazy then return end

lazy.setup({
    {
        dir = cwd, -- Neopywal.nvim
        enabled = colorscheme == "neopywal",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = colorscheme == "catppuccin",
    },
    {
        "folke/tokyonight.nvim",
        enabled = colorscheme == "tokyonight",
    },
}, {
    root = root .. "/plugins",
    dev = {
        path = debug.getinfo(1).source:sub(2, -21),
    },
    checker = {
        enabled = false,
        notify = false,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    profiling = {
        loader = true,
        require = true,
    },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

if colorscheme == "neopywal" then
    local has_neopywal, neopywal = pcall(require, "neopywal")
    if not has_neopywal then return end

    vim.g.neopywal_debug = false
    neopywal.setup({
        use_palette = "" .. cwd .. "/tests/colors-wal.vim",
        default_fileformats = false,
        default_plugins = false,
    })
    vim.cmd.colorscheme("neopywal")
elseif colorscheme == "catppuccin" then
    local has_catppuccin, catppuccin = pcall(require, "catppuccin")
    if not has_catppuccin then return end

    vim.g.catppuccin_debug = false
    catppuccin.setup({
        default_integrations = false,
        transparent_background = false,
    })
    vim.cmd.colorscheme("catppuccin-mocha")
elseif colorscheme == "tokyonight" then
    local has_tokyonight, tokyonight = pcall(require, "tokyonight")
    if not has_tokyonight then return end

    vim.g.tokyonight_debug = false
    tokyonight.setup({ plugins = { all = false } })
    vim.cmd.colorscheme("tokyonight-storm")
end
