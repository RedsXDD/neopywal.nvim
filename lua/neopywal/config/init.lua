local M = {}

M.get_highlights = function(colors)
	local theme = vim.tbl_deep_extend("force",
		require("neopywal.config.ui").get(colors),
		require("neopywal.config.syntax").get(colors),
		require("neopywal.config.fileformats").get(colors),
		require("neopywal.config.plugins").get(colors),
		{})

	return theme
end

return M
