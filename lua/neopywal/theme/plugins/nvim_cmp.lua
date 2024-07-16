local M = {}

function M.get()
	-- hrsh7th/nvim-cmp
	return {
		CmpItemAbbr = { fg = C.foreground },
		CmpItemAbbrDeprecated = { fg = C.color8, styles = { "strikethrough" } },
		CmpItemKind = { fg = C.foreground },
		CmpItemMenu = { fg = C.color2 },
		CmpItemAbbrMatch = { fg = C.special },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

		-- Kind support.
		CmpItemKindKeyword = { fg = C.keyword },
		CmpItemKindOperator = { fg = C.operator },
		CmpItemKindEnum = { link = "CmpItemKindKeyword" },
		CmpItemKindFunction = { fg = C.func },
		CmpItemKindField = { fg = C.variable },
		CmpItemKindProperty = { fg = C.func },
		CmpItemKindMethod = { link = "CmpItemKindFunction" },
		CmpItemKindColor = { fg = C.color3 },
		CmpItemKindInterface = { fg = C.color4 },
		CmpItemKindFolder = { fg = C.directory },
		CmpItemKindVariable = { fg = C.variable },
		CmpItemKindEvent = { link = "CmpItemKindVariable" },
		CmpItemKindConstructor = { fg = C.special },
		CmpItemKindModule = { fg = C.include },
		CmpItemKindUnit = { fg = C.number },
		CmpItemKindSnippet = { link = "CmpItemKindModule" },
		CmpItemKindClass = { fg = C.storageclass },
		CmpItemKindStruct = { fg = C.structure },
		CmpItemKindCopilot = { fg = C.color6 },
		CmpItemKindTabNine = { fg = C.color6 },
		CmpItemKindTypeParameter = { fg = C.identifier },
		CmpItemKindConstant = { fg = C.constant },
		CmpItemKindValue = { link = "CmpItemKindConstant" },
		CmpItemKindEnumMember = { link = "CmpItemKindConstant" },
		CmpItemKindText = { fg = U.lighten(C.background, 30) },
		CmpItemKindFile = { link = "CmpItemKindText" },
		CmpItemKindReference = { link = "CmpItemKindText" },
	}
end

return M
