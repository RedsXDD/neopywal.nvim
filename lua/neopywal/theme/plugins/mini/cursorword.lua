local M = {}

function M.get()
	-- echasnovski/mini.cursorword
	return {
		MiniCursorword = { styles = { "underline" } },
		MiniCursorwordCurrent = { link = "MiniCursorword" },
	}
end

return M
