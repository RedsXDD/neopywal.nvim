local M = {}

function M.get()
	-- echasnovski/mini.cursorword
	return {
		MiniCursorword = { styles = O.plugins.mini.cursorword.style or {} },
		MiniCursorwordCurrent = { link = "MiniCursorword" },
	}
end

return M
