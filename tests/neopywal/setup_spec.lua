-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

---@diagnostic disable: undefined-global, undefined-field, missing-fields
---@type Neopywal
local Neopywal = require("neopywal")
local Config = require("neopywal.lib.config")

describe("setup", function()
    before_each(function()
        for name, _ in pairs(package.loaded) do
            if name:match("^neopywal.") and not name:match("^neopywal.lib.") then package.loaded[name] = nil end
        end

        for i = 0, 15 do
            vim.g["terminal_color_" .. i] = nil
        end

        vim.o.background = "dark"
        vim.cmd.colorscheme("default")
        vim.cmd.highlight("clear")

        Neopywal.setup()
    end)

    --: works with default options {{{
    it("works with default options", function()
        assert.equals(pcall(function() Neopywal.setup() end), true)
        assert.equals(pcall(function() Neopywal.load() end), true)
        assert.same(Config.options, Config.default_options)
    end)
    --: }}}
    --: doesn't change default options {{{
    it("doesn't change default options", function()
        Neopywal.setup({ transparent_background = true })
        assert.are_not.equals(Config.options.transparent_background, Config.default_options.transparent_background)
    end)
    --: }}}
    --: can overwrite fileformats {{{
    it("can overwrite fileformats", function()
        Neopywal.setup({ fileformats = { lua = not Config.default_options.fileformats.lua } })
        assert.are_not.equals(Config.options.fileformats.lua, Config.default_options.fileformats.lua)
    end)
    --: }}}
    --: can overwrite plugins {{{
    it("can overwrite plugins", function()
        Neopywal.setup({ plugins = { coc = not Config.default_options.plugins.coc } })
        assert.are_not.equals(Config.options.plugins.coc, Config.default_options.plugins.coc)
    end)
    --: }}}
    --: disables default fileformats {{{
    it("disables default fileformats", function()
        Neopywal.setup({ default_fileformats = false })
        local function check(tbl)
            for k, v in pairs(tbl) do
                if type(v) == "table" then
                    assert.equals(tbl[k].enabled, false)
                else
                    assert.equals(tbl[k], false)
                end
            end
        end
        check(Config.options.fileformats)
        check(Config.default_options.fileformats)
    end)
    --: }}}
    --: disables default plugins {{{
    it("disables default plugins", function()
        Neopywal.setup({ default_plugins = false })
        local function check(tbl)
            for k, v in pairs(tbl) do
                if k == "mini" then
                    check(tbl["mini"])
                    return
                end

                if type(v) == "table" then
                    assert.equals(tbl[k].enabled, false)
                else
                    assert.equals(tbl[k], false)
                end
            end
        end
        check(Config.options.plugins)
        check(Config.default_options.plugins)
    end)
    --: }}}
    --: treesitter disables fileformats {{{
    it("treesitter disables fileformats", function()
        Neopywal.setup({ plugins = { treesitter = true } })
        assert.same(Config.options.default_fileformats, false)
    end)
    --: }}}
    --: disabling treesitter enables fileformats {{{
    it("disabling treesitter enables fileformats", function()
        Neopywal.setup({ plugins = { treesitter = false } })
        assert.same(Config.options.default_fileformats, true)
    end)
    --: }}}
    --: default_fileformats has precedence over treesitter {{{
    it("default_fileformats has precedence over treesitter", function()
        Neopywal.setup({ default_fileformats = true, plugins = { treesitter = true } })
        assert.equals(Config.options.default_fileformats, true)

        Neopywal.setup({ default_fileformats = false, plugins = { treesitter = false } })
        assert.equals(Config.options.default_fileformats, false)

        Neopywal.setup({ default_fileformats = false, plugins = { treesitter = true } })
        assert.equals(Config.options.default_fileformats, false)

        Neopywal.setup({ default_fileformats = true, plugins = { treesitter = false } })
        assert.equals(Config.options.default_fileformats, true)
    end)
    --: }}}
    --: can overwrite colors {{{
    it("can overwrite colors", function()
        Neopywal.setup({
            custom_colors = {
                all = {
                    comment_all = "#ff0000",
                },
                dark = {
                    comment_dark = "#000000",
                },
                light = {
                    comment_light = "#ffffff",
                },
            },
        })

        local C_dark = require("neopywal.lib.palette").get("dark")
        assert.same(C_dark.comment_dark, "#000000")
        assert.same(C_dark.comment_all, "#ff0000")

        local C_light = require("neopywal.lib.palette").get("light")
        assert.same(C_light.comment_light, "#ffffff")
        assert.same(C_dark.comment_all, "#ff0000")
    end)
    --: }}}
    --: can overwrite colors using a function {{{
    it("can overwrite colors using a function", function()
        local C_dark_old = require("neopywal.lib.palette").get("dark")
        local C_light_old = require("neopywal.lib.palette").get("light")

        Neopywal.setup({
            custom_colors = function(C)
                return {
                    all = {
                        comment_all = C.color1,
                    },
                    dark = {
                        comment_dark = C.color0,
                    },
                    light = {
                        comment_light = C.color7,
                    },
                }
            end,
        })

        local C_dark = require("neopywal.lib.palette").get("dark")
        assert.same(C_dark.comment_dark, C_dark_old.color0)
        assert.same(C_dark.comment_all, C_dark_old.color1)

        local C_light = require("neopywal.lib.palette").get("light")
        assert.same(C_light.comment_light, C_light_old.color7)
        assert.same(C_light.comment_all, C_light_old.color1)
    end)
    --: }}}
    --: can create new colors {{{
    it("can create new colors", function()
        Neopywal.setup({
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

        local C_dark = require("neopywal.lib.palette").get("dark")
        assert.same(C_dark.test_color_dark, "#000000")
        assert.same(C_dark.test_color_all, "#ff0000")

        local C_light = require("neopywal.lib.palette").get("light")
        assert.same(C_light.test_color_light, "#ffffff")
        assert.same(C_light.test_color_all, "#ff0000")
    end)
    --: }}}
    --: can create new colors using a function {{{
    it("can create new colors using a function", function()
        local C_dark_old = require("neopywal.lib.palette").get("dark")
        local C_light_old = require("neopywal.lib.palette").get("light")

        Neopywal.setup({
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

        local C_dark = require("neopywal.lib.palette").get("dark")
        assert.same(C_dark.test_color_dark, C_dark_old.color0)
        assert.same(C_dark.test_color_all, C_dark_old.color1)

        local C_light = require("neopywal.lib.palette").get("light")
        assert.same(C_light.test_color_light, C_light_old.color7)
        assert.same(C_light.test_color_all, C_light_old.color1)
    end)
    --: }}}
    --: can overwrite highlights groups {{{
    it("can overwrite highlights groups", function()
        Neopywal.setup({
            custom_highlights = {
                all = {
                    Normal = { bg = "#ffff00", fg = "#ff0000" },
                    NormalNC = { bg = "#ff0000" },
                },
                dark = {
                    Search = { bg = "#000000", fg = "#00ff00" },
                    ColorColumn = { bg = "#00ff00" },
                },
                light = {
                    Search = { bg = "#ffffff", fg = "#0000ff" },
                    ColorColumn = { bg = "#0000ff" },
                },
            },
        })

        local function assert_dark()
            vim.cmd.highlight("clear")
            Neopywal.load("dark")

            local normal_group_id = vim.api.nvim_get_hl_id_by_name("Normal")
            local normal_values = {
                bg = vim.fn.synIDattr(normal_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(normal_group_id, "fg", "gui"),
            }

            local normalnc_group_id = vim.api.nvim_get_hl_id_by_name("NormalNC")
            local normalnc_values = {
                bg = vim.fn.synIDattr(normalnc_group_id, "bg", "gui"),
            }

            local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
            local search_values = {
                bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
            }

            local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
            local color_column_values = {
                bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
            }

            assert.same(normal_values, { bg = "#ffff00", fg = "#ff0000" })
            assert.same(normalnc_values, { bg = "#ff0000" })
            assert.same(search_values, { bg = "#000000", fg = "#00ff00" })
            assert.same(color_column_values, { bg = "#00ff00" })
        end

        local function assert_light()
            vim.cmd.highlight("clear")
            Neopywal.load("light")

            local normal_group_id = vim.api.nvim_get_hl_id_by_name("Normal")
            local normal_values = {
                bg = vim.fn.synIDattr(normal_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(normal_group_id, "fg", "gui"),
            }

            local normalnc_group_id = vim.api.nvim_get_hl_id_by_name("NormalNC")
            local normalnc_values = {
                bg = vim.fn.synIDattr(normalnc_group_id, "bg", "gui"),
            }

            local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
            local search_values = {
                bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
            }

            local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
            local color_column_values = {
                bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
            }

            assert.same(normal_values, { bg = "#ffff00", fg = "#ff0000" })
            assert.same(normalnc_values, { bg = "#ff0000" })
            assert.same(search_values, { bg = "#ffffff", fg = "#0000ff" })
            assert.same(color_column_values, { bg = "#0000ff" })
        end

        assert_dark()
        assert_light()
    end)
    --: }}}
    --: can overwrite highlights groups using a function {{{
    it("can overwrite highlights groups using a function", function()
        Neopywal.setup({
            custom_highlights = function(C)
                return {
                    all = {
                        Normal = { bg = C.color3, fg = C.color1 },
                        NormalNC = { bg = C.color1 },
                    },
                    dark = {
                        Search = { bg = C.color0, fg = C.color2 },
                        ColorColumn = { bg = C.color2 },
                    },
                    light = {
                        Search = { bg = C.color7, fg = C.color4 },
                        ColorColumn = { bg = C.color4 },
                    },
                }
            end,
        })

        local function assert_dark()
            local C = require("neopywal.lib.palette").get("dark", true, {})
            C.color0 = string.lower(C.color0)
            C.color1 = string.lower(C.color1)
            C.color2 = string.lower(C.color2)
            C.color3 = string.lower(C.color3)

            vim.cmd.highlight("clear")
            Neopywal.load("dark")

            local normal_group_id = vim.api.nvim_get_hl_id_by_name("Normal")
            local normal_values = {
                bg = vim.fn.synIDattr(normal_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(normal_group_id, "fg", "gui"),
            }
            normal_values.bg = string.lower(normal_values.bg)
            normal_values.fg = string.lower(normal_values.fg)

            local normalnc_group_id = vim.api.nvim_get_hl_id_by_name("NormalNC")
            local normalnc_values = {
                bg = vim.fn.synIDattr(normalnc_group_id, "bg", "gui"),
            }
            normalnc_values.bg = string.lower(normalnc_values.bg)

            local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
            local search_values = {
                bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
            }
            search_values.bg = string.lower(search_values.bg)
            search_values.fg = string.lower(search_values.fg)

            local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
            local color_column_values = {
                bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
            }
            color_column_values.bg = string.lower(color_column_values.bg)

            assert.same(normal_values, { bg = C.color3, fg = C.color1 })
            assert.same(normalnc_values, { bg = C.color1 })
            assert.same(search_values, { bg = C.color0, fg = C.color2 })
            assert.same(color_column_values, { bg = C.color2 })
        end

        local function assert_light()
            local C = require("neopywal.lib.palette").get("light", true, {})
            C.color1 = string.lower(C.color1)
            C.color3 = string.lower(C.color3)
            C.color4 = string.lower(C.color4)
            C.color7 = string.lower(C.color7)

            vim.cmd.highlight("clear")
            Neopywal.load("light")

            local normal_group_id = vim.api.nvim_get_hl_id_by_name("Normal")
            local normal_values = {
                bg = vim.fn.synIDattr(normal_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(normal_group_id, "fg", "gui"),
            }
            normal_values.bg = string.lower(normal_values.bg)
            normal_values.fg = string.lower(normal_values.fg)

            local normalnc_group_id = vim.api.nvim_get_hl_id_by_name("NormalNC")
            local normalnc_values = {
                bg = vim.fn.synIDattr(normalnc_group_id, "bg", "gui"),
            }
            normalnc_values.bg = string.lower(normalnc_values.bg)

            local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
            local search_values = {
                bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
                fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
            }
            search_values.bg = string.lower(search_values.bg)
            search_values.fg = string.lower(search_values.fg)

            local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
            local color_column_values = {
                bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
            }
            color_column_values.bg = string.lower(color_column_values.bg)

            assert.same(normal_values, { bg = C.color3, fg = C.color1 })
            assert.same(normalnc_values, { bg = C.color1 })
            assert.same(search_values, { bg = C.color7, fg = C.color4 })
            assert.same(color_column_values, { bg = C.color4 })
        end

        assert_dark()
        assert_light()
    end)
    --: }}}
    --: can create hightlights if they don't exist {{{
    it("can create hightlights if they don't exist", function()
        Neopywal.setup({
            custom_highlights = {
                all = {
                    NewAll = { bg = "#ffff00", fg = "#ff0000" },
                },
                dark = {
                    NewDark = { bg = "#000000", fg = "#00ff00" },
                },
                light = {
                    NewLight = { bg = "#ffffff", fg = "#0000ff" },
                },
            },
        })

        local function assert_dark()
            vim.cmd.highlight("clear")
            Neopywal.load("dark")

            local newall_id = vim.api.nvim_get_hl_id_by_name("NewAll")
            local newall_values = {
                bg = vim.fn.synIDattr(newall_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newall_id, "fg", "gui"),
            }

            local newdark_id = vim.api.nvim_get_hl_id_by_name("NewDark")
            local newdark_values = {
                bg = vim.fn.synIDattr(newdark_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newdark_id, "fg", "gui"),
            }

            assert.same(newall_values, { bg = "#ffff00", fg = "#ff0000" })
            assert.same(newdark_values, { bg = "#000000", fg = "#00ff00" })
        end

        local function assert_light()
            vim.cmd.highlight("clear")
            Neopywal.load("light")

            local newall_id = vim.api.nvim_get_hl_id_by_name("NewAll")
            local newall_values = {
                bg = vim.fn.synIDattr(newall_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newall_id, "fg", "gui"),
            }

            local newlight_id = vim.api.nvim_get_hl_id_by_name("NewLight")
            local newlight_values = {
                bg = vim.fn.synIDattr(newlight_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newlight_id, "fg", "gui"),
            }

            assert.same(newall_values, { bg = "#ffff00", fg = "#ff0000" })
            assert.same(newlight_values, { bg = "#ffffff", fg = "#0000ff" })
        end

        assert_dark()
        assert_light()
    end)
    --: }}}
    --: can create hightlights if they don't exist using a function {{{
    it("can create hightlights if they don't exist", function()
        Neopywal.setup({
            custom_highlights = {
                all = function(C) return { NewAll = { bg = C.color3, fg = C.color1 } } end,
                dark = function(C) return { NewDark = { bg = C.color0, fg = C.color2 } } end,
                light = function(C) return { NewLight = { bg = C.color7, fg = C.color4 } } end,
            },
        })

        local function assert_dark()
            local C = require("neopywal.lib.palette").get("dark", true, {})
            C.color0 = string.lower(C.color0)
            C.color1 = string.lower(C.color1)
            C.color2 = string.lower(C.color2)
            C.color3 = string.lower(C.color3)

            vim.cmd.highlight("clear")
            Neopywal.load("dark")

            local newall_id = vim.api.nvim_get_hl_id_by_name("NewAll")
            local newall_values = {
                bg = vim.fn.synIDattr(newall_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newall_id, "fg", "gui"),
            }
            newall_values.bg = string.lower(newall_values.bg)
            newall_values.fg = string.lower(newall_values.fg)

            local newdark_id = vim.api.nvim_get_hl_id_by_name("NewDark")
            local newdark_values = {
                bg = vim.fn.synIDattr(newdark_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newdark_id, "fg", "gui"),
            }
            newdark_values.bg = string.lower(newdark_values.bg)
            newdark_values.fg = string.lower(newdark_values.fg)

            assert.same(newall_values, { bg = C.color3, fg = C.color1 })
            assert.same(newdark_values, { bg = C.color0, fg = C.color2 })
        end

        local function assert_light()
            local C = require("neopywal.lib.palette").get("light", true, {})
            C.color1 = string.lower(C.color1)
            C.color3 = string.lower(C.color3)
            C.color4 = string.lower(C.color4)
            C.color7 = string.lower(C.color7)

            vim.cmd.highlight("clear")
            Neopywal.load("light")

            local newall_id = vim.api.nvim_get_hl_id_by_name("NewAll")
            local newall_values = {
                bg = vim.fn.synIDattr(newall_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newall_id, "fg", "gui"),
            }
            newall_values.bg = string.lower(newall_values.bg)
            newall_values.fg = string.lower(newall_values.fg)

            local newlight_id = vim.api.nvim_get_hl_id_by_name("NewLight")
            local newlight_values = {
                bg = vim.fn.synIDattr(newlight_id, "bg", "gui"),
                fg = vim.fn.synIDattr(newlight_id, "fg", "gui"),
            }
            newlight_values.bg = string.lower(newlight_values.bg)
            newlight_values.fg = string.lower(newlight_values.fg)

            assert.same(newall_values, { bg = C.color3, fg = C.color1 })
            assert.same(newlight_values, { bg = C.color7, fg = C.color4 })
        end

        assert_dark()
        assert_light()
    end)
    --: }}}
    --: can overwrite existing highlight group links {{{
    it("can overwrite existing highlight group links", function()
        vim.api.nvim_set_hl(0, "TestHighlightAll", { link = "Normal" })
        vim.api.nvim_set_hl(0, "TestHighlightDark", { link = "Normal" })
        vim.api.nvim_set_hl(0, "TestHighlightLight", { link = "Normal" })

        Neopywal.setup({
            custom_highlights = {
                all = {
                    TestHighlightAll = { fg = "#ff0000" },
                },
                dark = {
                    TestHighlightDark = { fg = "#00ff00" },
                },
                light = {
                    TestHighlightLight = { fg = "#0000ff" },
                },
            },
        })

        local function assert_dark()
            vim.cmd.highlight("clear")
            Neopywal.load("dark")

            local all_id = vim.api.nvim_get_hl_id_by_name("TestHighlightAll")
            local all_values = {
                fg = vim.fn.synIDattr(all_id, "fg", "gui"),
            }

            local dark_id = vim.api.nvim_get_hl_id_by_name("TestHighlightDark")
            local dark_values = {
                fg = vim.fn.synIDattr(dark_id, "fg", "gui"),
            }

            assert.same(all_values, { fg = "#ff0000" })
            assert.same(dark_values, { fg = "#00ff00" })
        end

        local function assert_light()
            vim.cmd.highlight("clear")
            Neopywal.load("light")

            local all_id = vim.api.nvim_get_hl_id_by_name("TestHighlightAll")
            local all_values = {
                fg = vim.fn.synIDattr(all_id, "fg", "gui"),
            }

            local light_id = vim.api.nvim_get_hl_id_by_name("TestHighlightLight")
            local light_values = {
                fg = vim.fn.synIDattr(light_id, "fg", "gui"),
            }

            assert.same(all_values, { fg = "#ff0000" })
            assert.same(light_values, { fg = "#0000ff" })
        end

        assert_dark()
        assert_light()
    end)
    --: }}}
    --: can overwrite styles {{{
    it("can overwrite styles", function()
        Neopywal.setup({
            styles = {
                comments = { "bold", "strikethrough" },
                loops = { "strikethrough" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            bold = vim.fn.synIDattr(comment_group_id, "bold", "cterm"),
            strikethrough = vim.fn.synIDattr(comment_group_id, "strikethrough", "cterm"),
        }
        assert.same(comment_values, { bold = "1", strikethrough = "1" })

        local repeat_group_id = vim.api.nvim_get_hl_id_by_name("Repeat")
        local repeat_group_values = {
            strikethrough = vim.fn.synIDattr(repeat_group_id, "strikethrough", "cterm"),
        }
        assert.same(repeat_group_values, { strikethrough = "1" })
    end)
    --: }}}
    --: can disable italic {{{
    it("can disable italic", function()
        Neopywal.setup({
            no_italic = true,
            styles = {
                comments = { "italic" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            italic = vim.fn.synIDattr(comment_group_id, "italic", "cterm"),
        }
        assert.are_not.same(comment_values, { italic = "1" })
    end)
    --: }}}
    --: can disable bold {{{
    it("can disable bold", function()
        Neopywal.setup({
            no_bold = true,
            styles = {
                comments = { "bold" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            bold = vim.fn.synIDattr(comment_group_id, "bold", "cterm"),
        }
        assert.are_not.same(comment_values, { bold = "1" })
    end)
    --: }}}
    --: can disable underline {{{
    it("can disable underline", function()
        Neopywal.setup({
            no_underline = true,
            styles = {
                comments = { "underline" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            underline = vim.fn.synIDattr(comment_group_id, "underline", "cterm"),
        }
        assert.are_not.same(comment_values, { underline = "1" })
    end)
    --: }}}
    --: can disable undercurl {{{
    it("can disable undercurl", function()
        Neopywal.setup({
            no_undercurl = true,
            styles = {
                comments = { "undercurl" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            undercurl = vim.fn.synIDattr(comment_group_id, "undercurl", "cterm"),
        }
        assert.are_not.same(comment_values, { undercurl = "1" })
    end)
    --: }}}
    --: can disable strikethrough {{{
    it("can disable strikethrough", function()
        Neopywal.setup({
            no_strikethrough = true,
            styles = {
                comments = { "strikethrough" },
            },
        })
        Neopywal.load()

        local comment_group_id = vim.api.nvim_get_hl_id_by_name("Comment")
        local comment_values = {
            strikethrough = vim.fn.synIDattr(comment_group_id, "strikethrough", "cterm"),
        }
        assert.are_not.same(comment_values, { strikethrough = "1" })
    end)
    --: }}}
    --: does not set terminal colors when terminal_colors is false {{{
    it("does not set terminal colors when terminal_colors is false", function()
        Neopywal.setup({ terminal_colors = false })
        Neopywal.load()

        for i = 0, 15 do
            assert.is_nil(vim.g["terminal_color_" .. i])
        end
    end)
    --: }}}
    --: sets terminal colors when terminal_colors is true {{{
    it("sets terminal colors when terminal_colors is true", function()
        Neopywal.setup({ terminal_colors = true })
        Neopywal.load()

        for i = 0, 15 do
            assert.is_not_nil(vim.g["terminal_color_" .. i])
        end
    end)
    --: }}}
end)
