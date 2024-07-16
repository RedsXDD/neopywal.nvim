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
		CmpItemKindKeyword = { fg = C.color1 }, -- Link Keyword
		CmpItemKindOperator = { fg = C.color1 }, -- Link Operator
		CmpItemKindEnum = { link = "CmpItemKindKeyword" },
		CmpItemKindFunction = { fg = C.color2 }, -- Link Function
		CmpItemKindField = { fg = C.color2 }, -- Link @variable.member
		CmpItemKindProperty = { fg = C.color2 }, -- Link @property
		CmpItemKindMethod = { link = "CmpItemKindFunction" },
		CmpItemKindColor = { fg = C.color3 },
		CmpItemKindInterface = { fg = C.color4 },
		CmpItemKindFolder = { fg = C.color4 }, -- Link Directory
		CmpItemKindVariable = { fg = C.color4 }, -- Link Variable
		CmpItemKindEvent = { link = "CmpItemKindVariable" },
		CmpItemKindConstructor = { fg = C.color5 }, -- Link Special
		CmpItemKindModule = { fg = C.color5 }, -- Link Include
		CmpItemKindUnit = { fg = C.color5 }, -- Link Number
		CmpItemKindSnippet = { link = "CmpItemKindModule" },
		CmpItemKindClass = { fg = C.color6 }, -- Link StorageClass
		CmpItemKindStruct = { fg = C.color6 }, -- Link Structure
		CmpItemKindCopilot = { fg = C.color6 },
		CmpItemKindTabNine = { fg = C.color6 },
		CmpItemKindTypeParameter = { fg = U.blend(C.color1, C.color3, 0.5) }, -- Link Identifier
		CmpItemKindConstant = { fg = U.blend(C.color1, C.color3, 0.5) }, -- Link Constant
		CmpItemKindValue = { link = "CmpItemKindConstant" },
		CmpItemKindEnumMember = { link = "CmpItemKindConstant" },
		CmpItemKindText = { fg = U.lighten(C.background, 30) },
		CmpItemKindFile = { link = "CmpItemKindText" },
		CmpItemKindReference = { link = "CmpItemKindText" },
	}
end

return M
