local M = {}

function M.get()
	-- lukas-reineke/indent-blankline.nvim
	return {
		IblIndent = { fg = C.comment },
		IblScope = { link = "IblIndent" },
	}
end

return M
