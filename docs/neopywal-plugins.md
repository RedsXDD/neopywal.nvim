# 🎨 Plugins

Neopywal provides theme support for other plugins in the Vim/Neovim ecosystem. Most of them can be configured under the `plugins` table on Neopywal's `setup()` function as it is shown below:

```lua
require("neopywal").setup({
    plugins = {
        alpha = true,
        dashboard = false,
        git_gutter = true,
        indent_blankline = true,
        lazy = true,
        lazygit = true,
        noice = false,
        notify = true,
        nvim_cmp = true,
        mini = {
            hipatterns = true,
            indentscope = {
                enabled = false,
            },
            pick = true,
            starter = true,
        },
    },
})
```

Take note that some plugins have additional configuration options within Neopywal's main `plugin` table, here's an example.

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            hipatterns = {
                enabled = true,
                style = {
                    fixme = { "bold", "italic" },
                    hack = { "bold", "italic" },
                    note = { "bold", "italic" },
                    todo = { "bold", "italic" },
                }
            }
        }
    }
})
```

If you don't want to change any of the default configurations for a certain plugin, you can easily set the plugin to `true` instead of passing a table of options to it, this will make it so Neopywal loads all the default configuration values for said plugin module.

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            -- Note that the same plugin from before has been set to `true` instead of being set
            -- as a table of configuration options, therefore Neopywal will still load this plugin
            -- but use it's default configuration values instead.
            hipatterns = true
        }
    }
})
```

Some other plugins cannot be configured directly from Neopywal's `setup()` function. Instead those plugins have their own `setup()` functions where you can tweak their configuration options.
And here's an example of a plugin configuration made from an external `setup()` function not related to the `plugins` table on Neopywal's own `setup()` function.

```lua
-- Note that you can call `require()` directly instead of wrapping it around the `pcall()` function.
-- However using `pcall()` is generally a safer approach as it can prevent Neovim from erring out
-- if Neopywal could not be loaded for X reason.

local has_lualine, lualine = pcall(require, "lualine")
if not has_lualine then return end

local has_neopywal, neopywal_lualine = pcall(require, "neopywal.theme.plugins.lualine")
if not has_neopywal then return end

-- You would put Neopywal's configuration for lualine inside this `setup()` function instead.
neopywal_lualine.setup({
    mode_colors = { normal = "color2" },
})

lualine.setup({
    options = {
        theme = "neopywal"
        -- The rest of your lualine config ...
    }
})
```

## Defaults

Some plugins are enabled by default, you can see which ones are or aren't enabled by default by looking at the default plugin's configuration on the right side of the support plugins table.
Here's an example:

<!-- panvimdoc-ignore-start -->
<table>
<tr>
<td> <b>Plugin</b> </td> <td> <b>Default configuration</b> </td>
</tr>
<!-- panvimdoc-ignore-end -->

<tr>
<td> <a href="https://github.com/gbprod/yanky.nvim">yanky.nvim</a> </td>
<td>

```lua
-- Here's the default configuration for yanky.nvim for example.
-- You can see that by default the plugin is disabled.
require("neopywal").setup({
    plugins = {
        yanky = false
    }
})
```

<!-- panvimdoc-ignore-start -->
</td>
</tr>

</table>
<!-- panvimdoc-ignore-end -->

If you want tot disable all the plugins that are enabled by default by Neopywal, you can set the `default_plugins` option to false to disable all of them.

```lua
require("neopywal").setup({
    default_plugins = false,
})
```

Below is a list of supported plugins and their corresponding configuration module.

<!-- Plugins -->

<!-- panvimdoc-ignore-start -->
<table>
<tr>
<td> <b>Plugin</b> </td> <td> <b>Default configuration</b> </td>
</tr>
<!-- panvimdoc-ignore-end -->

<!-- aerial.nvim {{{ -->
<tr>
<td> <a href="https://github.com/stevearc/aerial.nvim">aerial.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        aerial = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- ale {{{ -->
<tr>
<td> <a href="https://github.com/dense-analysis/ale">ale</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        ale = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- alpha-nvim {{{ -->
<tr>
<td> <a href="https://github.com/goolord/alpha-nvim">alpha-nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        alpha = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- barbar.nvim {{{ -->
<tr>
<td> <a href="https://github.com/romgrk/barbar.nvim">barbar.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        barbar = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- barbecue.nvim {{{ -->
<tr>
<td> <a href="https://github.com/utilyre/barbecue.nvim">barbecue.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Barbecue config to use the Neopywal theme:

```lua
local has_barbecue, barbecue = pcall(require, "barbecue")
if not has_barbecue then return end

local has_neopywal, neopywal_barbecue = pcall(require, "neopywal.theme.plugins.barbecue")
if not has_neopywal then return end

neopywal_barbecue.setup()

barbecue.setup({
    theme = "neopywal"
    -- The rest of your barbecue config ...
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change style settings and any of groups from the Neopywal theme.

```lua
local neopywal_barbecue = require("neopywal.theme.plugins.barbecue")

neopywal_barbecue.setup({
    dim_background = false, -- Whether to dim the background.
    dim_context = true, -- Whether the context should be dimmed.
    dim_dirname = true, -- Whether the directory name should be dimmed.
    hide_separator = false, -- Whether to hide the separator character.
    basename_style = { "bold", "italic" },
    context_style = {},
    dirname_style = {},

    -- With this option you can overwrite any of the groups from the builtin theme.
    -- For more information take a look at `:h barbecue-recipes` and at
    -- `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-highlights.md`
    -- as this option works exactly the same as `custom_highlights`.
    theme = {},
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- beacon.nvim {{{ -->
<tr>
<td> <a href="https://github.com/DanilaMihailov/beacon.nvim">beacon.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        beacon = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- blink.cmp {{{ -->
<tr>
<td> <a href="https://github.com/Saghen/blink.cmp">blink.cmp</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        blink_cmp = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- bufferline.nvim {{{ -->
<tr>
<td> <a href="https://github.com/akinsho/bufferline.nvim">bufferline.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your bufferline config to use the Neopywal highlights:

> [!Note]
> Bufferline needs to be loaded AFTER setting up Neopywal or it will highlight incorrectly.

<summary>Configuration for <a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a> users:</summary>

```lua
use "akinsho/bufferline.nvim" {
  after = "neopywal",
  config = function()
    require("bufferline").setup({
      highlights = require("neopywal.theme.plugins.bufferline").setup()
    })
  end
}
```

<summary>Configuration for <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a> users:</summary>

```lua
{
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000, -- Neopywal loads first because it has higher priority.
},
{
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            highlights = require("neopywal.theme.plugins.bufferline").setup()
        })
    end
}
```

Overwriting highlights can be done inside the setup() function, see `:h bufferline-highlights` for detailed explanations:

```lua
local C = require("neopywal").get_colors()

bufferline.setup({
    highlights = require("neopywal.theme.plugins.bufferline").setup({
        fill = { bg = C.color1 },
        background = { fg = "#00ff00" },
    })
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- coc.nvim {{{ -->
<tr>
<td> <a href="https://github.com/neoclide/coc.nvim">coc.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugings = {
        coc = false
    }
})
```

Setting `enabled` to `true` will also enable the LSP plugin.

```lua
require("neopywal").setup({
    plugins = {
        lsp = true,
    }
})
```

> [!Note]
> coc.nvim by default links to the native LSP highlight groups so the configuration from the `lsp` option will also apply to coc.

</td>
</tr>
<!-- }}} -->
<!-- colorful-winsep.nvim {{{ -->
<tr>
<td> <a href="https://github.com/nvim-zh/colorful-winsep.nvim">colorful-winsep.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        colorful_winsep = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- dashboard-nvim {{{ -->
<tr>
<td> <a href="https://github.com/glepnir/dashboard-nvim">dashboard-nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        dashboard = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- diffview.nvim {{{ -->
<tr>
<td> <a href="https://github.com/sindrets/diffview.nvim">diffview.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        diffview = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- dropbar.nvim {{{ -->
<tr>
<td> <a href="https://github.com/Bekaboo/dropbar.nvim">dropbar.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        dropbar = {
            enabled = false,
            colored_text = false, -- Whether to add color for kind's texts.
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- feline.nvim {{{ -->
<tr>
<td> <a href="https://github.com/freddiehaddad/feline.nvim/">feline.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Feline config to use the Neopywal components:

```lua
local has_feline, feline = pcall(require, "feline")
if not has_feline then return end

local has_neopywal, neopywal_feline = pcall(require, "neopywal.theme.plugins.feline")
if not has_neopywal then return end

neopywal_feline.setup()

feline.setup({
    components = neopywal_feline.get(),
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change assets, settings and the colors per vim mode.

Here are the defaults:

```lua
local C = require("neopywal").get_colors()
local U = require("neopywal.utils.color")

local neopywal_feline = require("neopywal.theme.plugins.feline")

neopywal_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "󰉋",
        file = "󰈙",
        lsp = {
            server = "󰅡",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    mode_colors = {
        ["n"] = { "NORMAL", C.color4 },
        ["no"] = { "N-PENDING", C.color4 },
        ["i"] = { "INSERT", C.color6 },
        ["ic"] = { "INSERT", C.color6 },
        ["t"] = { "TERMINAL", C.color3 },
        ["v"] = { "VISUAL", C.color5 },
        ["V"] = { "V-LINE", C.color5 },
        [""] = { "V-BLOCK", C.color5 },
        ["R"] = { "REPLACE", C.color2 },
        ["Rv"] = { "V-REPLACE", C.color2 },
        ["s"] = { "SELECT", U.blend(C.color1, C.color3, 0.5) },
        ["S"] = { "S-LINE", U.blend(C.color1, C.color3, 0.5) },
        [""] = { "S-BLOCK", U.blend(C.color1, C.color3, 0.5) },
        ["c"] = { "COMMAND", C.color1 },
        ["cv"] = { "COMMAND", C.color1 },
        ["ce"] = { "COMMAND", C.color1 },
        ["r"] = { "PROMPT", C.foreground },
        ["rm"] = { "MORE", C.foreground },
        ["r?"] = { "CONFIRM", C.color2 },
        ["!"] = { "SHELL", C.color1 },
    },
    sett = {
        text = C.foreground,
        bkg = U.blend(C.color8, C.background, 0.3),
        diffs = U.blend(C.color8, C.background, 0.5),
        extras = C.foreground,
        curr_file = U.blend(C.color8, C.background, 0.5),
        curr_dir = C.color4,
        show_modified = false, -- Show if the file has been modified.

        -- Show the count of updatable plugins from lazy.nvim.
        -- Need to set checker.enabled = true in lazy.nvim first
        -- the icon is set in ui.icons.plugin in lazy.nvim.
        show_lazy_updates = false,
    },
    view = {
        lsp = {
            progress = true, -- If true the status bar will display an lsp progress indicator.
            name = false, -- If true the status bar will display the lsp servers name, otherwise it will display the text "Lsp".
            exclude_lsp_names = {}, -- Lsp server names that should not be displayed when name is set to true.
            separator = "|", -- The separator used when there are multiple lsp servers.
        },
    },
})
```

> [!Warning]
> Currently feline [doesn't officially support custom themes](https://github.com/feline-nvim/feline.nvim/issues/302).
> In order for `:colorscheme neopywal` to work you could add this autocmd as a workaround:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["neopywal.theme.plugins.feline"] = nil
        require("feline").setup({
            components = require("neopywal.theme.plugins.feline").get(),
        })
    end,
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- fern.vim {{{ -->
<tr>
<td> <a href="https://github.com/lambdalisue/fern.vim">fern.vim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        fern = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- fidget.nvim {{{ -->
<tr>
<td> <a href="https://github.com/j-hui/fidget.nvim">fidget.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Fidget config to use Neopywal's highlight groups.

```lua
local has_fidget, fidget = pcall(require, "fidget")
if not has_fidget then return end

local has_neopywal, neopywal_fidget = pcall(require, "neopywal.theme.plugins.fidget")
if not has_neopywal then return end

-- This is what loads the highlight groups that are used inside Fidget's setup function.
neopywal_fidget.setup()

fidget.setup({
    progress = {
        display = {
            done_style = "FidgetDone",
            progress_style = "FigdetProgress",
            group_style = "FidgetGroup",
            icon_style = "FidgetIcon",
        },
    },
    notification = {
        view = {
            group_separator_hl = "FidgetSeparator",
        },
        window = {
            normal_hl = "FidgetNormal",

            -- You can use this option to adjust the background color opacity for the notification window.
            -- But it's recommended set this to "0" if you don't plan on changing any of the custom highlight groups.
            winblend = 0,
        },
    },
    -- The rest of your fidget config ...
})
```

Overriding highlight groups can be done inside the setup() function.

```lua
local neopywal_fidget = require("neopywal.theme.plugins.fidget")

local C = require("neopywal").get_colors()
local bg = require("neopywal.lib.config").options.transparent_background and C.none or C.dim_bg

neopywal_fidget.setup({
    FidgetDone = { bg = bg, fg = C.ok, styles = { "bold", "italic" } },
    FidgetGroup = { bg = bg, fg = C.foreground, styles = { "bold", "italic" } },
    FidgetIcon = { bg = bg, fg = C.color4, styles = { "bold", "italic" } },
    FidgetNormal = { bg = bg, fg = C.comment, styles = { "bold", "italic" } },
    FidgetProgress = { bg = bg, fg = C.color3, styles = { "bold", "italic" } },
    FidgetSeparator = { bg = bg, fg = C.comment, styles = { "bold", "italic" } },
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- flash.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/flash.nvim">flash.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        flash = {
            enabled = true,
            style = { "bold", "italic" }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- fzf-lua {{{ -->
<tr>
<td> <a href="https://github.com/ibhagwan/fzf-lua">fzf-lua</a> </td>
<td>

```lua
require("neopywal").setup({
    require("neopywal").setup({
        plugins = {
            plugins = {
                fzf = false
            }
        })
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- gitsigns.nvim {{{ -->
<tr>
<td> <a href="https://github.com/lewis6991/gitsigns.nvim">gitsigns.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        gitsigns = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- grug-far.nvim {{{ -->
<tr>
<td> <a href="https://github.com/MagicDuck/grug-far.nvim">grug-far.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        grug_far = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- harpoon {{{ -->
<tr>
<td> <a href="https://github.com/ThePrimeagen/harpoon">harpoon</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        harpoon = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- headlines.nvim {{{ -->
<tr>
<td> <a href="https://github.com/lukas-reineke/headlines.nvim">headlines.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        headlines = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- hop.nvim {{{ -->
<tr>
<td> <a href="https://github.com/phaazon/hop.nvim">hop.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        hop = {
            enabled = false,
            style = { "bold", "italic" }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- indent-blankline.nvim {{{ -->
<tr>
<td> <a href="https://github.com/lukas-reineke/indent-blankline.nvim">indent-blankline.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            scope_color = "",
        }
    }
})
```

`colored_indent_levels` enables character highlights per indent level.
Follow the instructions [here](https://github.com/lukas-reineke/indent-blankline.nvim#multiple-indent-colors) to set the latter up.

</td>
</tr>
<!-- }}} -->
<!-- indentmini.nvim {{{ -->
<tr>
<td> <a href="https://github.com/nvimdev/indentmini.nvim">indentmini.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        indentmini = {
            enabled = false,

            -- These options either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            scope_color = "",
            current_scope_color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- lazy.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        lazy = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- lazygit.nvim {{{ -->
<tr>
<td> <a href="https://github.com/kdheepak/lazygit.nvim">lazygit.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        lazygit = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- leap.nvim {{{ -->
<tr>
<td> <a href="https://github.com/ggandor/leap.nvim">leap.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        leap = {
            enabled = false,
            style = { "bold", "italic" }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- lightline.vim {{{ -->
<tr>
<td> <a href="https://github.com/itchyny/lightline.vim">lightline.vim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Lightline config to use the Neopywal theme:

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local has_neopywal, neopywal_lightline = pcall(require, "neopywal.theme.plugins.lightline")
    if not has_neopywal then return end

    neopywal_lightline.setup()
EOF

let g:lightline = {'colorscheme': 'neopywal'}
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change the colors per vim mode.

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local neopywal_lightline = require("neopywal.theme.plugins.lightline")

    neopywal_lightline.setup({
        -- Any of the color values can either be:
        --   - A color exported by "get_colors()" (e.g.: `color8`)
        --   - A hexadecimal color (e.g.: "#ff0000").
        --   - A function with an optional "C" parameter that returns one of the two options above.
        --     e.g: function(C) return C.color1 end
        mode_colors = {
            normal = "color4",
            visual = "color5",
            insert = "color6",
            command = "color1",
            replace = "color2",
            terminal = "color3",
        }
    })
EOF
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- lir.nvim {{{ -->
<tr>
<td> <a href="https://github.com/tamago324/lir.nvim">lir.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        lir = {
            enabled = false,
            git_status = false,
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- lspsaga.nvim {{{ -->
<tr>
<td> <a href="https://github.com/glepnir/lspsaga.nvim">lspsaga.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugings = {
        lspsaga = {
            enabled = false,
            dim_folder = true, -- Whether to dim the folder name on the winbar.
            dim_filename = true, -- Whether to dim the filename on the winbar.
            dim_separator = true, -- Whether to dim the separator character on the winbar.
            winbar_style = { "bold" },
        }
    }
})
```

For custom LSP kind icons and color:

```lua
require("lspsaga").setup({
    ui = {
        kind = require("neopywal.theme.plugins.lspsaga").get_kinds(),
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- lualine.nvim {{{ -->
<tr>
<td> <a href="https://github.com/nvim-lualine/lualine.nvim">lualine.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Lualine config to use the Neopywal theme:

```lua
local has_lualine, lualine = pcall(require, "lualine")
if not has_lualine then return end

local has_neopywal, neopywal_lualine = pcall(require, "neopywal.theme.plugins.lualine")
if not has_neopywal then return end

neopywal_lualine.setup()

lualine.setup({
    options = {
        theme = "neopywal"
        -- The rest of your lualine config ...
    }
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change style settings and the colors per vim mode.

```lua
local neopywal_lualine = require("neopywal.theme.plugins.lualine")

neopywal_lualine.setup({
    -- Any of the color values can either be:
    --   - A color exported by "get_colors()" (e.g.: `color8`)
    --   - A hexadecimal color (e.g.: "#ff0000").
    --   - A function with an optional "C" parameter that returns one of the two options above.
    --     e.g: function(C) return C.color1 end
    mode_colors = {
        normal = "color4",
        visual = "color5",
        insert = "color6",
        command = "color1",
        replace = "color2",
        terminal = "color3",
    },
    styles = {
        a = { "bold" },
        b = { "bold" },
        c = { "bold" },
        x = { "bold" },
        y = { "bold" },
        z = { "bold" },
    },
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- markdown.nvim {{{ -->
<tr>
<td> <a href="https://github.com/MeanderingProgrammer/markdown.nvim">markdown.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        markdown = false,
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mason.nvim {{{ -->
<tr>
<td> <a href="https://github.com/williamboman/mason.nvim">mason.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mason = true,
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.nvim {{{ -->
<!-- panvimdoc-ignore-start -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.nvim">mini.nvim</a> </td>
<td>

<details> <summary>Special</summary>

<table>
<tr>
<td> <b>Plugin</b> </td> <td> <b>Default</b> </td>
</tr>
<!-- panvimdoc-ignore-end -->

<!-- mini.animate {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.animate">mini.animate</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            animate = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.clue {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.clue">mini.clue</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            clue = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.completion {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.completion">mini.completion</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            completion = {
                enabled = true,
                parameter_style = { "underline" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.cursorword {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.cursorword">mini.cursorword</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            cursorword = {
                enabled = true,
                style = { "underline" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.deps {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.deps">mini.deps</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            deps = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.diff {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.diff">mini.diff</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            diff = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.files {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.files">mini.files</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            files = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.hipatterns {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.hipatterns">mini.hipatterns</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            hipatterns = {
                enabled = true,
                style = {
                    fixme = { "bold", "italic" },
                    hack = { "bold", "italic" },
                    note = { "bold", "italic" },
                    todo = { "bold", "italic" },
                }
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.icons {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.icons">mini.icons</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            icons = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.indentscope {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.indentscope">mini.indentscope</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            indentscope = {
                enabled = true,

                -- Can either be:
                --   - A color exported by "get_colors()" (e.g.: `color8`)
                --   - A hexadecimal color (e.g.: "#ff0000").
                --   - A function with an optional "C" parameter that returns one of the two options above.
                --     e.g: function(C) return C.color1 end
                scope_color = "",
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.jump {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.jump">mini.jump</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            jump = {
                enabled = true,
                style = { "bold", "italic" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.jump2d {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.jump2d">mini.jump2d</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            jump2d = {
                enabled = true,
                style = { "bold", "italic" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.map {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.map">mini.map</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            map = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.notify {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.notify">mini.notify</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            notify = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.operators {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.operators">mini.operators</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            operators = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.pick {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.pick">mini.pick</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            pick = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.snippets {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.snippets">mini.snippets</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            snippets = {
                enabled = true,
                style = { "underdouble" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.starter {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.starter">mini.starter</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            starter = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.statusline {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.statusline">mini.statusline</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            statusline = {
                enabled = true,

                -- Any of the color values can either be:
                --   - A color exported by "get_colors()" (e.g.: `color8`)
                --   - A hexadecimal color (e.g.: "#ff0000").
                --   - A function with an optional "C" parameter that returns one of the two options above.
                --     e.g: function(C) return C.color1 end
                mode_colors = {
                    normal = "color4",
                    visual = "color5",
                    insert = "color6",
                    command = "color1",
                    replace = "color2",
                    other = "color3", -- e.g.: terminal.
                }
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.surround {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.surround">mini.surround</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            surround = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.tabline {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.tabline">mini.tabline</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            tabline = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.test {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.test">mini.test</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            test = true
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- mini.trailspace {{{ -->
<tr>
<td> <a href="https://github.com/echasnovski/mini.trailspace">mini.trailspace</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        mini = {
            trailspace = {
                enabled = true,

                -- Can either be:
                --   - A color exported by "get_colors()" (e.g.: `color8`)
                --   - A hexadecimal color (e.g.: "#ff0000").
                --   - A function with an optional "C" parameter that returns one of the two options above.
                --     e.g: function(C) return C.color1 end
                color = "",
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->

</table>

</details>

</td>
</tr>
<!-- }}} -->
<!-- neogit {{{ -->
<tr>
<td> <a href="https://github.com/TimUntersberger/neogit">neogit</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        neogit = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- neotest {{{ -->
<tr>
<td> <a href="https://github.com/nvim-neotest/neotest">neotest</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        neotest = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- neo-tree.nvim {{{ -->
<tr>
<td> <a href="https://github.com/nvim-neo-tree/neo-tree.nvim">neo-tree.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        neotree = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- netrw {{{ -->
<tr>
<td> <a href="https://www.vim.org/scripts/script.php?script_id=1075">netrw</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        netrw = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- noice.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/noice.nvim">noice.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        noice = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- NormalNvim {{{ -->
<tr>
<td> <a href="https://github.com/NormalNvim/NormalNvim">NormalNvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        NormalNvim = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- notifier.nvim {{{ -->
<tr>
<td> <a href="https://github.com/vigoux/notifier.nvim">notifier.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        notifier = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-cmp {{{ -->
<tr>
<td> <a href="https://github.com/hrsh7th/nvim-cmp">nvim-cmp</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        nvim_cmp = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-dap {{{ -->
<tr>
<td> <a href="https://github.com/mfussenegger/nvim-dap">nvim-dap</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        dap = false
    }
})
```

<details> <summary>Special</a> </summary>

```lua
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
```

</details>

</td>
</tr>
<!-- }}} -->
<!-- nvim-dap-ui {{{ -->
<tr>
<td> <a href="https://github.com/rcarriga/nvim-dap-ui">nvim-dap-ui</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        dap_ui = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-lspconfig {{{ -->
<tr>
<td> <a href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        lsp = {
            enabled = true,
            virtual_text = {
                errors = { "bold", "italic" },
                hints = { "bold", "italic" },
                information = { "bold", "italic" },
                ok = { "bold", "italic" },
                warnings = { "bold", "italic" },
                unnecessary = { "bold", "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                information = { "undercurl" },
                ok = { "undercurl" },
                warnings = { "undercurl" },
            },
            inlay_hints = {
                background = true,
                style = { "bold", "italic" },
            }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-navbuddy {{{ -->
<tr>
<td> <a href="https://github.com/SmiteshP/nvim-navbuddy">nvim-navbuddy</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        navbuddy = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-navic {{{ -->
<tr>
<td> <a href="https://github.com/SmiteshP/nvim-navic">nvim-navic</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        navic = {
            enabled = false,
            dim_text = false, -- Whether the text should be dimmed.
            hide_separator = false, -- Whether to hide the separator character.
            text_style = { "bold", "italic" },

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            bg_color = "",
        }
    }
})
```

<details> <summary>Special</summary>

```lua
-- You NEED to enable highlight in nvim-navic setting or it won't work.
require("nvim-navic").setup({ highlight = true })
```

If you want to make background color similar to what's used on lualine/feline you can do the following:

```lua
require("neopywal").setup({
    plugins = {
        navic = {
            bg_color = function(C)
                local U = require("neopywal.utils.color")

                -- `0.5` would match the color used on lualine's "b" section.
                return U.blend(C.color8, C.background, 0.3)
            end
        }
    }
})
```

</details>

</td>
</tr>
<!-- }}} -->
<!-- nvim-notify {{{ -->
<tr>
<td> <a href="https://github.com/rcarriga/nvim-notify">nvim-notify</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        notify = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-scrollbar {{{ -->
<tr>
<td> <a href="https://github.com/petertriho/nvim-scrollbar">nvim-scrollbar</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        scrollbar = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-tree.lua {{{ -->
<tr>
<td> <a href="https://github.com/kyazdani42/nvim-tree.lua">nvim-tree.lua</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        nvimtree = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-surround {{{ -->
<tr>
<td> <a href="https://github.com/kylechui/nvim-surround">nvim-surround</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        surround = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-treesitter {{{ -->
<tr>
<td> <a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        treesitter = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-treesitter-context {{{ -->
<tr>
<td> <a href="https://github.com/nvim-treesitter/nvim-treesitter-context">nvim-treesitter-context</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        ts_context = {
            enabled = true,
            dim_background = false,

            -- NOTE: This option only applies to the current context line.
            -- You may want to disable "underline" if you configured the "separator" option within ts_context.
            style = { "bold", "underline" },
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-ts-rainbow {{{ -->
<tr>
<td> <a href="https://github.com/p00f/nvim-ts-rainbow">nvim-ts-rainbow</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        ts_rainbow = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-ts-rainbow2 {{{ -->
<tr>
<td> <a href="https://github.com/HiPhish/nvim-ts-rainbow2">nvim-ts-rainbow2</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        ts_rainbow2 = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-ufo {{{ -->
<tr>
<td> <a href="https://github.com/kevinhwang91/nvim-ufo">nvim-ufo</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        ufo = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- nvim-window-picker {{{ -->
<tr>
<td> <a href="https://github.com/s1n7ax/nvim-window-picker">nvim-window-picker</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        window_picker = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- octo.nvim {{{ -->
<tr>
<td> <a href="https://github.com/pwntester/octo.nvim">octo.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        octo = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- overseer.nvim {{{ -->
<tr>
<td> <a href="https://github.com/stevearc/overseer.nvim">overseer.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        overseer = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- pounce.nvim {{{ -->
<tr>
<td> <a href="https://github.com/rlane/pounce.nvim">pounce.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        pounce = {
            enabled = false,
            style = { "bold", "italic" }
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- rainbow-delimiters.nvim {{{ -->
<tr>
<td> <a href="https://github.com/HiPhish/rainbow-delimiters.nvim">rainbow-delimiters.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        rainbow = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- reactive.nvim {{{ -->
<tr>
<td> <a href="https://github.com/rasulomaroff/reactive.nvim">reactive.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your Reactive config to use the Neopywal theme:

```lua
local has_reactive, reactive = pcall(require, "reactive")
if not has_reactive then return end

local has_neopywal, neopywal_reactive = pcall(require, "neopywal.theme.plugins.reactive")
if not has_neopywal then return end

neopywal_reactive.setup()

reactive.setup({
    -- Note that there are 2 available presets, `cursor` and `cursorline`.
    load = { "neopywal-cursor", "neopywal-cursorline" }
    -- The rest of your reactive config ...
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change the color settings per vim mode.

```lua
local neopywal_reactive = require("neopywal.theme.plugins.reactive")

neopywal_reactive.setup({
    -- A higher percentage means more vibrant mode colors,
    -- where "1" means to use "exactly" the mode color without any color transparency.
    color_percentage = 0.3,

    -- Any of the color values can either be:
    --   - A color exported by "get_colors()" (e.g.: `color8`)
    --   - A hexadecimal color (e.g.: "#ff0000").
    --   - A function with an optional "C" parameter that returns one of the two options above.
    --     e.g: function(C) return C.color1 end
    mode_colors = {
        visual = "color5",
        insert = "color6",
        replace = "color2",

        -- Normal mode operations.
        change = "color2",
        delete = "color1",
        pending = "color4",
        yank = "color3",
    }
})
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- snacks.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/snacks.nvim">snacks.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        snacks = {
            enabled = false,

            -- These options either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            scope_color = "",
            current_scope_color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- symbols-outline.nvim {{{ -->
<tr>
<td> <a href="https://github.com/simrat39/symbols-outline.nvim">symbols-outline.nvim</a> </td>
<td>

> [!NOTE]
> This plugin has been archived by the author, consider using [outline.nvim](https://github.com/hedyhli/outline.nvim)

```lua
require("neopywal").setup({
    plugins = {
        symbols_outline = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- telekasten.nvim {{{ -->
<tr>
<td> <a href="https://github.com/renerocksai/telekasten.nvim">telekasten.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        telekasten = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- telescope.nvim {{{ -->
<tr>
<td> <a href="https://github.com/nvim-telescope/telescope.nvim">telescope.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        telescope = {
            enabled = true,
            -- style = "nvchad"
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- trouble.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/trouble.nvim">trouble.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        trouble = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- undotree {{{ -->
<tr>
<td> <a href="https://github.com/jiaoshijie/undotree">undotree</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        undotree = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vimwiki {{{ -->
<tr>
<td> <a href="https://github.com/vimwiki/vimwiki">vimwiki</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        vimwiki = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-dadbod-ui {{{ -->
<tr>
<td> <a href="https://github.com/kristijanhusak/vim-dadbod-ui">vim-dadbod-ui</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        dadbod_ui = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-airline {{{ -->
<tr>
<td> <a href="https://github.com/vim-airline/vim-airline">vim-airline</a> </td>
<td>

<details> <summary>Special</summary>

Update your Airline config to use the Neopywal theme:

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local has_neopywal, neopywal_airline = pcall(require, "neopywal.theme.plugins.airline")
    if not has_neopywal then return end

    neopywal_airline.setup()
EOF

let g:airline_theme = 'neopywal'
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change style settings and the colors per vim mode.

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local neopywal_airline = require("neopywal.theme.plugins.airline")

    neopywal_airline.setup({
        -- Any of the color values can either be:
        --   - A color exported by "get_colors()" (e.g.: `color8`)
        --   - A hexadecimal color (e.g.: "#ff0000").
        --   - A function with an optional "C" parameter that returns one of the two options above.
        --     e.g: function(C) return C.color1 end
        mode_colors = {
            normal = "color4",
            visual = "color5",
            insert = "color6",
            commandline = "color1",
            replace = "color2",
            terminal = "color3",
        },

        -- This is the same as `mode_colors` except it uses cterm numbers instead (see `:h cterm`)
        -- e.g.: "normal = 4" means "ctermfg=4".
        cterm_colors = {
            normal = 4,
            visual = 5,
            insert = 6,
            commandline = 1,
            replace = 2,
            terminal = 3,
        },
        styles = {
            a = { "bold" },
            b = { "bold" },
            c = { "bold" },
            x = { "bold" },
            y = { "bold" },
            z = { "bold" },
        },
    })
EOF
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- vim-clap {{{ -->
<tr>
<td> <a href="https://github.com/liuchengxu/vim-clap">vim-clap</a> </td>
<td>

<details> <summary>Special</summary>

Update your Clap config to use the Neopywal theme:

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local has_neopywal, neopywal_clap = pcall(require, "neopywal.theme.plugins.clap")
    if not has_neopywal then return end

    neopywal_clap.setup()
EOF

let g:clap_theme = 'neopywal'
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change style settings and the text colors.

```vim
" Notice that the 'lua' block is necessary if you're configuring Lightline with vim-script.

lua << EOF
    local neopywal_clap = require("neopywal.theme.plugins.clap")

    neopywal_clap.setup({
        -- Any of the color values can either be:
        --   - A color exported by "get_colors()" (e.g.: `color8`)
        --   - A hexadecimal color (e.g.: "#ff0000").
        --   - A function with an optional "C" parameter that returns one of the two options above.
        --     e.g: function(C) return C.color1 end
        colors = {
            indicator = "color8", -- The text for the number of matches.
            spinner = "color2", -- The text representing the mode.
            selected = "color6", -- The text of the line of a selected item.
            current_selection = "color4", -- The text of the line of the currently selected item.
        },
        styles = {
            indicator = { "italic" }, -- The text for the number of matches.
            spinner = { "bold" }, -- The text representing the mode.
            selected = { "bold", "underline" }, -- The line for a selected item.
            current_selection = { "bold" }, -- The line for the currently selected item.
        },
    })
EOF
```

</details>
</td>
</tr>
<!-- }}} -->
<!-- vim-gitgutter {{{ -->
<tr>
<td> <a href="https://github.com/airblade/vim-gitgutter">vim-gitgutter</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        git_gutter = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-glyph-palette {{{ -->
<tr>
<td> <a href="https://github.com/lambdalisue/vim-glyph-palette">vim-glyph-palette</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        glyph_palette = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-illuminate {{{ -->
<tr>
<td> <a href="https://github.com/RRethy/vim-illuminate">vim-illuminate</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        illuminate = {
            enabled = false,
            lsp = true,
            style = { "bold" },
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-sandwich {{{ -->
<tr>
<td> <a href="https://github.com/machakann/vim-sandwich">vim-sandwich</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        sandwich = false
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- vim-sneak {{{ -->
<tr>
<td> <a href="https://github.com/justinmk/vim-sneak">vim-sneak</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        sneak = {
            enabled = false,
            style = { "bold", "italic" },

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            sneak_color = "",
        }
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- which-key.nvim {{{ -->
<tr>
<td> <a href="https://github.com/folke/which-key.nvim">which-key.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        which_key = true
    }
})
```

</td>
</tr>
<!-- }}} -->
<!-- yanky.nvim {{{ -->
<tr>
<td> <a href="https://github.com/gbprod/yanky.nvim">yanky.nvim</a> </td>
<td>

```lua
require("neopywal").setup({
    plugins = {
        yanky = false
    }
})
```

</td>
</tr>
<!-- }}} -->

</table>
