# 🎨 Fileformats

Neopywal provides theme support for extra syntax highlighting groups that are not dependent on treesitter. This is useful for users that don't have treesitter installed but still want a somewhat decent looking syntax highlighting.

Some fileformats are enabled by default, you can control this behaviour with the `default_fileformats` option.

```lua
require("neopywal").setup({
    -- NOTE: This option defaults to false when the treesitter plugin module is enabled,
    -- unless it is manually enabled inside the user's `setup()` function.
    default_fileformats = false,
})
```

To enable/disable a supported fileformat you just need to set it to true/false.

```lua
require("neopywal").setup({
    fileformats = {
        c_cpp = true,
        c_sharp = true,
        clojure = false,
        cmake = true,
        common_lisp = false,
        css = true,
        dart = false,
        diff = true,
        elixir = false,
        erlang = false,
        git_commit = true,
        go = true,
        haskell = false,
        help = true,
        html = true,
        ini = false,
        java = false,
        javascript = true,
        javascript_react = false,
        json = true,
        kotlin = false,
        latex = false,
        less = false,
        lua = true,
        makefile = true,
        markdown = true,
        matlab = false,
        objectivec = false,
        ocaml = false,
        perl = false,
        php = true,
        powershell = false,
        python = true,
        restructuredtext = false,
        ruby = false,
        rust = true,
        sass = false,
        scala = false,
        shell = true,
        swift = false,
        toml = true,
        typescript = true,
        viml = true,
        xml = false,
        yaml = true,
        zsh = true,
    }
})
```
