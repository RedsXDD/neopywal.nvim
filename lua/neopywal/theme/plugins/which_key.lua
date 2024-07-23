local M = {}

function M.get()
	return {
		WhichKey = { fg = C.color1 },
		WhichKeyBorder = { link = "FloatBorder" },
		WhichKeyDesc = { fg = C.foreground },
		WhichKeyFloat = { link = "WhichKeyNormal" },
		WhichKeyGroup = { fg = C.color6 },
		WhichKeyNormal = { bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.dim_bg },
		WhichKeySeperator = { link = "WhichKeyValue" },
		WhichKeyValue = { fg = C.comment },
	}
end

return M
