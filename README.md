# Neopywal.nvim

Neopywal.nvim is a maintained and modified version of
[pywal.nvim](https://github.com/AlphaTechnolog/pywal.nvim), aiming to support
a transparent background, better colorscheme and more plugins.

Pywal.nvim was a reimplementation of [pywal.vim](https://github.com/dylanaraps/wal.vim), however,
both projects were discontinued and became public archives.


Neopywal.nvim is totally written in lua, with extra plugin support when compared with pywal.nvim.
Lua is a better choice if you use plugins also written in lua like Telescope or
NvimTree that aren't supported by default in wal.vim.

This plugin takes advantage of termguicolors (which was unsupported by wal.vim)
and won't use/declare any `ctermbg` or `ctermfg`.

## Screenshots

![01](./.screenshots/01.png)
![02](./.screenshots/02.png)

## External Plugin Support

- Diff
- Coc
- Ale
- GitGutter
- Nvim-cmp
- Nvim-lspconfig
- Lazy.nvim
- Nvim-treesitter
- Neo-tree
- BufferLine
- Which-key
- Dashboard-nvim
- Alpha-nvim
- Indent-Blankline
- Netrw
- Undotree
- Telescope
- Feline
- Lualine
- Gitsigns
- Indent-BlankLine

As well as many of [mini.nvim](https://github.com/echasnovski/mini.nvim) plugins, such as:
- Mini.indentscope
- Mini.statusline
- Mini.tabline
- Mini.starter
- Mini.cursorword
- Mini.files
- Mini.hipatterns
- Mini.pick

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

> It will set automatically the `vim.opt.termguicolors` to true

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
local present, feline = pcall(require, "feline")

if not present then
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
