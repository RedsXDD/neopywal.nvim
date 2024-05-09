# Neopywal.nvim

**Neopywal.nvim** is a maintained and enhanced iteration of [pywal.nvim](https://github.com/AlphaTechnolog/pywal.nvim), designed to offer support for transparent backgrounds, a refined colorscheme, and an expanded range of supported plugins.

**Pywal.nvim** was initially inspired by [pywal.vim](https://github.com/dylanaraps/wal.vim), however both projects eventually ceased active development and became public archives.

**Neopywal.nvim** distinguishes itself by being written entirely in Lua, was well as offering extended plugin compatibility compared to its predecessor. This Lua foundation allows the use of plugins such as Telescope or NvimTree, which are exclusively written in Lua and lack native support in wal.vim.

Key Features:
- Written exclusively in Lua
- Enhanced plugin support
- Utilizes termguicolors for color rendering, a feature absent in wal.vim
- Does not use any `ctermbg` or `ctermfg` declarations

## Screenshots

![01](./.screenshots/01.png)
![02](./.screenshots/02.png)

## Plugin Support

- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Coc](https://github.com/neoclide/coc.nvim)
- [Ale](https://github.com/dense-analysis/ale)
- [GitGutter](https://github.com/airblade/vim-gitgutter)
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [BufferLine](https://github.com/akinsho/bufferline.nvim)
- [Which-key](https://github.com/folke/which-key.nvim)
- [Dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [Alpha-nvim](https://github.com/goolord/alpha-nvim)
- [Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Undotree](https://github.com/mbbill/undotree)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Feline](https://github.com/freddiehaddad/feline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Netrw](https://github.com/vim.org/netrw)

As well as many of [mini.nvim](https://github.com/echasnovski/mini.nvim) plugins, such as:
- [Mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [Mini.statusline](https://github.com/echasnovski/mini.statusline)
- [Mini.tabline](https://github.com/echasnovski/mini.tabline)
- [Mini.starter](https://github.com/echasnovski/mini.starter)
- [Mini.cursorword](https://github.com/echasnovski/mini.cursorword)
- [Mini.files](https://github.com/echasnovski/mini.files)
- [Mini.hipatterns](https://github.com/echasnovski/mini.hipatterns)
- [Mini.pick](https://github.com/echasnovski/mini.pick)

## Installation

You can install this plugin with the following plugin managers:

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "RedsXDD/neopywal.nvim", as = 'neopywal' }
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'RedsXDD/neopywal.nvim', { 'as': 'neopywal' }
```

## Activate theme

To activate the theme, call this in your neovim config:

```lua
local neopywal = require("neopywal")
neopywal.setup()
```

Or with vim script:

```vim
colorscheme neopywal
```

> NOTE: This will automatically set `vim.opt.termguicolors` to true

## Activating lualine theme

Place this in your lualine config:

```lua
local lualine = require("lualine")

lualine.setup {
  options = {
    theme = "neopywal",
  },
}
```

## Activating the feline theme (untested with Neopywal)

You can put this to your config to activate the feline config:

```lua
local has_feline, feline = pcall(require, "feline")
if not has_feline then
  return
end

local has_neopywal, neopywal = pcall(require, "neopywal.feline")
if not has_neopywal then
  return
end

feline.setup({
  components = neopywal,
})
```

Then you should see the feline bar working successfully.

## Using the core to get the colors

If you want to get the colors into a lua dictionary:

```lua
local neopywal_core = require("neopywal.core")
local colors = neopywal_core.get_colors()
```

## How it works

Pywal automatically generates a file called `colors-wal.vim` in
`~/.cache/wal/colors-wal.vim`, the file contains all the colors that are necessary
to make a Vim/Neovim colorscheme, it looks like this:

```vim
" Special
let wallpaper  = "/home/user/Pictures/catppuccin.png"
let background = "#1E1E2E"
let foreground = "#CDD6F4"
let cursor     = "#F5E0DC"

" Colors
let color0  = "#45475A"
let color1  = "#F38BA8"
let color2  = "#A6E3A1"
let color3  = "#F9E2AF"
let color4  = "#89B4FA"
let color5  = "#F5C2E7"
let color6  = "#94E2D5"
let color7  = "#BAC2DE"
let color8  = "#585B70"
let color9  = "#F38BA8"
let color10 = "#A6E3A1"
let color11 = "#F9E2AF"
let color12 = "#89B4FA"
let color13 = "#F5C2E7"
let color14 = "#94E2D5"
let color15 = "#A6ADC8"
```

The theme only reads the file variables and then it creates a colors dictionary that
can be used to create a theme based in it's colors.

## Enjoy

If you like this work you can give it a star :)
