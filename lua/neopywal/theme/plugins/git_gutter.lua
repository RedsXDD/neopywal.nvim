local M = {}

function M.get()
	-- airblade/vim-gitgutter
	return {
		GitGutterAdd = { link = "DiffAdd" },
		GitGutterChange = { link = "DiffChange" },
		GitGutterDelete = { link = "DiffDelete" },
		GitGutterChangeDelete = { fg = C.color5 },
	}
end

return M
