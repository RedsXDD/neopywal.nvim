-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

---@diagnostic disable: undefined-global, undefined-field, missing-parameter
local Neopywal = require("neopywal")
local Palette = require("neopywal.lib.palette")
local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

---@type string?
local cache_dir = ""
if path_sep == "\\" then
    cache_dir = os.getenv("USERPROFILE") .. "\\.cache" -- Windows
else
    cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
end

describe("palette", function()
    before_each(function()
        for name, _ in pairs(package.loaded) do
            if name:match("^neopywal.") and not name:match("^neopywal.lib.") then package.loaded[name] = nil end
        end

        vim.g.background = nil
        vim.g.foreground = nil
        vim.g.cursor = nil
        vim.g.color0 = nil
        vim.g.color1 = nil
        vim.g.color2 = nil
        vim.g.color3 = nil
        vim.g.color4 = nil
        vim.g.color5 = nil
        vim.g.color6 = nil
        vim.g.color7 = nil
        vim.g.color8 = nil
        vim.g.color9 = nil
        vim.g.color10 = nil
        vim.g.color11 = nil
        vim.g.color12 = nil
        vim.g.color13 = nil
        vim.g.color14 = nil
        vim.g.color15 = nil

        vim.o.background = "dark"
        vim.cmd.colorscheme("default")

        Neopywal.setup()
        Palette.setup()
    end)
    --: setup works with default options {{{
    it("setup works with default options", function()
        local expected_scheme_file = cache_dir .. "/wal/colors-wal.vim"
        if path_sep == "\\" then expected_scheme_file = expected_scheme_file:gsub("/", "\\") end

        assert.equals(pcall(function() Palette.setup() end), true)
        assert.equals(pcall(function() Neopywal.get_colors() end), true)

        assert.equals(Palette.options.use_palette.dark, expected_scheme_file)
        assert.equals(Palette.options.use_palette.light, expected_scheme_file)
    end)
    --: }}}
    --: setup works with use_palette option as a string {{{
    it("setup works with use_palette option as a string", function()
        Palette.setup({
            use_palette = "doomone",
        })

        assert.equals(Palette.options.use_palette.dark, "neopywal.palettes.doomone")
        assert.equals(Palette.options.use_palette.light, "neopywal.palettes.doomone")
    end)
    --: }}}
    --: setup works with use_palette option as a table {{{
    it("setup works with use_palette option as a table", function()
        Palette.setup({
            use_palette = {
                dark = "tokyonight",
                light = "doomone",
            },
        })

        local expected_tokyonight = {
            none = "NONE",
            background = "#1a1b26",
            foreground = "#a9b1d6",
            cursor = "#a9b1d6",
            color0 = "#32344a",
            color1 = "#f7768e",
            color2 = "#9ece6a",
            color3 = "#e0af68",
            color4 = "#7aa2f7",
            color5 = "#ad8ee6",
            color6 = "#449dab",
            color7 = "#787c99",
            color8 = "#444b6a",
            color9 = "#ff7a93",
            color10 = "#b9f27c",
            color11 = "#ff9e64",
            color12 = "#7da6ff",
            color13 = "#bb9af7",
            color14 = "#0db9d7",
            color15 = "#acb0d0",
        }

        local expected_doomone = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        local C_tokyonight = Neopywal.get_colors("dark", true, {})
        local C_doomone = Neopywal.get_colors("light", true, {})
        local LightTheme = require("neopywal.utils.light")
        expected_doomone = LightTheme.convert_dark2light_theme(expected_doomone)
        expected_doomone.none = "NONE"

        assert.equals(Palette.options.use_palette.dark, "neopywal.palettes.tokyonight")
        assert.equals(Palette.options.use_palette.light, "neopywal.palettes.doomone")
        assert.are.same(C_tokyonight, expected_tokyonight)
        assert.are.same(C_doomone, expected_doomone)
    end)
    --: }}}
    --: setup works with use_palette option as a filepath string {{{
    it("setup works with use_palette option as a filepath string", function()
        local test_path = string.format(".%stest%spath.vim", path_sep, path_sep)

        Palette.setup({
            use_palette = test_path,
        })

        assert.equals(Palette.options.use_palette.dark, test_path)
        assert.equals(Palette.options.use_palette.light, test_path)
    end)
    --: }}}
    --: setup works with use_palette option as a table of filepaths {{{
    it("setup works with use_palette option as a table of filepaths", function()
        local test_path_dark = string.format(".%stest%spath_dark.vim", path_sep, path_sep)
        local test_path_light = string.format(".%stest%spath_light.vim", path_sep, path_sep)

        Palette.setup({
            use_palette = {
                dark = test_path_dark,
                light = test_path_light,
            },
        })

        assert.equals(Palette.options.use_palette.dark, test_path_dark)
        assert.equals(Palette.options.use_palette.light, test_path_light)
    end)
    --: }}}
    --: setup works with use_palette set as 'wal' {{{
    it("setup works with use_palette set as 'wal'", function()
        local expectedcheme_file = cache_dir .. "/wal/colors-wal.vim"
        if path_sep == "\\" then expectedcheme_file = expectedcheme_file:gsub("/", "\\") end

        Palette.setup({
            use_palette = "wal",
        })

        assert.equals(Palette.options.use_palette.dark, expectedcheme_file)
        assert.equals(Palette.options.use_palette.light, expectedcheme_file)
    end)
    --: }}}
    --: setup works with use_palette set as 'pywal' {{{
    it("setup works with use_palette set as 'pywal'", function()
        local expectedcheme_file = cache_dir .. "/wal/colors-wal.vim"
        if path_sep == "\\" then expectedcheme_file = expectedcheme_file:gsub("/", "\\") end

        Palette.setup({
            use_palette = "pywal",
        })

        assert.equals(Palette.options.use_palette.dark, expectedcheme_file)
        assert.equals(Palette.options.use_palette.light, expectedcheme_file)
    end)
    --: }}}
    --: setup works with use_palette set as 'wallust' {{{
    it("setup works with use_palette set as 'wallust'", function()
        local expectedcheme_file = cache_dir .. "/wallust/colors_neopywal.vim"
        if path_sep == "\\" then expectedcheme_file = expectedcheme_file:gsub("/", "\\") end

        Palette.setup({
            use_palette = "wallust",
        })

        assert.equals(Palette.options.use_palette.dark, expectedcheme_file)
        assert.equals(Palette.options.use_palette.light, expectedcheme_file)
    end)
    --: }}}
    --: can export a dark theme style {{{
    it("can export a dark theme style", function()
        local expected = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Neopywal.get_colors("dark")
        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: can export a light theme style {{{
    it("can export a light theme style", function()
        local dark_palette = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        Palette.setup({ use_palette = "doomone" })
        local LightTheme = require("neopywal.utils.light")
        local expected = LightTheme.convert_dark2light_theme(dark_palette)
        local C = Neopywal.get_colors("light")

        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: can export fallback dark theme style {{{
    it("can export fallback dark theme style", function()
        local expected = {
            none = "NONE",
            background = "#1e1e2e",
            foreground = "#cdd6f4",
            cursor = "#cdd6f4",
            color0 = "#45475a",
            color1 = "#f38ba8",
            color2 = "#a6e3a1",
            color3 = "#f9e2af",
            color4 = "#89b4fa",
            color5 = "#f5c2e7",
            color6 = "#94e2d5",
            color7 = "#bac2de",
            color8 = "#585b70",
            color9 = "#f38ba8",
            color10 = "#a6e3a1",
            color11 = "#f9e2af",
            color12 = "#89b4fa",
            color13 = "#f5c2e7",
            color14 = "#94e2d5",
            color15 = "#a6adc8",
        }

        vim.o.background = "dark"
        Palette.setup({ use_palette = "null" })
        local C = Neopywal.get_colors()
        assert.equals(C.none, expected.none)
        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: can export fallback light theme style {{{
    it("can export fallback light theme style", function()
        local dark_palette = {
            background = "#1e1e2e",
            foreground = "#cdd6f4",
            cursor = "#cdd6f4",
            color0 = "#45475a",
            color1 = "#f38ba8",
            color2 = "#a6e3a1",
            color3 = "#f9e2af",
            color4 = "#89b4fa",
            color5 = "#f5c2e7",
            color6 = "#94e2d5",
            color7 = "#bac2de",
            color8 = "#585b70",
            color9 = "#f38ba8",
            color10 = "#a6e3a1",
            color11 = "#f9e2af",
            color12 = "#89b4fa",
            color13 = "#f5c2e7",
            color14 = "#94e2d5",
            color15 = "#a6adc8",
        }

        vim.o.background = "light"
        Palette.setup({ use_palette = "null" })
        local LightTheme = require("neopywal.utils.light")
        local expected = LightTheme.convert_dark2light_theme(dark_palette)
        expected.none = "NONE"
        local C = Neopywal.get_colors()
        assert.equals(C.none, expected.none)
        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: can reset global variables {{{
    it("can reset global variables", function()
        Palette.setup({ use_palette = "doomone" })
        Neopywal.get_colors()
        assert.is_nil(vim.g.background)
        assert.is_nil(vim.g.foreground)
        assert.is_nil(vim.g.cursor)
        assert.is_nil(vim.g.color0)
        assert.is_nil(vim.g.color1)
        assert.is_nil(vim.g.color2)
        assert.is_nil(vim.g.color3)
        assert.is_nil(vim.g.color4)
        assert.is_nil(vim.g.color5)
        assert.is_nil(vim.g.color6)
        assert.is_nil(vim.g.color7)
        assert.is_nil(vim.g.color8)
        assert.is_nil(vim.g.color9)
        assert.is_nil(vim.g.color10)
        assert.is_nil(vim.g.color11)
        assert.is_nil(vim.g.color12)
        assert.is_nil(vim.g.color13)
        assert.is_nil(vim.g.color14)
        assert.is_nil(vim.g.color15)
    end)
    --: }}}
    --: respects vim.o.background = dark {{{
    it("respects vim.o.background = dark", function()
        local expected = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        vim.o.background = "dark"
        Palette.setup({ use_palette = "doomone" })
        local C = Neopywal.get_colors()
        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: respects vim.o.background = light {{{
    it("respects vim.o.background = light", function()
        local dark_palette = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        vim.o.background = "light"
        Palette.setup({ use_palette = "doomone" })
        local LightTheme = require("neopywal.utils.light")
        local expected = LightTheme.convert_dark2light_theme(dark_palette)
        local C = Neopywal.get_colors()
        assert.equals(C.background, expected.background)
        assert.equals(C.foreground, expected.foreground)
        assert.equals(C.cursor, expected.cursor)
        assert.equals(C.color0, expected.color0)
        assert.equals(C.color1, expected.color1)
        assert.equals(C.color2, expected.color2)
        assert.equals(C.color3, expected.color3)
        assert.equals(C.color4, expected.color4)
        assert.equals(C.color5, expected.color5)
        assert.equals(C.color6, expected.color6)
        assert.equals(C.color7, expected.color7)
        assert.equals(C.color8, expected.color8)
        assert.equals(C.color9, expected.color9)
        assert.equals(C.color10, expected.color10)
        assert.equals(C.color11, expected.color11)
        assert.equals(C.color12, expected.color12)
        assert.equals(C.color13, expected.color13)
        assert.equals(C.color14, expected.color14)
        assert.equals(C.color15, expected.color15)
    end)
    --: }}}
    --: can export a minimal dark palette {{{
    it("can export a minimal dark palette", function()
        local expected = {
            none = "NONE",
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Neopywal.get_colors("dark", true)
        assert.same(C, expected)
    end)
    --: }}}
    --: can export a minimal light palette {{{
    it("can export a minimal light palette", function()
        local dark_palette = {
            background = "#282c34",
            foreground = "#bbc2cf",
            cursor = "#bbc2cf",
            color0 = "#1c1f24",
            color1 = "#ff6c6b",
            color2 = "#98be65",
            color3 = "#da8548",
            color4 = "#51afef",
            color5 = "#c678dd",
            color6 = "#5699af",
            color7 = "#abb2bf",
            color8 = "#5b6268",
            color9 = "#da8548",
            color10 = "#4db5bd",
            color11 = "#ecbe7b",
            color12 = "#2257a0",
            color13 = "#a9a1e1",
            color14 = "#46d9ff",
            color15 = "#dfdfdf",
        }

        Palette.setup({ use_palette = "doomone" })
        local LightTheme = require("neopywal.utils.light")
        local expected = LightTheme.convert_dark2light_theme(dark_palette)
        expected.none = "NONE"
        local C = Neopywal.get_colors("light", true)
        assert.same(C, expected)
    end)
    --: }}}
    --: setup can overwrite colors {{{
    it("setup can overwrite colors", function()
        Palette.setup({
            custom_colors = {
                dark = {
                    color1 = "#ff0000",
                },
                light = {
                    color2 = "#00ff00",
                },
                all = {
                    color3 = "#ffff00",
                },
            },
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.color1, "#ff0000")
        assert.same(C_dark.color3, "#ffff00")
        assert.are_not.same(C_dark.color2, "#00ff00")

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.color2, "#00ff00")
        assert.same(C_light.color3, "#ffff00")
        assert.are_not.same(C_light.color1, "#ff0000")
    end)
    --: }}}
    --: setup can overwrite colors using a function {{{
    it("setup can overwrite colors using a function", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        Palette.setup({
            custom_colors = function(C)
                return {
                    dark = {
                        color1 = C.color3,
                    },
                    light = {
                        color2 = C.color6,
                    },
                    all = {
                        color3 = C.color4,
                    },
                }
            end,
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.color1, C_dark_old.color3)
        assert.same(C_dark.color3, C_dark_old.color4)
        assert.are_not.same(C_dark.color2, C_dark_old.color6)

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.color2, C_light_old.color6)
        assert.same(C_light.color3, C_light_old.color4)
        assert.are_not.same(C_light.color1, C_light_old.color3)
    end)
    --: }}}
    --: setup can overwrite colors using individual functions {{{
    it("setup can overwrite colors using individual functions", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        Palette.setup({
            custom_colors = {
                dark = function(C) return { color1 = C.color3 } end,
                light = function(C) return { color2 = C.color6 } end,
                all = function(C) return { color3 = C.color4 } end,
            },
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.color1, C_dark_old.color3)
        assert.same(C_dark.color3, C_dark_old.color4)
        assert.are_not.same(C_dark.color2, C_dark_old.color6)

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.color2, C_light_old.color6)
        assert.same(C_light.color3, C_light_old.color4)
        assert.are_not.same(C_light.color1, C_light_old.color3)
    end)
    --: }}}
    --: setup can create new colors {{{
    it("setup can create new colors", function()
        Palette.setup({
            custom_colors = {
                dark = {
                    test_color_dark = "#000000",
                },
                light = {
                    test_color_light = "#ffffff",
                },
                all = {
                    test_color_all = "#ff0000",
                },
            },
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.test_color_all, "#ff0000")
        assert.same(C_dark.test_color_dark, "#000000")
        assert.are_not.same(C_dark.test_color_light, "#ffffff")

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.test_color_all, "#ff0000")
        assert.same(C_light.test_color_light, "#ffffff")
        assert.are_not.same(C_light.test_color_dark, "#000000")
    end)
    --: }}}
    --: setup can create new colors using a function {{{
    it("setup can create new colors using a function", function()
        Palette.setup({
            custom_colors = function(C)
                return {
                    dark = {
                        test_color_dark = C.color0,
                    },
                    light = {
                        test_color_light = C.color7,
                    },
                    all = {
                        test_color_all = C.color1,
                    },
                }
            end,
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.test_color_all, C_dark.color1)
        assert.same(C_dark.test_color_dark, C_dark.color0)
        assert.are_not.same(C_dark.test_color_light, C_dark.color7)

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.test_color_all, C_light.color1)
        assert.same(C_light.test_color_light, C_light.color7)
        assert.are_not.same(C_light.test_color_dark, C_light.color0)
    end)
    --: }}}
    --: setup can create new colors using individual functions {{{
    it("setup can create new colors using individual functions", function()
        Palette.setup({
            custom_colors = {
                dark = function(C) return { test_color_dark = C.color0 } end,
                light = function(C) return { test_color_light = C.color7 } end,
                all = function(C) return { test_color_all = C.color1 } end,
            },
        })

        local C_dark = Neopywal.get_colors("dark")
        assert.same(C_dark.test_color_all, C_dark.color1)
        assert.same(C_dark.test_color_dark, C_dark.color0)
        assert.are_not.same(C_dark.test_color_light, C_dark.color7)

        local C_light = Neopywal.get_colors("light")
        assert.same(C_light.test_color_all, C_light.color1)
        assert.same(C_light.test_color_light, C_light.color7)
        assert.are_not.same(C_light.test_color_dark, C_light.color0)
    end)
    --: }}}
    --: get can overwrite and export colors {{{
    it("get can overwrite and export colors", function()
        local C_dark = Neopywal.get_colors("dark", false, {
            dark = { color0 = "#000000" },
            light = { color7 = "#ffffff" },
            all = { color1 = "#ff0000" },
        })

        local C_light = Neopywal.get_colors("light", false, {
            dark = { color6 = "#00ffff" },
            light = { color4 = "#0000ff" },
            all = { color3 = "#ffff00" },
        })

        assert.same(C_dark.color1, "#ff0000")
        assert.same(C_dark.color0, "#000000")
        assert.are_not.same(C_dark.color7, "#ffffff")

        assert.same(C_light.color3, "#ffff00")
        assert.same(C_light.color4, "#0000ff")
        assert.are_not.same(C_light.color6, "#00ffff")
    end)
    --: }}}
    --: get can overwrite and export colors using a function {{{
    it("get can overwrite and export colors using a function", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        local C_dark = Neopywal.get_colors(
            "dark",
            false,
            function(C)
                return {
                    dark = {
                        color1 = C.color0,
                    },
                    light = {
                        color2 = C.color6,
                    },
                    all = {
                        color3 = C.color4,
                    },
                }
            end
        )

        local C_light = Neopywal.get_colors(
            "light",
            false,
            function(C)
                return {
                    dark = {
                        color6 = C.color7,
                    },
                    light = {
                        color5 = C.color8,
                    },
                    all = {
                        color4 = C.color1,
                    },
                }
            end
        )

        assert.same(C_dark.color1, C_dark_old.color0)
        assert.same(C_dark.color3, C_dark_old.color4)
        assert.are_not.same(C_dark.color2, C_dark_old.color6)

        assert.same(C_light.color5, C_light.color8)
        assert.same(C_light.color4, C_light.color1)
        assert.are_not.same(C_light.color6, C_light_old.color7)
    end)
    --: }}}
    --: get can overwrite and export colors using individual functions {{{
    it("get can overwrite and export colors using individual functions", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        local C_dark = Neopywal.get_colors("dark", false, {
            dark = function(C) return { color1 = C.color0 } end,
            light = function(C) return { color2 = C.color6 } end,
            all = function(C) return { color3 = C.color4 } end,
        })

        local C_light = Neopywal.get_colors("light", false, {
            dark = function(C) return { color6 = C.color7 } end,
            light = function(C) return { color5 = C.color8 } end,
            all = function(C) return { color4 = C.color1 } end,
        })

        assert.same(C_dark.color1, C_dark_old.color0)
        assert.same(C_dark.color3, C_dark_old.color4)
        assert.are_not.same(C_dark.color2, C_dark_old.color6)

        assert.same(C_light.color5, C_light.color8)
        assert.same(C_light.color4, C_light.color1)
        assert.are_not.same(C_light.color6, C_light_old.color7)
    end)
    --: }}}
    --: get can create and export new colors {{{
    it("get can create and export new colors", function()
        local C_dark = Neopywal.get_colors("dark", false, {
            dark = {
                dark_test_color_dark = "#000000",
            },
            light = {
                dark_test_color_light = "#ffffff",
            },
            all = {
                dark_test_color_all = "#ff0000",
            },
        })

        local C_light = Neopywal.get_colors("light", false, {
            dark = {
                light_test_color_dark = "#00ffff",
            },
            light = {
                light_test_color_light = "#0000ff",
            },
            all = {
                light_test_color_all = "#ffff00",
            },
        })

        assert.same(C_dark.dark_test_color_dark, "#000000")
        assert.same(C_dark.dark_test_color_all, "#ff0000")
        assert.are_not.same(C_dark.dark_test_color_light, "#ffffff")

        assert.same(C_light.light_test_color_light, "#0000ff")
        assert.same(C_light.light_test_color_all, "#ffff00")
        assert.are_not.same(C_light.light_test_color_dark, "#00ffff")
    end)
    --: }}}
    --: get can create and export new colors using a function {{{
    it("get can create and export new colors using a function", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        local C_dark = Neopywal.get_colors(
            "dark",
            false,
            function(C)
                return {
                    dark = {
                        dark_test_color_dark = C.color0,
                    },
                    light = {
                        dark_test_color_light = C.color7,
                    },
                    all = {
                        dark_test_color_all = C.color1,
                    },
                }
            end
        )

        local C_light = Neopywal.get_colors(
            "light",
            false,
            function(C)
                return {
                    dark = {
                        light_test_color_dark = C.color3,
                    },
                    light = {
                        light_test_color_light = C.color2,
                    },
                    all = {
                        light_test_color_all = C.color4,
                    },
                }
            end
        )

        assert.same(C_dark.dark_test_color_dark, C_dark_old.color0)
        assert.same(C_dark.dark_test_color_all, C_dark_old.color1)
        assert.are_not.same(C_dark.dark_test_color_light, C_dark_old.color7)

        assert.same(C_light.light_test_color_light, C_light_old.color2)
        assert.same(C_light.light_test_color_all, C_light_old.color4)
        assert.are_not.same(C_light.light_test_color_dark, C_light_old.color3)
    end)
    --: }}}
    --: get can create and export new colors using individual functions {{{
    it("get can create and export new colors using individual functions", function()
        local C_dark_old = Neopywal.get_colors("dark")
        local C_light_old = Neopywal.get_colors("light")

        local C_dark = Neopywal.get_colors("dark", false, {
            dark = function(C) return { dark_test_color_dark = C.color0 } end,
            light = function(C) return { dark_test_color_light = C.color7 } end,
            all = function(C) return { dark_test_color_all = C.color1 } end,
        })

        local C_light = Neopywal.get_colors("light", false, {
            dark = function(C) return { light_test_color_dark = C.color3 } end,
            light = function(C) return { light_test_color_light = C.color2 } end,
            all = function(C) return { light_test_color_all = C.color4 } end,
        })

        assert.same(C_dark.dark_test_color_dark, C_dark_old.color0)
        assert.same(C_dark.dark_test_color_all, C_dark_old.color1)
        assert.are_not.same(C_dark.dark_test_color_light, C_dark_old.color7)

        assert.same(C_light.light_test_color_light, C_light_old.color2)
        assert.same(C_light.light_test_color_all, C_light_old.color4)
        assert.are_not.same(C_light.light_test_color_dark, C_light_old.color3)
    end)
    --: }}}
end)
