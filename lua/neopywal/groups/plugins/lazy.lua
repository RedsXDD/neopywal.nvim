local M = {}

M.get = function(colors)
	return {
		-- Lazy.nvim
		LazyProgressTodo  = { link = "LineNr" },
		LazyProgressDone  = { link = "Constant" },
		LazySpecial       = { link = "@punctuation.special" },
		LazyDir           = { link = "@markup.link" },
		LazyNoCond        = { link = "DiagnosticWarn" },
		LazyNormal        = { link = "NormalFloat" },
		LazyValue         = { link = "@string" },
		LazyUrl           = { link = "@markup.link" },
		LazyLocal         = { link = "Constant" },
		LazyProp          = { link = "Conceal" },
		LazyDimmed        = { link = "Conceal" },
		LazyCommitType    = { link = "Title" },
		LazyCommitIssue   = { link = "Number" },
		LazyCommitScope   = { italic = true },
		LazyCommit        = { link = "@variable.builtin" },
		LazyH1            = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		LazyH2            = { bold = true },
		LazyReasonRuntime = { link = "@macro" },
		LazyComment       = { link = "Comment" },
		LazyReasonRequire = { link = "@variable.parameter" },
		LazyReasonImport  = { link = "Identifier" },
		LazyReasonCmd     = { link = "Operator" },
		LazyReasonFt      = { link = "Character" },
		LazyButton        = { bg = colors.color8, bold = true },
		LazyReasonSource  = { link = "Character" },
		LazyButtonActive  = { link = "LazyH1" },
		LazyReasonStart   = { link = "@variable.member" },
		LazyTaskOutput    = { link = "MsgArea" },
		LazyReasonKeys    = { link = "Statement" },
		LazyReasonEvent   = { link = "Constant" },
		LazyReasonPlugin  = { link = "Special" },
		LazyTaskError     = { link = "ErrorMsg" },
		LazyBackdrop      = { bg = "#000000" },
	}
end

return M
