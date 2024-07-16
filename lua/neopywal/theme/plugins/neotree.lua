local M = {}

function M.get()
	-- nvim-neo-tree/neo-tree.nvim
	return {
		NeoTreeDimText = { fg = C.comment },
		NeoTreeIndentMarker = { link = "NeoTreeDimText" },
		NeoTreeRootName = { link = "Directory" },
		NeoTreeSymbolicLinkTarget = { fg = C.color6 },
		NeoTreeModified = { fg = C.diff_changed },

		NeoTreeGitAdded = { fg = C.diff_added },
		NeoTreeGitConflict = { fg = C.error },
		NeoTreeGitDeleted = { fg = C.diff_removed },
		NeoTreeGitIgnored = { fg = C.comment },
		NeoTreeGitModified = { fg = C.diff_changed },
		NeoTreeGitUnstaged = { fg = C.hint },
		NeoTreeGitUntracked = { fg = C.diff_untracked },
		NeoTreeGitStaged = { fg = C.diff_added },

		NeoTreeFloatTitle = { link = "FloatTitle" },
		NeoTreeTitleBar = { link = "FloatTitle" },

		NeoTreeTabActive = { link = "TabLineSel" },
		NeoTreeTabInactive = { link = "TabLine" },
		NeoTreeTabSeparatorActive = {
			bg = O.transparent_background and C.none or C.background,
			fg = O.transparent_background and C.none or C.background,
		},
		NeoTreeTabSeparatorInactive = {
			bg = O.transparent_background and C.none or C.dim_bg,
			fg = O.transparent_background and C.none or C.dim_bg,
		},
	}
end

return M
