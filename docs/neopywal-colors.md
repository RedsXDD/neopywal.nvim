# 🎨 Colors

Neopywal has a dedicated option for customizing colors within the `setup()` function. It is called `custom_colors` and it gives ability to create, modify and overwrite colors by using either simple tables or complete lua functions that can update the colors for either `dark` or `light` theme variants separately or for both of them all at once.

The `custom_colors` option takes three optional parameters, the `all`, `dark` or `light` options which should return a table containing all the color modifications you want to do for each theme variant.
\
The `all` option is a special option that exports it's color customizations to both `dark` and `light` theme variants, while the `dark` and `light` options only export custom configurations to their respective theme variant.

```lua
require("neopywal").setup({
    -- In this configuration,
    -- `mycustomcolor` will be available globally to both theme variants.
    -- `helloworld` will only be available on the dark theme variant.
    -- `nicestuff` will only be available on the light theme variant.
    custom_colors = {
        all = {
            mycustomcolor = "#ff0000"
        },
        dark = {
            helloworld = "#00ff00"
        },
        light = {
            nicestuff = "#0000ff"
        },
    }
})
```

You can overwrite existing colors as well if you want:

```lua
require("neopywal").setup({
    custom_colors = {
        -- Here's an example color template for the catppuccin-mocha colorscheme:
        dark = {
            background = "#1E1E2E",
            foreground = "#CDD6F4",
            cursor = "#CDD6F4",
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

        -- Here's an example color template for the tokyonight colorscheme:
        light = {
            background = "#1A1B26"
            foreground = "#A9B1D6"
            cursor = "#A9B1D6"
            color0 = "#32344A"
            color1 = "#F7768E"
            color2 = "#9ECE6A"
            color3 = "#E0AF68"
            color4 = "#7AA2F7"
            color5 = "#AD8EE6"
            color6 = "#449DAB"
            color7 = "#787C99"
            color8 = "#444B6A"
            color9 = "#FF7A93"
            color10 = "#B9F27C"
            color11 = "#FF9E64"
            color12 = "#7DA6FF"
            color13 = "#BB9AF7"
            color14 = "#0DB9D7"
            color15 = "#ACB0D0"
        },
    }
})
```

You can also use functions to export the color variables you want.
\
The function(s) can take an optional `"C"` parameter, which essentially is a table containing all of Neopywal's builtin color variables.
Here are a few examples:

```lua
require("neopywal").setup({
    custom_colors = function (C)
        return {
            all = { myglobalcolor = C.color1 },
            dark = { mydarkcolor = C.color2 },
            light = { mylightcolor = C.color3 },
        }
    end,
})

-- You can also configure each option to be a function instead of
-- setting the `custom_colors` option itself as one.
require("neopywal").setup({
    -- In this configuration:
    -- The `all` option is set to be a function, therefore it will have access to Neopywal's builtin color table.
    -- With that it will set the `myglobalcolor` variable to be `C.color1` (essentially red in Neopywal's terms).

    -- Note that neither that `dark` and `light` have access to the `C` table as those options haven't been set
    -- as functions, therefore they will have to be configured with hexadecimal values instead.
    custom_colors = {
        all = function (C)
            return {
                myglobalcolor = C.color1
            }
        end,
        dark = { mydarkcolor = "#000000" },
        light = { mylightcolor = "#ffffff" },
    }
})
```

## Importing Colors

Neopywal has a dedicated `get_colors()` function if you want to export all the custom colors into a table in order to use them for configuring other things within your configuration like other plugins for example.

The `get_colors()` takes three optional parameters, `theme_style`, `minimal_palette` and `extra_colors`.

- `theme_style` determines which type of palette variant should be exported, it can be either `dark`, `light` or `nil` which make it export a palette based on the `vim.o.background` option.
- `minimal_palette` makes sure only the core palette variables are exported and nothing else, (aka.: bg, fg, cursor and colors 0-15).
- `extra_colors` functions exactly the same as the `custom_colors` option found in Neopywal's setup function. Any and all of the configuration that you can do on `custom_colors` can be used here.

```lua
---@return NeopywalPalette
---@param theme_style ThemeStyles?
---@param minimal_palette boolean?
---@param extra_colors CustomColorsOption | fun(C: table<ValidColors[]>?): { [string]: string }?
local C = require("neopywal").get_colors(theme_style?, minimal_palette?, extra_colors?)
```

Once the function is called it will export a table similar to the one below.
It is important to take note of two things however:

1. Any colors set by the `extra_colors` parameter will have priority over any colors set by the `custom_colors` option.
2. Some of the colors are defined using some utility functions from the `U` variable, if you want more information about it take a look at [neopywal-utils.md](./neopywal-utils.md).
3. Neopywal follows Pywal's nomenclature for it's color variables. So it is wise to read the comments for the first few color variables on the following table to know their meaning:

```lua
{
    -- These are the main color variables used by Neopywal.
    -- Setting the `minimal_palette` parameter to `true` will only export up to `color15`.

    none = "NONE",             -- Use this if you want transparency in your Neovim's highlight groups.
    background = C.background, -- Main background color.
    foreground = C.foreground, -- Main foreground color.
    cursor = C.cursor,         -- Cursor color (Same as foreground on Neopywal's built-in palettes).
    color0 = C.color0,         -- Black.
    color1 = C.color1,         -- Red.
    color2 = C.color2,         -- Green.
    color3 = C.color3,         -- Yellow.
    color4 = C.color4,         -- Blue.
    color5 = C.color5,         -- Magenta.
    color6 = C.color6,         -- Cyan.
    color7 = C.color7,         -- White.
    color8 = C.color8,         -- Bright black.
    color9 = C.color9,         -- Bright red.
    color10 = C.color10,       -- Bright green.
    color11 = C.color11,       -- Bright yellow.
    color12 = C.color12,       -- Bright blue.
    color13 = C.color13,       -- Bright magenta.
    color14 = C.color14,       -- Bright cyan.
    color15 = C.color15,       -- Bright white.

    -- The following variables are just some misc color variables that are used within Neopywal's source code to
    -- make the colorscheme more consistent, you can edit them on the `custom_colors` option if you want or
    -- you can just export them as they are with the `get_colors()` function for personal use.

    -- Misc:
    dim_bg = U.darken(C.background, 5),
    comment = C.color8,
    cursorline = U.blend(C.background, C.foreground, 0.9),
    directory = C.color4,

    -- Diffs:
    diff_added = C.color2,
    diff_changed = C.color6,
    diff_removed = C.color1,
    diff_untracked = C.color5,

    -- LSP/Diagnostics:
    error = C.color1,
    hint = C.color6,
    info = C.foreground,
    unnecessary = C.color8,
    warn = U.blend(C.color1, C.color3, 0.5),
    ok = C.color2,
    inlay_hints = C.color8,

    -- Variable types:
    variable = C.color4, -- (preferred) any variable.
    constant = C.color3, -- (preferred) any constant
    string = C.foreground, -- a string constant: "this is a string"
    character = C.color3, -- a character constant: 'c', '\n'
    number = C.color5, -- a number constant: 234, 0xff
    boolean = C.color5, -- a boolean constant: TRUE, FALSE
    float = C.color5, -- a floating point constant: 2.3e10
    identifier = U.blend(C.color1, C.color3, 0.5), -- (preferred) any variable name
    func = C.color2, -- function name (also: methods for classes)

    -- Statements:
    statement = C.color1, -- (preferred) any statement
    conditional = C.color1, -- if, then, else, endif, switch, etc.
    loop = C.color1, -- for, do, while, etc.
    label = C.color1, -- case, default, etc.
    exception = C.color1, -- try, catch, throw
    operator = C.color1, -- "sizeof", "+", "*", etc.
    keyword = C.color1, -- any other keyword
    debug = C.color3, -- debugging statements.

    -- Preprocessors:
    preproc = C.color5, -- (preferred) generic Preprocessor
    include = C.color5, -- preprocessor #include
    define = C.color5, -- preprocessor #define
    macro = C.color5, -- same as Define
    precondit = C.color5, -- preprocessor #if, #else, #endif, etc.

    -- Type definitions:
    type = C.color6, -- (preferred) int, long, char, etc.
    structure = C.color6, -- struct, union, enum, etc.
    storageclass = C.color6, -- static, register, volatile, etc.
    typedef = C.color6, -- A typedef

    -- Special:
    special = C.color5, -- (preferred) any special symbol
    secialchar = C.color5, -- special character in a constant
    tag = U.blend(C.color1, C.color3, 0.5), -- you can use CTRL-] on this
    delimiter = C.foreground, -- character that needs attention
    specialcomment = C.color8, -- special things inside a comment
}
```
