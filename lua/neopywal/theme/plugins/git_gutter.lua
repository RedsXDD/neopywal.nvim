local M = {}

function M.get()
	return {
		GitGutterAdd = { fg = C.diff_added },
		GitGutterChange = { fg = C.diff_changed },
		GitGutterDelete = { fg = C.diff_removed },
		GitGutterChangeDelete = { fg = U.blend(C.color1, C.color3, 0.5) },
	}
end

return M
