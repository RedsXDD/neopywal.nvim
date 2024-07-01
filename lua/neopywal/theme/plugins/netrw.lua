local M = {}

function M.get()
	-- vim.org/netrw
	-- https://www.vim.org/scripts/script.php?script_id=1075
	-- prichrd/netrw.nvim
	return {
		netrwGray = { fg = C.color8 },
		netrwClassify = { link = "Directory" },
		netrwLink = { link = "netrwGray" },
		netrwSymLink = { fg = C.color6 },
		netrwList = { fg = C.color5 },
		netrwHidePat = { link = "netrwList" },
		netrwTreeBar = { link = "netrwGray" },
		netrwExe = { link = "Keyword" },
		netrwHelpCmd = { link = "Identifier" },
		netrwMarkFile = { link = "Identifier" },
	}
end

return M
