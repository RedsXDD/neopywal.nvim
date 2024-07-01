local M = {}

function M.get()
	-- folke/lazy.nvim
	return {
		LazyProgressDone = { link = "Variable" },
		LazySpecial = { link = "SpecialChar" },
		LazyDir = { link = "Directory" },
		LazyValue = { link = "String" },
		LazyUrl = { link = "LazyDir" },
		LazyDimmed = { link = (O.dim_inactive and "NormalNC" or "Conceal") },
		LazyCommit = { link = "Identifier" },
		LazyH1 = { bg = U.blend(C.background, C.foreground, 0.7), styles = { "bold" } }, -- Non-selected buttons.
		LazyH2 = { styles = { "bold" } },
		LazyButton = { bg = U.blend(C.background, C.foreground, 0.9), styles = { "bold" } }, -- Selected buttons.
		LazyReasonRuntime = { link = "Macro" },
		LazyReasonRequire = { link = "Include" },
		LazyButtonActive = { link = "LazyH1" },
		LazyReasonStart = { fg = C.color2 },
	}
end

return M
