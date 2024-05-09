local M = {}

M.get = function(colors)
	return {
		-- ObjectiveC:
		-- builtin:
		objcModuleImport      = { fg = colors.color1 },
		objcException         = { fg = colors.color1 },
		objcProtocolList      = { fg = colors.foreground },
		objcDirective         = { fg = colors.color1 },
		objcPropertyAttribute = { fg = colors.color5 },
		objcHiddenArgument    = { fg = colors.foreground },
	}
end

return M
