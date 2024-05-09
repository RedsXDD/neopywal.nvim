local M = {}

M.get_highlights = function(colors)
	local theme = vim.tbl_deep_extend("force",
		require("neopywal.groups.ui").get(colors),
		require("neopywal.groups.syntax").get(colors),
		require("neopywal.groups.fileformats").get(colors),
		require("neopywal.groups.plugins").get(colors),
		{})

	return theme
end

return M
