# 🎨 Alternative Palettes

This folder contains all the alternative palette files used by the `use_palette` option. It also includes a `templates` directory, which holds all the colorscheme `.json` templates used to generate these palette files with Pywal.

To generate any of the pre-made palette files found in this directory, follow these steps:

1. Copy the contents of the `templates` directory into your Pywal configuration folder under the `colorschemes` directory. For most users, this will be located at `~/.config/wal/colorschemes/`. For [Wallust](https://codeberg.org/explosion-mental/wallust) users, the directory will be `~/.config/wallust/colorschemes/`.

2. Run the following command in your shell:

```sh
$ wal --theme ~/.config/wal/colorschemes/path/to/theme.json

# Or for Wallust users.

$ wallust cs ~/.config/wallust/colorschemes/path/to/theme.json
```

This will generate a new `colors.vim` file under `~/.cache/wal/` containing the desired theme palette. Wallust users should also refer to the Neopywal.nvim [Wallust Setup Guide](https://github.com/RedsXDD/neopywal.nvim/blob/master/docs/neopywal-palettes.md#Pywal-Alternatives)".

To use any of the palettes present in this directory, just take the name of the file for the palette you want to set up, and use the `use_palette` within Neopywal's `setup()` function (for more information about this option look at this [documentation](../../../docs/neopywal-palettes.md)).

```lua
require("neopywal").setup({
    use_palette = "catppuccin-mocha"

    -- or

    use_palette = {
        dark = "catppuccin-mocha"
        light = "tokyonight"
    }
})
```
