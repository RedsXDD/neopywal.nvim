local M = {}

M.get = function(colors)
	return {
		-- liuchengxu/vim-which-key
		WhichKey          = { fg = colors.color1 },
		WhichKeyGroup     = { fg = colors.color11 },
		WhichKeyDesc      = { fg = colors.color6 },
		WhichKeySeperator = { link = "Comment" },
		WhichKeyValue     = { link = "Comment" },
		WhichKeySeparator = { link = "Comment" },
		WhichKeyBorder    = { link = "FloatBorder" },
	}
end

return M
