local cwd = vim.uv.cwd()
local root = "/tmp/neopywal_hyprfine"

local has_colorscheme = os.getenv("COLORSCHEME") ~= nil
vim.g.colorscheme = has_colorscheme and os.getenv("COLORSCHEME") or "neopywal"
local spec = {
    {
        dir = os.getenv("HOME") .. "/.local/sources/Reds/neopywal.nvim",
        lazy = string.match(vim.g.colorscheme, "neopywal") == nil,
        name = "neopywal",
        priority = 1000,
        config = function()
            local has_neopywal, neopywal = pcall(require, "neopywal")
            if not has_neopywal then return end

            vim.g.neopywal_debug = true
            neopywal.setup({
                use_palette = "wallust",
                default_fileformats = false,
                default_plugins = false,
                plugins = {
                    treesitter = true,
                },
            })

            neopywal.load()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = string.match(vim.g.colorscheme, "tokyonight") == nil,
        name = "tokyonight",
        priority = 1000,
        config = function()
            local has_tokyonight, tokyonight = pcall(require, "tokyonight")
            if not has_tokyonight then return end

            -- vim.g.tokyonight_debug = true
            tokyonight.setup({ plugins = { all = false } })
            tokyonight.load()
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = string.match(vim.g.colorscheme, "catppuccin") == nil,
        priority = 1000,
        config = function()
            local has_catppuccin, catppuccin = pcall(require, "catppuccin")
            if not has_catppuccin then return end

            -- vim.g.catppuccin_debug = true
            catppuccin.setup({
                default_integrations = false,
                transparent_background = false,
            })
            catppuccin.load()
        end,
    },
}
--: Lazy.vim setup {{{
if vim.loader then vim.loader.enable() end

-- Set leader key:
if not has_colorscheme then
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Basic options
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
end

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

local opts = {
    { dir = cwd },
    defaults = {
        lazy = true,
        version = false,
    },
    install = {
        missing = true,
        colorscheme = { "" .. vim.g.colorscheme },
    },
    checker = {
        enabled = not has_colorscheme,
        notify = not has_colorscheme,
    },
    change_detection = {
        enabled = not has_colorscheme,
        notify = not has_colorscheme,
    },
    ui = {
        browser = nil,
        wrap = true,
        border = not has_colorscheme and "rounded" or "none",
    },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            -- Disable some rtp plugins:
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
}

table.insert(opts, { spec })
lazy.setup(opts, {
    root = root .. "/plugins",
    dev = { path = debug.getinfo(1).source:sub(2, -21) },
})
--: }}}
