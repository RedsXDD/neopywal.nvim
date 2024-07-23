local M = {}

function M.get()
	-- hrsh7th/nvim-cmp
	local kinds = require("neopywal.utils.kinds").get("CmpItemKind%s")
	return vim.tbl_deep_extend("force", kinds, {
		CmpItemAbbr = { fg = C.foreground },
		CmpItemAbbrDeprecated = { fg = C.color8, styles = { "strikethrough" } },
		CmpItemKind = { fg = C.foreground },
		CmpItemMenu = { fg = C.color2 },
		CmpItemAbbrMatch = { fg = C.special },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
	})
end

return M
