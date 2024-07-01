local M = {}

function M.get()
	-- folke/which-key.nvim
	return {
		WhichKey = { fg = C.color1 },
		WhichKeyGroup = { fg = C.color6 },
		WhichKeyDesc = { fg = C.foreground },
		WhichKeySeperator = { fg = U.blend(C.color1, C.color3, 0.5) },
		WhichKeyValue = { link = "Comment" },
		WhichKeySeparator = { link = "Comment" },
		WhichKeyBorder = { link = "FloatBorder" },
		WhichKeyFloat = { link = "NormalFloat" },
	}
end

return M
