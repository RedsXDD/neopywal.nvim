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

    it("works with default options", function()
        assert.equals(pcall(function() Neopywal.setup() end), true)
        assert.equals(pcall(function() Neopywal.load() end), true)
        assert.same(Config.options, Config.default_options)
    end)

    it("doesn't change default options", function()
        Neopywal.setup({ transparent_background = true })
        assert.are_not.equals(Config.options.transparent_background, Config.default_options.transparent_background)
    end)

    it("can overwrite fileformats", function()
        Neopywal.setup({ fileformats = { lua = not Config.default_options.fileformats.lua } })
        assert.are_not.equals(Config.options.fileformats.lua, Config.default_options.fileformats.lua)
    end)

    it("can overwrite plugins", function()
        Neopywal.setup({ plugins = { coc = not Config.default_options.plugins.coc } })
        assert.are_not.equals(Config.options.plugins.coc, Config.default_options.plugins.coc)
    end)

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

    it("treesitter disables fileformats", function()
        Neopywal.setup({ plugins = { treesitter = true } })
        assert.same(Config.options.default_fileformats, false)
    end)

    it("disabling treesitter enables fileformats", function()
        Neopywal.setup({ plugins = { treesitter = false } })
        assert.same(Config.options.default_fileformats, true)
    end)

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

    it("can override colors", function()
        Neopywal.setup({
            custom_colors = {
                comment = "#ff0000",
            },
        })

        local C = require("neopywal.lib.palette").get()
        assert.same(C.comment, "#ff0000")
    end)

    it("can override colors using a function", function()
        Neopywal.setup({
            custom_colors = function(C)
                return {
                    comment = C.color1,
                }
            end,
        })

        local C = require("neopywal.lib.palette").get()
        assert.same(C.comment, C.color1)
    end)

    it("can create new colors", function()
        Neopywal.setup({
            custom_colors = {
                test_color = "#ff0000",
            },
        })

        local C = require("neopywal.lib.palette").get()
        assert.same(C.test_color, "#ff0000")
    end)

    it("can create new colors using a function", function()
        Neopywal.setup({
            custom_colors = function(C)
                return {
                    test_color = C.color1,
                }
            end,
        })

        local C = require("neopywal.lib.palette").get()
        assert.same(C.test_color, C.color1)
    end)

    it("can override highlights groups", function()
        Neopywal.setup({
            custom_highlights = {
                Search = { fg = "#ff0000", bg = "#000000" },
                ColorColumn = { bg = "#ff0000" },
            },
        })
        Neopywal.load()

        local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
        local search_values = {
            bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
            fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
        }
        assert.same(search_values, { bg = "#000000", fg = "#ff0000" })

        local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
        local color_column_values = {
            bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
        }
        assert.same(color_column_values, { bg = "#ff0000" })
    end)

    it("can override highlights groups using a function", function()
        Neopywal.setup({
            custom_highlights = function(C)
                return {
                    Search = { fg = C.color1, bg = C.color0 },
                    ColorColumn = { bg = C.color1 },
                }
            end,
        })
        Neopywal.load()

        local C = require("neopywal.lib.palette").get("dark", true, {})
        C.color0 = string.lower(C.color0)
        C.color1 = string.lower(C.color1)
        local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
        local search_values = {
            bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
            fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
        }
        search_values.bg = string.lower(search_values.bg)
        search_values.fg = string.lower(search_values.fg)
        assert.same(search_values, { bg = C.color0, fg = C.color1 })

        local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
        local color_column_values = {
            bg = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
        }
        color_column_values.bg = string.lower(color_column_values.bg)
        assert.same(color_column_values, { bg = C.color1 })
    end)

    it("can create hightlights if they don't exist", function()
        Neopywal.setup({
            custom_highlights = {
                Search = { fg = "#ff0000", bg = "#000000" },
                New = { bg = "#ff0000" },
            },
        })
        Neopywal.load()

        local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
        local search_values = {
            bg = vim.fn.synIDattr(search_group_id, "bg", "gui"),
            fg = vim.fn.synIDattr(search_group_id, "fg", "gui"),
        }
        assert.same(search_values, { bg = "#000000", fg = "#ff0000" })

        local new_group_id = vim.api.nvim_get_hl_id_by_name("New")
        local new_group_values = {
            bg = vim.fn.synIDattr(new_group_id, "bg", "gui"),
        }
        assert.same(new_group_values, { bg = "#ff0000" })
    end)

    it("can override existing highlight group links", function()
        vim.api.nvim_set_hl(0, "TestHighlight", { link = "Normal" })
        Neopywal.setup({
            custom_highlights = {
                TestHighlight = { fg = "#ff0000", bg = nil },
            },
        })
        Neopywal.load()

        local group_id = vim.api.nvim_get_hl_id_by_name("TestHighlight")
        local values = {
            fg = vim.fn.synIDattr(group_id, "fg", "gui"),
        }
        assert.same({ fg = "#ff0000" }, values)
    end)

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

    it("does not set terminal colors when terminal_colors is false", function()
        Neopywal.setup({ terminal_colors = false })
        Neopywal.load()

        for i = 0, 15 do
            assert.is_nil(vim.g["terminal_color_" .. i])
        end
    end)

    it("sets terminal colors when terminal_colors is true", function()
        Neopywal.setup({ terminal_colors = true })
        Neopywal.load()

        for i = 0, 15 do
            assert.is_not_nil(vim.g["terminal_color_" .. i])
        end
    end)
end)
