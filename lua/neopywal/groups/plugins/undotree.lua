local M = {}

M.get = function(colors)
	return {
		-- mbbill/undotree
		UndotreeSavedBig    = { fg = colors.color1, bold = true },
		UndotreeNode        = { fg = colors.color4 },
		UndotreeNodeCurrent = { fg = colors.color5 },
		UndotreeSeq         = { fg = colors.color2 },
		UndotreeCurrent     = { fg = colors.color4 },
		UndotreeNext        = { fg = colors.color3 },
		UndotreeTimeStamp   = { fg = colors.color8 },
		UndotreeHead        = { fg = colors.color5 },
		UndotreeBranch      = { fg = colors.color4 },
	}
end

return M
