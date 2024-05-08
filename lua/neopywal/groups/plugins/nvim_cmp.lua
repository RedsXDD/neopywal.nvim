local M = {}

M.get = function(colors)
	return {
		-- hrsh7th/nvim-cmp
		CmpDocumentationBorder    = { link = "FloatBorder" },
		CmpItemAbbr               = { fg = colors.foreground },
		CmpItemAbbrDeprecated     = { fg = colors.color2 },
		CmpItemAbbrMatch          = { fg = colors.color4 },
		CmpItemAbbrMatchFuzzy     = { fg = colors.color5 },
		CmpItemKind               = { fg = colors.color4 },
	}
end

return M
