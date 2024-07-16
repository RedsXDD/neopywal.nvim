local M = {}

function M.get()
	return {
		MiniDiffSignAdd = { fg = C.diff_added },
		MiniDiffSignChange = { fg = C.diff_changed },
		MiniDiffSignDelete = { fg = C.diff_removed },
		MiniDiffOverAdd = { link = "MiniDiffSignAdd" },
		MiniDiffOverChange = { reverse = true },
		MiniDiffOverContext = { link = "MiniDiffSignChange" },
		MiniDiffOverDelete = { link = "MiniDiffSignDelete" },
	}
end

return M
