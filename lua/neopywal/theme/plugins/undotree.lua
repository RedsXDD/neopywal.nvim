local M = {}

function M.get()
	return {
		UndotreeSavedBig = { fg = C.color1, styles = { "bold" } },
		UndotreeNode = { fg = C.color4 },
		UndotreeNodeCurrent = { fg = C.color5 },
		UndotreeSeq = { fg = C.color2 },
		UndotreeCurrent = { fg = C.color4 },
		UndotreeNext = { fg = C.color3 },
		UndotreeTimeStamp = { fg = C.color8 },
		UndotreeHead = { fg = C.color5 },
		UndotreeBranch = { fg = C.color4 },
		UndotreeSavedSmall = { fg = C.color1 },
	}
end

return M
