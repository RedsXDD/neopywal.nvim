local M = {}

function M.get()
	-- lewis6991/gitsigns.nvim
	return {
		GitSignsAdd = { fg = C.diff_added },
		GitSignsChange = { fg = C.diff_changed },
		GitSignsDelete = { fg = C.diff_removed },
		GitSignsChangedelete = { fg = U.blend(C.color1, C.color3, 0.5) },
		GitSignsUntracked = { fg = C.diff_untracked },
		GitSignsAddLn = { link = "GitSignsAdd" },
		GitSignsChangeLn = { link = "GitSignsChange" },
		GitSignsChangedeleteNr = { link = "GitSignsChangedelete" },
		GitSignsUntrackedNr = { link = "GitSignsUntracked" },
		GitSignsChangedeleteLn = { link = "GitSignsChangedelete" },
		GitSignsUntrackedLn = { link = "GitSignsUntracked" },
		GitSignsStagedAdd = { link = "GitSignsAdd" },
		GitSignsStagedChange = { link = "GitSignsChange" },
		GitSignsStagedDelete = { link = "GitSignsDelete" },
		GitSignsStagedChangedelete = { link = "GitSignsChangedelete" },
		GitSignsStagedTopdelete = { link = "GitSignsStagedDelete" },
		GitSignsStagedAddNr = { link = "GitSignsStagedAdd" },
		GitSignsStagedChangeNr = { link = "GitSignsStagedChange" },
		GitSignsStagedDeleteNr = { link = "GitSignsStagedDelete" },
		GitSignsStagedChangedeleteNr = { link = "GitSignsStagedChangedelete" },
		GitSignsStagedTopdeleteNr = { link = "GitSignsStagedDeleteNr" },
		GitSignsStagedAddLn = { link = "GitSignsAddLn" },
		GitSignsStagedChangeLn = { link = "GitSignsChangeLn" },
		GitSignsStagedChangedeleteLn = { link = "GitSignsChangedeleteLn" },
		GitSignsAddPreview = { link = "GitSignsAdd" },
		GitSignsDeletePreview = { link = "GitSignsDelete" },
		GitSignsDeleteVirtLn = { link = "GitSignsDelete" },
		GitSignsDeleteVirtLnInLine = { link = "GitSignsDelete" },
	}
end

return M
