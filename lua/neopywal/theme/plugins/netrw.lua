local M = {}

function M.get()
	return {
		netrwGray = { fg = C.color8 },
		netrwClassify = { link = "Directory" },
		netrwLink = { link = "netrwGray" },
		netrwSymLink = { fg = C.color6 },
		netrwList = { fg = C.color5 },
		netrwHidePat = { link = "netrwList" },
		netrwTreeBar = { link = "netrwGray" },
		netrwExe = { fg = C.keyword },
		netrwHelpCmd = { fg = C.identifier },
		netrwMarkFile = { fg = C.identifier },
	}
end

return M
