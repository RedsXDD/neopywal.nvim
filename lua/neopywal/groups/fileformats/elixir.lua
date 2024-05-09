local M = {}

M.get = function(colors)
	return {
		-- Elixir:
		-- vim-elixir: https://github.com/elixir-editors/vim-elixir
		elixirStringDelimiter        = { fg = colors.color3 },
		elixirKeyword                = { fg = colors.color1 },
		elixirInterpolation          = { fg = colors.color5 },
		elixirInterpolationDelimiter = { fg = colors.color5 },
		elixirSelf                   = { fg = colors.color4, italic = true },
		elixirPseudoVariable         = { fg = colors.color11, italic = true },
		elixirModuleDefine           = { fg = colors.color1 },
		elixirBlockDefinition        = { fg = colors.color1 },
		elixirDefine                 = { fg = colors.color1 },
		elixirPrivateDefine          = { fg = colors.color1 },
		elixirGuard                  = { fg = colors.color1 },
		elixirPrivateGuard           = { fg = colors.color1 },
		elixirProtocolDefine         = { fg = colors.color1 },
		elixirImplDefine             = { fg = colors.color1 },
		elixirRecordDefine           = { fg = colors.color1 },
		elixirPrivateRecordDefine    = { fg = colors.color1 },
		elixirMacroDefine            = { fg = colors.color1 },
		elixirPrivateMacroDefine     = { fg = colors.color1 },
		elixirDelegateDefine         = { fg = colors.color1 },
		elixirOverridableDefine      = { fg = colors.color1 },
		elixirExceptionDefine        = { fg = colors.color1 },
		elixirCallbackDefine         = { fg = colors.color1 },
		elixirStructDefine           = { fg = colors.color1 },
		elixirExUnitMacro            = { fg = colors.color1 },
	}
end

return M
