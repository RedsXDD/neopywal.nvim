# 🎨 Highlight Groups

Neopywal has a dedicated option for customizing highlight groups within the `setup()` function. It is called `custom_highlights` and it gives the ability to create, modify and overwrite highlights by using either simple tables or complete lua functions that can update the highlights for either `dark` or `light` theme variants separately or for both of them all at once.

The `custom_highlights` option takes three optional parameters, the `all`, `dark` or `light` options which should return a table containing all the customized highlight groups you want to do for each theme variant.
\
The `all` option is a special option that exports it's highlight group configurations to both `dark` and `light` theme variants, while the `dark` and `light` options only apply the custom highlights to their respective theme variant.

```lua
require("neopywal").setup({
    -- In this configuration,
    -- `mycustomgroup` will be available globally to both theme variants.
    -- `helloworld` will only be available on the dark theme variant.
    -- `nicestuff` will only be available on the light theme variant.
    custom_highlights = {
        all = {
            mycustomgroup = { bg = "#ff0000" },
        },
        dark = {
            helloworld = { fg = "#00ff00" },
        },
        light = {
            nicestuff = { bg = "#ffffff", fg = "#0000ff" },
        },
    }
})
```

You can overwrite existing groups as well if you want:

```lua
require("neopywal").setup({
    custom_highlights = {
        all = {
            Pmenu = { bg = "#00ffff" },
        },
        dark = {
            Comment = { fg = "#ffff00" }
        },
        light = {
            TabLineSel = { bg = "#ff00ff" },
        },
    }
})
```

You can also use functions to export the customized highlight groups you want.
\
The function(s) can take an optional `"C"` parameter, which essentially is a table containing all of Neopywal's builtin color variables.
Here are a few examples:

```lua
require("neopywal").setup({
    custom_highlights = function (C)
        return {
            all = { myglobalhighlight = { bg = C.color1 } },
            dark = { mydarkhighlight = { fg = C.color2 } },

            -- You can also set a transparent color for highlight groups using the `none` color variable.
            light = { mylighthighlight = { bg = C.none } },
        }
    end,
})

-- You can also configure each option to be a function instead of
-- setting the `custom_highlights` option itself as one.
require("neopywal").setup({
    -- In this configuration:
    -- The `all` option is set to be a function, therefore it will have access to Neopywal's builtin color table.
    -- With that it will set background of the `myglobalhighlight` group to be `C.color1` (essentially red in Neopywal's terms).

    -- Note that neither that `dark` and `light` have access to the `C` table as those options haven't been set
    -- as functions, therefore they will have to be configured with hexadecimal values instead.
    custom_highlights = {
        all = function (C)
            return {
                myglobalhighlight = { bg = C.color1 }
            }
        end,
        dark = { mydarkhighlight = { bg = "#000000" } },
        light = { mylighthighlight = { bg = "#ffffff" } },
    }
})

-- If you want to configure the styling of certain highlight groups you can do so using the `styles` table.
-- For a complete list of available styles, see `:h highlight-args`.
require("neopywal").setup({
    custom_highlights = function (C)
        return {
            all = { Pmenu = { fg = C.color3, styles = { "bold", "underline" } } }
        }
    end
})
```
