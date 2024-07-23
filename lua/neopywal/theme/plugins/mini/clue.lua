local M = {}

function M.get()
	return {
		MiniClueDescGroup = { fg = C.warn, styles = { "bold", "italic" } },
		MiniClueNextKey = { fg = C.hint, styles = { "bold", "italic" } },
		MiniClueNextKeyWithPostkeys = { fg = C.error, styles = { "bold", "italic" } },
		MiniClueSeparator = { fg = C.info, styles = { "bold", "italic" } },
	}
end

return M
