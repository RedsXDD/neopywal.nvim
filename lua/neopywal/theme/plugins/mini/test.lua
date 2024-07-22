local M = {}

function M.get()
	-- echasnovski/mini.test
	return {
		MiniTestEmphasis = { styles = { "bold" } },
		MiniTestFail = { fg = C.error, styles = { "bold" } },
		MiniTestPass = { fg = C.ok, styles = { "bold" } },
	}
end

return M
