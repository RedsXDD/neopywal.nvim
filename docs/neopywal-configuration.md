# 🎨 Configuration

Here's the default configuration for Neopywal, note that there's no need to call `setup()` if you don't want to change the default options and settings.

```lua
require("neopywal").setup({
    -- This option allows to use a custom theme palettes for each Neopywal styles.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-palettes.md`.
    use_palette = {
        dark = "pywal",
        light = "pywal",
    },

    -- Sets the background color of certain highlight groups to be transparent.
    -- Use this when your terminal opacity is < 1.
    -- NOTE: This option is automatically disabled if Neopywal is loaded on Neovide
    -- as it doesn't play well with transparent background colors.
    transparent_background = false,

    -- With this option you can create/overwrite any color.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-colors.md`
    custom_colors = {},

    -- With this option you can overwrite any highlight groups set by the colorscheme.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-highlights.md`
    custom_highlights = {},

    -- Dims the background when another window is focused.
    dim_inactive = true,

    -- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
    terminal_colors = true,

    -- Shows the '~' characters after the end of buffers.
    show_end_of_buffer = false,

    -- Shows the '|' split separator characters.
    -- It's worth noting that this options works better in conjunction with `dim_inactive`.
    show_split_lines = true,

    no_italic = false, -- Force no italic.
    no_bold = false, -- Force no bold.
    no_underline = false, -- Force no underline.
    no_undercurl = false, -- Force no undercurl.
    no_strikethrough = false, -- Force no strikethrough.

    -- Handles the styling of certain highlight groups (see `:h highlight-args`).
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        includes = { "italic" },
        strings = {},
        variables = { "italic" },
        numbers = {},
        booleans = {},
        types = { "italic" },
        operators = {},
    },

    -- Setting this to false disables all default file format highlights.
    -- Useful if you want to enable specific file format options.
    -- NOTE: This option defaults to false when the treesitter plugin module is enabled,
    -- unless it is manually enabled inside the user's `setup()` function.
    default_fileformats = true,

    -- Setting this to false disables all default plugin highlights.
    -- Useful if you want to enable specific plugin options.
    default_plugins = true,

    -- This is the table you should be using in order to enable/disable custom highlights colors of certain file types.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-fileformats.md`
    fileformats = {},

    -- This is the table you should be using in order to enable/disable custom highlights for Neopywal's supported plugins.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-plugins.md`
    plugins = {},
})
```
