-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

---@diagnostic disable: undefined-global, undefined-field
local Neopywal = require("neopywal")
local Palette = require("neopywal.lib.palette")
local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

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
        local cache_dir
        if path_sep == "\\" then
            cache_dir = os.getenv("LOCALAPPDATA") -- Windows
        else
            cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
        end

        local expected_scheme_file = cache_dir .. "/wal/colors-wal.vim"
        if path_sep == "\\" then expected_scheme_file = expected_scheme_file:gsub("/", "\\") end

        assert.equals(pcall(function() Palette.setup() end), true)
        assert.equals(pcall(function() Palette.get() end), true)

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

        assert.equals(Palette.options.use_palette.dark, "neopywal.palettes.tokyonight")
        assert.equals(Palette.options.use_palette.light, "neopywal.palettes.doomone")
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
        local cache_dir
        if path_sep == "\\" then
            cache_dir = os.getenv("LOCALAPPDATA") -- Windows
        else
            cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
        end
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
        local cache_dir
        if path_sep == "\\" then
            cache_dir = os.getenv("LOCALAPPDATA") -- Windows
        else
            cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
        end
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
        local cache_dir
        if path_sep == "\\" then
            cache_dir = os.getenv("LOCALAPPDATA") -- Windows
        else
            cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
        end
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
            background = "#282C34",
            foreground = "#BBC2CF",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get("dark")
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
        local expected = {
            background = "#BBC2CF",
            foreground = "#282C34",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get("light")
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
    --: can reset used global variables {{{
    it("can reset used global variables", function()
        Palette.setup({ use_palette = "doomone" })
        Palette.get()
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
            background = "#282C34",
            foreground = "#BBC2CF",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        vim.o.background = "dark"
        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get()
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
        local expected = {
            background = "#BBC2CF",
            foreground = "#282C34",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        vim.o.background = "light"
        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get()
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
            background = "#282C34",
            foreground = "#BBC2CF",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get("dark", true)
        assert.same(C, expected)
    end)
    --: }}}
    --: can export a minimal light palette {{{
    it("can export a minimal light palette", function()
        local expected = {
            none = "NONE",
            background = "#BBC2CF",
            foreground = "#282C34",
            cursor = "#BBC2CF",
            color0 = "#1C1F24",
            color1 = "#FF6C6B",
            color2 = "#98BE65",
            color3 = "#DA8548",
            color4 = "#51AFEF",
            color5 = "#C678DD",
            color6 = "#5699AF",
            color7 = "#ABB2BF",
            color8 = "#5B6268",
            color9 = "#DA8548",
            color10 = "#4DB5BD",
            color11 = "#ECBE7B",
            color12 = "#2257A0",
            color13 = "#A9A1E1",
            color14 = "#46D9FF",
            color15 = "#DFDFDF",
        }

        Palette.setup({ use_palette = "doomone" })
        local C = Palette.get("light", true)
        assert.same(C, expected)
    end)
    --: }}}
    --: can export the builtin fallback colorscheme {{{
    it("can export the builtin fallback colorscheme", function()
        local expected = {
            none = "NONE",
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
        }

        Palette.setup({ colorscheme_file = "null" })
        local C = Palette.get()
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

        local C_dark = Palette.get("dark")
        assert.same(C_dark.color1, "#ff0000")
        assert.same(C_dark.color3, "#ffff00")

        local C_light = Palette.get("light")
        assert.same(C_light.color2, "#00ff00")
        assert.same(C_light.color3, "#ffff00")
    end)
    --: }}}
    --: setup can overwrite colors using a function {{{
    it("setup can overwrite colors using a function", function()
        local C_dark_old = Palette.get("dark")
        local C_light_old = Palette.get("light")

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

        local C_dark = Palette.get("dark")
        assert.same(C_dark.color1, C_dark_old.color3)
        assert.same(C_dark.color3, C_dark_old.color4)

        local C_light = Palette.get("light")
        assert.same(C_light.color2, C_light_old.color6)
        assert.same(C_light.color3, C_light_old.color4)
    end)
    --: }}}
    --: setup can create new colors {{{
    it("setup can create new colors", function()
        Palette.setup({
            custom_colors = {
                all = {
                    test_color_all = "#ff0000",
                },
                dark = {
                    test_color_dark = "#000000",
                },
                light = {
                    test_color_light = "#ffffff",
                },
            },
        })

        local C_dark = Palette.get("dark")
        assert.same(C_dark.test_color_dark, "#000000")
        assert.same(C_dark.test_color_all, "#ff0000")

        local C_light = Palette.get("light")
        assert.same(C_light.test_color_light, "#ffffff")
        assert.same(C_light.test_color_all, "#ff0000")
    end)
    --: }}}
    --: setup can create new colors using a function {{{
    it("setup can create new colors using a function", function()
        Palette.setup({
            custom_colors = function(C)
                return {
                    all = {
                        test_color_all = C.color1,
                    },
                    dark = {
                        test_color_dark = C.color0,
                    },
                    light = {
                        test_color_light = C.color7,
                    },
                }
            end,
        })

        local C_dark = Palette.get("dark")
        assert.same(C_dark.test_color_dark, C_dark.color0)
        assert.same(C_dark.test_color_all, C_dark.color1)

        local C_light = Palette.get("light")
        assert.same(C_light.test_color_light, C_light.color7)
        assert.same(C_light.test_color_all, C_light.color1)
    end)
    --: }}}
    --: can overwrite and export colors {{{
    it("can overwrite and export colors", function()
        local C = Palette.get("dark", false, { color1 = "#ff0000" })
        assert.same(C.color1, "#ff0000")
    end)
    --: }}}
    --: can overwrite and export colors using a function {{{
    it("can overwrite and export colors using a function", function()
        local C = Palette.get("dark", false, function(C) return { color1 = C.color0 } end)
        assert.same(C.color1, C.color0)
    end)
    --: }}}
    --: can create and export new colors {{{
    it("can create and export new colors", function()
        local C = Palette.get("dark", false, { test_color = "#ff0000" })
        assert.same(C.test_color, "#ff0000")
    end)
    --: }}}
    --: can create and export new colors using a function {{{
    it("can create and export new colors using a function", function()
        ---@diagnostic disable-next-line: param-type-mismatch
        local C = Palette.get("dark", false, function(C) return { test_color = C.color1 } end)
        assert.same(C.test_color, C.color1)
    end)
    --: }}}
end)
