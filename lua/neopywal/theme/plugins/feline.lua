-- vim:fileencoding=utf-8:foldmethod=marker:foldenable
-- Inspiration: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/feline.lua

---@type NeopywalPluginsFeline
---@diagnostic disable-next-line: missing-fields
local M = {}

local C = require("neopywal.lib.palette").get_colors()
local U = require("neopywal.utils.color")
local lsp = require("feline.providers.lsp")

M.default_options = {
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
}
M.options = M.default_options

---@param user_config NeopywalPluginsFelineOptions?
function M.setup(user_config)
    user_config = user_config or {}
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)
end

function M.get()
    if require("neopywal.lib.config").options.transparent_background then M.options.sett.bkg = "NONE" end

    local assets = M.options.assets
    local mode_colors = M.options.mode_colors
    local sett = M.options.sett
    local view = M.options.view

    local shortline = false
    local mode_text = require("neopywal").current_style == "light" and C.foreground or C.background

    local components = {
        active = { {}, {}, {} }, -- left, center, right
        inactive = { {} },
    }

    local invi_sep = {
        str = " ",
        hl = {
            fg = sett.bkg,
            bg = sett.bkg,
        },
    }

    local function is_enabled(min_width)
        if shortline then return true end
        return vim.api.nvim_win_get_width(0) > min_width
    end

    local is_lsp_in_excluded_list = function(lsp_name)
        for _, excluded_lsp in ipairs(M.options.view.lsp.exclude_lsp_names) do
            if lsp_name == excluded_lsp then return true end
        end
        return false
    end

    local function any_git_changes()
        local gitsigns = vim.b.gitsigns_status_dict
        local summary = vim.b.minidiff_summary

        local gst = (function()
            if gitsigns then
                return {
                    added = gitsigns.added,
                    removed = gitsigns.removed,
                    changed = gitsigns.changed,
                }
            elseif summary then
                return {
                    added = summary.add,
                    removed = summary.delete,
                    changed = summary.change,
                }
            end
        end)()

        if gst then
			-- stylua: ignore
			if gst["added"] and gst["added"] > 0 or gst["removed"] and gst["removed"] > 0 or gst["changed"] and gst["changed"] > 0 then
				return true
			end
        end

        return false
    end
    --: Left {{{
    --: Mode {{{
    local vi_mode_hl = function()
        return {
            fg = mode_text,
            bg = mode_colors[vim.fn.mode()][2],
            style = "bold",
        }
    end

    components.active[1][1] = {
        provider = assets.left_separator,
        hl = function()
            return {
                fg = mode_colors[vim.fn.mode()][2],
                bg = mode_text,
            }
        end,
    }

    components.active[1][2] = {
        provider = function() return assets.mode_icon .. " " .. mode_colors[vim.fn.mode()][1] end,
        hl = vi_mode_hl,
    }

    -- enable if git diffs are not available
    components.active[1][3] = {
        provider = assets.right_separator,
        hl = function()
            return {
                fg = mode_colors[vim.fn.mode()][2],
                bg = sett.bkg,
            }
        end,
        enabled = function() return not any_git_changes() end,
    }

    -- enable if git diffs are available
    components.active[1][4] = {
        provider = assets.right_separator,
        hl = function()
            return {
                fg = mode_colors[vim.fn.mode()][2],
                bg = sett.diffs,
            }
        end,
        enabled = function() return any_git_changes() end,
    }
    --: }}}
    --: Diffs {{{
    components.active[1][5] = {
        provider = "git_diff_added",
        hl = {
            fg = C.color2,
            bg = sett.diffs,
        },
        icon = " " .. assets.git.added .. " ",
    }

    components.active[1][6] = {
        provider = "git_diff_changed",
        hl = {
            fg = C.color6,
            bg = sett.diffs,
        },
        icon = " " .. assets.git.changed .. " ",
    }

    components.active[1][7] = {
        provider = "git_diff_removed",
        hl = {
            fg = C.color1,
            bg = sett.diffs,
        },
        icon = " " .. assets.git.removed .. " ",
    }

    components.active[1][8] = {
        provider = assets.right_separator,
        hl = {
            fg = sett.diffs,
            bg = sett.bkg,
        },
        enabled = function() return any_git_changes() end,
    }
    --: }}}
    --: Git Branch {{{
    components.active[1][9] = {
        provider = "git_branch",
        enabled = is_enabled(70),
        hl = {
            fg = sett.text,
            bg = sett.bkg,
        },
        icon = " " .. assets.git.branch .. " ",
        right_sep = {
            str = " |",
            hl = {
                fg = sett.text,
                bg = sett.bkg,
            },
        },
    }
    --: }}}
    --: Extras {{{
    --: Progress {{{
    components.active[1][10] = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "Top"
            elseif current_line == vim.fn.line("$") then
                return "Bot"
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return result .. "%%"
        end,
        -- enabled = shortline or function(winid)
        -- 	return vim.api.nvim_win_get_width(winid) > 90
        -- end,
        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },
        left_sep = invi_sep,
    }
    --: }}}
    --: Position {{{
    components.active[1][11] = {
        provider = "position",
        -- enabled = shortline or function(winid)
        -- 	return vim.api.nvim_win_get_width(winid) > 90
        -- end,
        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },
        left_sep = invi_sep,
    }
    --: }}}
    --: Macro {{{
    components.active[1][12] = {
        provider = "macro",
        enabled = function() return vim.api.nvim_get_option_value("cmdheight", { scope = "global" }) == 0 end,
        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },
        left_sep = invi_sep,
    }
    --: }}}
    --: Search Count {{{
    components.active[1][13] = {
        provider = "search_count",
        enabled = function() return vim.api.nvim_get_option_value("cmdheight", { scope = "global" }) == 0 end,
        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },
        left_sep = invi_sep,
    }
    --: }}}
    --: Lazy.nvim Updates {{{
    components.active[1][14] = {
        provider = function() return require("lazy.status").updates() end,
        enabled = function()
            if sett.show_lazy_updates and pcall(require, "lazy") then
                return require("lazy.status").has_updates()
            else
                return false
            end
        end,
        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },
        left_sep = invi_sep,
    }
    --: }}}
    --: }}}
    --: }}}
    --: Center {{{
    -- Diagnostics
    --: Workspace Loader {{{
    components.active[2][1] = {
        provider = function()
            if vim.lsp.status then return "" end
            local Lsp = vim.lsp.util.get_progress_messages()[1]

            if Lsp then
                local msg = Lsp.message or ""
                local percentage = Lsp.percentage
                if not percentage then return "" end
                local title = Lsp.title or ""
                local spinners = {
                    "",
                    "󰀚",
                    "",
                }
                local success_icon = {
                    "",
                    "",
                    "",
                }
                ---@diagnostic disable-next-line: undefined-field
                local ms = vim.loop.hrtime() / 1000000
                local frame = math.floor(ms / 120) % #spinners

                if percentage >= 70 then
                    return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
                end

                return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
            end

            return ""
        end,
        enabled = is_enabled(80) and view.lsp.progress == true,
        hl = {
            fg = C.color4,
            bg = sett.bkg,
        },
    }
    --: }}}
    --: General Diagnostics (errors, warnings. info and hints) {{{
    components.active[2][2] = {
        provider = "diagnostic_errors",
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,

        hl = {
            fg = C.error,
            bg = sett.bkg,
        },
        icon = " " .. assets.lsp.error .. " ",
    }

    components.active[2][3] = {
        provider = "diagnostic_warnings",
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
        hl = {
            fg = C.warn,
            bg = sett.bkg,
        },
        icon = " " .. assets.lsp.warning .. " ",
    }

    components.active[2][4] = {
        provider = "diagnostic_info",
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
        hl = {
            fg = C.info,
            bg = sett.bkg,
        },
        icon = " " .. assets.lsp.info .. " ",
    }

    components.active[2][5] = {
        provider = "diagnostic_hints",
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
        hl = {
            fg = C.hint,
            bg = sett.bkg,
        },
        icon = " " .. assets.lsp.hint .. " ",
    }
    --: }}}
    --: }}}
    --: Right {{{
    --: Active LSPs {{{
    components.active[3][1] = {
        provider = function()
            local active_clients = vim.lsp.get_clients({ bufnr = 0 })

            -- show an indicator that we have running lsps
            if view.lsp.name == false and next(active_clients) ~= nil then return assets.lsp.server .. " " .. "Lsp" end

            -- show the actual name of the running lsps
            local index = 0
            local lsp_names = ""
            for _, lsp_config in ipairs(active_clients) do
                if is_lsp_in_excluded_list(lsp_config.name) then goto continue end

                index = index + 1
                if index == 1 then
                    lsp_names = assets.lsp.server .. " " .. lsp_config.name
                else
                    lsp_names = lsp_names .. view.lsp.separator .. lsp_config.name
                end

                ::continue::
            end

            return lsp_names
        end,

        hl = {
            fg = sett.extras,
            bg = sett.bkg,
        },

        right_sep = invi_sep,
    }
    --: }}}
    --: Current File {{{
    components.active[3][2] = {
        provider = function()
            local filename = vim.fn.expand("%:t")
            local extension = vim.fn.expand("%:e")
            local present, icons = pcall(require, "nvim-web-devicons")
            local icon = present and icons.get_icon(filename, extension) or assets.file
            return (sett.show_modified and "%m" or "") .. " " .. icon .. " " .. filename .. " "
        end,
        enabled = is_enabled(70),
        hl = {
            fg = sett.text,
            bg = sett.curr_file,
        },
        left_sep = {
            str = assets.left_separator,
            hl = {
                fg = sett.curr_file,
                bg = sett.bkg,
            },
        },
    }
    --: }}}
    --: Current Directory {{{
    components.active[3][3] = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return assets.dir .. " " .. dir_name
        end,
        enabled = is_enabled(80),
        hl = {
            fg = mode_text,
            bg = sett.curr_dir,
        },
        left_sep = {
            str = assets.left_separator,
            hl = {
                fg = sett.curr_dir,
                bg = sett.curr_file,
            },
        },
        right_sep = {
            str = assets.right_separator,
            hl = {
                fg = sett.curr_dir,
                bg = mode_text,
            },
        },
    }
    --: }}}
    --: }}}
    --: Inactive {{{
    components.inactive[1][1] = {
        provider = function() return " " .. string.upper(vim.bo.ft) .. " " end,
        hl = {
            fg = C.foreground,
            bg = C.background,
        },
    }
    --: }}}
    return components
end

return M
