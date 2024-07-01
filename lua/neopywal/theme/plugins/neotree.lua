local M = {}

function M.get()
	-- nvim-neo-tree/neo-tree.nvim
	return {
		NeoTreeDimText = { link = "Comment" },
		NeoTreeIndentMarker = { link = "NeoTreeDimText" },
		NeoTreeRootName = { link = "Directory" },
		NeoTreeSymbolicLinkTarget = { fg = C.color6 },
		NeoTreeModified = { link = "DiffChange" },

		NeoTreeGitAdded = { link = "DiffAdd" },
		NeoTreeGitConflict = { link = "DiagnosticError" },
		NeoTreeGitDeleted = { link = "DiffDelete" },
		NeoTreeGitIgnored = { link = "Comment" },
		NeoTreeGitModified = { link = "DiffChange" },
		NeoTreeGitUnstaged = { link = "DiagnosticHint" },
		NeoTreeGitUntracked = { fg = C.color5 },
		NeoTreeGitStaged = { link = "DiffAdd" },

		NeoTreeFloatTitle = { link = "FloatTitle" },
		NeoTreeTitleBar = { link = "FloatTitle" },

		NeoTreeTabActive = { link = "TabLineSel" },
		NeoTreeTabInactive = { link = "TabLine" },
		NeoTreeTabSeparatorActive = {
			bg = O.transparent_background and C.none or C.background,
			fg = O.transparent_background and C.none or C.background,
		},
		NeoTreeTabSeparatorInactive = {
			bg = O.transparent_background and C.none or U.darken(C.background, 5),
			fg = O.transparent_background and C.none or U.darken(C.background, 5),
		},
	}
end

return M
