local M = {}

M.get = function(colors)
	return {
		-- Git Commit:
		gitcommitSummary   = { fg = colors.color1 },
		gitcommitUntracked = { fg = colors.color8 },
		gitcommitDiscarded = { fg = colors.color8 },
		gitcommitSelected  = { fg = colors.color8 },
		gitcommitUnmerged  = { fg = colors.color8 },
		gitcommitOnBranch  = { fg = colors.color8 },
		gitcommitArrow     = { fg = colors.color8 },
	}
end

return M
