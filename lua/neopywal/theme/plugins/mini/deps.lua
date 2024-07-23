local M = {}

function M.get()
	return {
		MiniDepsChangeAdded = { fg = C.diff_added },
		MiniDepsChangeRemoved = { fg = C.diff_removed },
		MiniDepsHint = { fg = C.hint },
		MiniDepsInfo = { fg = C.info },
		MiniDepsMsgBreaking = { fg = C.warn },
		MiniDepsPlaceholder = { fg = C.comment },
		MiniDepsTitle = { link = "Title" },
		MiniDepsTitleError = { bg = C.error, fg = C.background },
		MiniDepsTitleSame = { fg = C.comment },
		MiniDepsTitleUpdate = { bg = C.color2, fg = C.background },
	}
end

return M
