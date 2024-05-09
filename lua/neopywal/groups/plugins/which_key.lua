local M = {}

M.get = function(colors)
	return {
		-- folke/which-key.nvim
		WhichKey          = { fg = colors.color1 },
		WhichKeyGroup     = { fg = colors.color11 },
		WhichKeyDesc      = { fg = colors.color6 },
		WhichKeySeperator = { link = "Comment" },
		WhichKeyValue     = { link = "Comment" },
		WhichKeyBorder    = { link = "FloatBorder" },
		WhichKeyFloat     = { link = "NormalFloat" },
	}
end

return M
