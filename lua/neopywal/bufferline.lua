-- vim:fileencoding=utf-8:foldmethod=marker

-- Bufferline: akinsho/bufferline.nvim
-- Reference: see `:h bufferline-highlights`

local M = {}
local O = require("neopywal").options
local U = require("neopywal.util")
local colors = require("neopywal").get_colors()

local fill_bg = O.transparent and colors.background or U.blend(colors.background, colors.foreground, 0.9)
local unselected_bg = O.transparent and colors.none or U.blend(colors.background, colors.foreground, 0.85)
local selected_bg = O.transparent and colors.none or colors.background

local default_options = {
	-- Filler background color of tabline.
	fill = { bg = fill_bg },

	-- Separators.
	separator = { bg = unselected_bg, fg = fill_bg }, -- Separator for non-selected buffers.
	separator_visible = { bg = unselected_bg, fg = fill_bg }, -- Separator for selected buffer on non-current windows.
	separator_selected = { bg = selected_bg, fg = fill_bg }, -- Separator for selected buffer.
	tab_separator = { bg = unselected_bg, fg = fill_bg }, -- Separator for non-selected tabs.
	tab_separator_selected = { bg = selected_bg, fg = fill_bg }, -- Separator for selected tab.
	offset_separator = { bg = colors.color1, fg = colors.color1 }, -- Offset separator for buffers.

	-- Modified icon.
	modified = { bg = unselected_bg, fg = colors.color8 }, -- Icon color for non-selected modified buffers.
	modified_visible = { bg = unselected_bg, fg = colors.color8 }, -- Icon color for selected modified buffer on non-current windows.
	modified_selected = {
		bg = selected_bg,
		fg = U.blend(colors.color1, colors.color3, 0.5),
	}, -- Icon color for selected modified buffer.

	-- String that's duplicated from two buffers.
	duplicate = { bg = unselected_bg, fg = colors.color8 }, -- String from a non-selected buffer that's duplicated.
	duplicate_visible = { bg = unselected_bg, fg = colors.color8 }, -- String from a non-current buffer that's duplicated.
	-- duplicate_selected = {}, -- String of a selected buffer that's duplicated.

	-- BufferLinePick command.
	pick = { bg = unselected_bg, fg = colors.color6, bold = true, italic = true }, -- Pick selector for non-selected buffers.
	pick_visible = { bg = unselected_bg, fg = colors.color6, bold = true, italic = true }, -- Pick selector for selected buffer on non-current windows.
	pick_selected = { bg = colors.background, fg = colors.color6, bold = true, italic = true }, -- Pick selector for selected buffer.

	-- Truncation marker.
	trunc_marker = { bg = unselected_bg, fg = colors.color8 },

	-- Close button.
	close_button = { bg = unselected_bg, fg = colors.color8 }, -- Close button non-selected buffers.
	close_button_visible = { bg = unselected_bg, fg = colors.color8 }, -- Close button for selected buffer on non-current windows.
	close_button_selected = { fg = colors.color1 }, -- Close button for selected buffer.
	tab_close = { bg = colors.color1, fg = colors.background }, -- Tab close button.

	-- Numbers.
	numbers = { bg = unselected_bg, fg = colors.color8 }, -- Numbers for non-selected buffers.
	numbers_visible = { bg = unselected_bg, fg = colors.color8 }, -- Numbers for selected buffer on non-current windows.
	-- numbers_selected = {}, -- Numbers for selected buffer.

	-- Buffers.
	background = { bg = unselected_bg, fg = colors.color8 }, -- Non-selected buffers.
	buffer_visible = { bg = unselected_bg, fg = colors.color8 }, -- Non-current buffers windows.
	-- buffer_selected = {}, -- Selected buffer.

	-- Tabs.
	tab = { bg = unselected_bg, fg = U.blend(colors.background, colors.foreground, 0.5) }, -- Text for non-selected tabs.
	tab_selected = { bg = selected_bg, fg = colors.foreground, bold = true, italic = true }, -- Text on selected tab.

	-- Indicator.
	-- indicator_visible = {},
	-- indicator_selected = {},

	-- Diagnostics.
	diagnostic = { bg = unselected_bg, fg = colors.color8 },
	diagnostic_visible = { bg = unselected_bg, fg = colors.color8 },
	-- diagnostic_selected = {},

	-- Buffer with errors.
	error = { bg = unselected_bg, fg = colors.color8 }, -- Non-selected buffers with errors.
	error_visible = { bg = unselected_bg, fg = colors.color8 }, -- Selected buffer with errors on non-current windows.
	-- error_selected = {}, -- Selected buffer with errors.
	error_diagnostic = { bg = unselected_bg, fg = colors.color8 },
	error_diagnostic_visible = { bg = unselected_bg, fg = colors.color8 },
	-- error_diagnostic_selected = {},

	-- Buffer with warnings.
	warning = { bg = unselected_bg, fg = colors.color8 }, -- Non-selected buffers with warnings.
	warning_visible = { bg = unselected_bg, fg = colors.color8 }, -- Selected buffer with warnings on non-current windows.
	-- warning_selected = {}, -- Selected buffer with warnings.
	warning_diagnostic = { bg = unselected_bg, fg = colors.color8 },
	warning_diagnostic_visible = { bg = unselected_bg, fg = colors.color8 },
	-- warning_diagnostic_selected = {},

	-- Buffer with hints.
	hint = { bg = unselected_bg, fg = colors.color8 }, -- Non-selected buffers with hints.
	hint_visible = { bg = unselected_bg, fg = colors.color8 }, -- Selected buffer with hints on non-current windows.
	-- hint_selected = {}, -- Selected buffer with hints.
	hint_diagnostic = { bg = unselected_bg, fg = colors.color8 },
	hint_diagnostic_visible = { bg = unselected_bg, fg = colors.color8 },
	-- hint_diagnostic_selected = {},

	-- Buffer with informations.
	info = { bg = unselected_bg, fg = colors.color8 }, -- Non-selected buffers with informations.
	info_visible = { bg = unselected_bg, fg = colors.color8 }, -- Selected buffer with informations on non-current windows.
	-- info_selected = {}, -- Selected buffer with informations.
	info_diagnostic = { bg = unselected_bg, fg = colors.color8 },
	info_diagnostic_visible = { bg = unselected_bg, fg = colors.color8 },
	-- info_diagnostic_selected = {},
}

function M.setup(user_conf)
	user_conf = user_conf or {}
	local highlights = vim.tbl_deep_extend("keep", {}, user_conf, default_options)
	return highlights
end

return M
