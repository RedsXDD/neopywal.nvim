local M = {}

function M.get()
	-- nvim-telescope/telescope.nvim
	return {
		TelescopeSelection = { link = "CursorLine" },
		TelescopePromptBorder = { link = "TelescopeBorder" },
		TelescopePromptPrefix = { fg = C.color4, styles = { "bold" } },
		TelescopePreviewTitle = { fg = C.color3 },
		TelescopePromptTitle = { fg = C.color4 },
		TelescopeResultsTitle = { fg = C.color6 },
		TelescopeSelectionCaret = { bg = U.blend(C.background, C.foreground, 0.9), fg = C.color6 },
	}
end

return M
