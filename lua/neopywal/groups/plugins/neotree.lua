local M = {}

M.get = function(colors)
	return {
		-- nvim-neo-tree/neo-tree.nvim
		NeoTreeDirectoryName        = { link = "Directory" },
		NeoTreeDirectoryIcon        = { link = "Directory" },
		NeoTreeNormal               = { link = "Normal" },
		NeoTreeNormalNC             = { link = "NormalNC" },
		NeoTreeExpander             = { link = "Comment" },
		NeoTreeIndentMarker         = { link = "NeoTreeExpander" },
		NeoTreeRootName             = { link = "Directory" },
		NeoTreeSymbolicLinkTarget   = { fg = colors.color6 },
		NeoTreeModified             = { fg = colors.color11 },

		NeoTreeGitIgnored           = { link = "Comment" },
		NeoTreeGitModified          = { link = "NeoTreeModified" },
		NeoTreeGitAdded             = { link = "GitGutterAdd" },
		NeoTreeGitConflict          = { link = "GitGutterDelete" },
		NeoTreeGitDeleted           = { link = "GitGutterDelete" },
		NeoTreeGitUnstaged          = { link = "GitGutterDelete" },
		NeoTreeGitUntracked         = { link = "GitGutterChangeDelete" },
		NeoTreeGitStaged            = { link = "GitGutterAdd" },

		NeoTreeFloatBorder          = { link = "FloatBorder" },
		NeoTreeFloatTitle           = { link = "FloatTitle" },
		NeoTreeTitleBar             = { bg = colors.color4, fg = colors.background },
		NeoTreeFileNameOpened       = { fg = colors.color5 },
		NeoTreeDimText              = { link = "Comment" },
		NeoTreeFilterTerm           = { fg = colors.color2, bold = true },
		NeoTreeTabActive            = { fg = colors.color13, bold = true },
		NeoTreeTabInactive          = { bg = colors.color8, fg = colors.color7 },
		NeoTreeTabSeparatorActive   = { fg = colors.background },
		NeoTreeTabSeparatorInactive = { bg = colors.color8, fg = colors.color8 },
		NeoTreeVertSplit            = { bg = colors.color8, fg = colors.background },
		NeoTreeStatusLineNC         = { fg = colors.background },
		NeoTreeDotfile              = { link = "Normal" },
		NeoTreeHiddenByName         = { link = "Normal" }, -- links to NeoTreeDotfile
		NeoTreeWindowsHidden        = { link = "Normal" }, -- links to NeoTreeDotfile
		NeoTreeCursorLine           = { link = "CursorLine" },
		NeoTreeFileIcon             = { link = "NeoTreeDirectoryIcon" },
		NeoTreePreview              = { link = "Search" },
		NeoTreeGitRenamed           = { link = "NeoTreeGitModified" },
		NeoTreeFileStats            = { link = "Comment" },
		NeoTreeFileStatsHeader      = { link = "Comment", bold = true },
		NeoTreeSignColumn           = { link = "SignColumn" },
		NeoTreeStatusLine           = { link = "StatusLine" },
		NeoTreeWinSeparator         = { link = "WinSeparator" },
		NeoTreeEndOfBuffer          = { link = "EndOfBuffer" },
		NeoTreeFloatNormal          = { link = "NormalFloat" },
		NeoTreeBufferNumber         = { link = "SpecialChar" },
		NeoTreeMessage              = { link = "Comment", italic = true },
		NeoTreeFadeText1            = { link = "Comment" },
	}
end

return M
