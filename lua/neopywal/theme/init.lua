local M = {}

M.get_highlights = function(colors)
	local theme = vim.tbl_deep_extend("force",
		require("neopywal.theme.ui").get(colors),
		require("neopywal.theme.syntax").get(colors),
		require("neopywal.theme.fileformats").get(colors),
		require("neopywal.theme.plugins").get(colors),
		{})

	return theme
end

return M
