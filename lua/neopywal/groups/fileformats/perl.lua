local M = {}

M.get = function(colors)
	return {
		-- Perl:
		-- builtin: https://github.com/vim-perl/vim-perl
		perlStatementPackage    = { fg = colors.color1 },
		perlStatementInclude    = { fg = colors.color1 },
		perlStatementStorage    = { fg = colors.color1 },
		perlStatementList       = { fg = colors.color1 },
		perlMatchStartEnd       = { fg = colors.color1 },
		perlVarSimpleMemberName = { fg = colors.color2 },
		perlVarSimpleMember     = { fg = colors.foreground },
		perlMethod              = { fg = colors.color2 },
		podVerbatimLine         = { fg = colors.color2 },
		podCmdText              = { fg = colors.color3 },
		perlVarPlain            = { fg = colors.foreground },
		perlVarPlain2           = { fg = colors.foreground },
	}
end

return M
