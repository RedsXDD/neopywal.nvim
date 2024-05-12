# Neopywal.nvim

**Neopywal.nvim** is an improved and maintained version of [pywal.nvim](https://github.com/AlphaTechnolog/pywal.nvim), which on itself was a updated version of [wal.vim](https://github.com/dylanaraps/wal.vim).

**Neopywal** offers lots of additional features when compared to it's predecessor, such as:

- Enhanced plugin support.
- Improved coloring for a variety of file formats.
- Ability to change default color definitions.
- Ability to change pre-defined highlight groups.

## Screenshots

![01](./.screenshots/01.png)
![02](./.screenshots/02.png)
![03](./.screenshots/03.png)

## Supported plugins:

- [Netrw](https://www.vim.org/scripts/script.php?script_id=1075)
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

As well as many of [mini.nvim](https://github.com/echasnovski/mini.nvim) plugins, such as:

- [Mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [Mini.statusline](https://github.com/echasnovski/mini.statusline)
- [Mini.tabline](https://github.com/echasnovski/mini.tabline)
- [Mini.starter](https://github.com/echasnovski/mini.starter)
- [Mini.cursorword](https://github.com/echasnovski/mini.cursorword)
- [Mini.files](https://github.com/echasnovski/mini.files)
- [Mini.hipatterns](https://github.com/echasnovski/mini.hipatterns)
- [Mini.pick](https://github.com/echasnovski/mini.pick)

## Improved File Formats

- C/C++/C#
- Clojure
- Cmake
- Common lisp
- Css
- Dart
- Diff
- Elixir
- Erlang
- Git commit
- Go
- Haskell
- Help
- Html
- Ini
- Java
- Javascript
- Javascript React
- Json
- Kotlin
- Latex
- Less
- Lua
- Makefile
- Markdown
- Matlab
- ObjectiveC
- Ocaml
- Perl
- Php
- Powershell
- Python
- ReStructuredText
- Ruby
- Rust
- Sass
- Scala
- Shell
- Swift
- Toml
- Typescript
- VimL
- Xml
- Yaml
- Zsh

> Honestly with this alone you could ditch treesitter xd.

## Installation

You can install this plugin with the following plugin managers:

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
    {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,
        opts = {},
    },
})
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
vim.cmd.colorscheme("neopywal")
```

Or with vim script:

```vim
colorscheme neopywal
```

> [!Note]
> The colorscheme will automatically set the `vim.opt.termguicolors` option to true

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

## Configuration

There is no need to call `setup` if you don't want to change the default options and settings.

```lua
require("neopywal").setup({
    default_fileformats = true, -- Setting this to false disables all file format highlights.
    default_plugins = true, -- Setting this to false disables all plugin highlights.
    custom_colors = {},
    custom_highlights = {},
    fileformats = {
        c_cpp = true,
        clojure = true,
        cmake = true,
        git_commit = true,
        c_sharp = true,
        css = true,
        dart = true,
        diff = true,
        elixir = true,
        erlang = true,
        go = true,
        haskell = true,
        help = true,
        html = true,
        ini = true,
        java = true,
        json = true,
        javascript_react = true,
        javascript = true,
        kotlin = true,
        latex = true,
        less = true,
        common_lisp = true,
        lua = true,
        makefile = true,
        markdown = true,
        matlab = true,
        objectivec = true,
        ocaml = true,
        perl = true,
        php = true,
        powershell = true,
        python = true,
        restructuredtext = true,
        ruby = true,
        rust = true,
        sass = true,
        scala = true,
        shell = true,
        swift = true,
        toml = true,
        typescript = true,
        viml = true,
        xml = true,
        yaml = true,
        zsh = true,
    },
    plugins = {
        ale = true,
        alpha = true,
        bufferline = true,
        nvim_cmp = true,
        coc = true,
        dashboard = true,
        git_gutter = true,
        indent_blankline = true,
        lazy = true,
        lspconfig = true,
        neotree = true,
        netrw = true,
        telescope = true,
        treesitter = true,
        undotree = true,
        which_key = true,
        mini = {
            cursorword = true,
            files = true,
            hipatterns = true,
            indentscope = true,
            pick = true,
            starter = true,
            statusline = true,
            tabline = true,
        },
    },
})
```

## Customizing colors

Color definitions can be overwritten using the `custom_colors` option, for example:

```lua
require("neopywal").setup({
    -- Here's a color template for the catppuccin colorscheme:
    custom_colors = {
        background = "#1E1E2E",
        foreground = "#CDD6F4",
        cursor = "#F5E0DC",
        color0 = "#45475A",
        color1 = "#F38BA8",
        color2 = "#A6E3A1",
        color3 = "#F9E2AF",
        color4 = "#89B4FA",
        color5 = "#F5C2E7",
        color6 = "#94E2D5",
        color7 = "#BAC2DE",
        color8 = "#585B70",
        color9 = "#F38BA8",
        color10 = "#A6E3A1",
        color11 = "#F9E2AF",
        color12 = "#89B4FA",
        color13 = "#F5C2E7",
        color14 = "#94E2D5",
        color15 = "#A6ADC8",
    },
})
```

You can also define your own color variables, for example:

```lua
require("neopywal").setup({
    custom_colors = {
        red = "#ff0000"
        green = "#00ff00"
        blue = "#0000ff"
    },
})
```

Custom color variables are gonna be automatically exported with the `get_colors()` function and can used normally just like any other color variable.

## Customizing highlight groups.

Highlight groups can be overwritten using `custom_highlights` option, for example:

```lua
require("neopywal").setup({
    custom_highlights = function (colors)
        return {
            Comment = { fg = colors.color3 }
            TabLineSel = { bg = colors.color5 },
            FloatBorder = { bg = colors.color1 },
            Pmenu = { bg = colors.color6 },
        }
    end
})
```

Neopywal also allows the user to set transparency for highlight groups using either the `transparent` or the `none` color variables, for example:

```lua
require("neopywal").setup({
    custom_highlights = function (colors)
        return {
            Normal = { bg = colors.none }, -- bg = colors.transparent has the same effect.
        }
    end
})
```

This would assign the background property for the `Normal` highlight group the `none` color variable, essentially making the Neovim background transparent.

## Using the get_colors() function to import the colors

If you want to import the colors into a lua dictionary:

```lua
local colors = require("neopywal").get_colors()
```

Then you can apply the colors in a way similar to the one found in `custom_highlights = {}`
E.g:

```lua
local colors = require("neopywal").get_colors()

return {
    color_var1 = { colors.color1 }
    color_var2 = { colors.color2 }
    color_var3 = { colors.color3 }
}
```

## How it works

Pywal automatically generates a file called `colors-wal.vim` in
`~/.cache/wal/colors-wal.vim`, the file contains all the colors that are necessary
to make the colorscheme, it looks like this:

```vim
" Special
let wallpaper  = "/home/user/Pictures/wallpaper.png"
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
Here's a list with the variable names and their meaning:

The theme only reads the file variables and creates a colors dictionary that can be used to generate a theme based on it's colors.
```lua
color0 = Black.
color1 = Red.
color2 = Green.
color3 = Yellow.
color4 = Blue.
color5 = Magenta.
color6 = Cyan.
color7 = Bright white.
color8 = Bright black.
color9 = Bright red.
color10 = Bright green.
color11 = Bright yellow.
color12 = Bright blue.
color13 = Bright magenta.
color14 = Bright cyan.
color15 = Bright white.
```

## Enjoy ⭐

If you like this work you can give it a star :)
