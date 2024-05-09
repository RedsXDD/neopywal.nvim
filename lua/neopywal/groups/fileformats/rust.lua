local M = {}

M.get = function(colors)
	return {
		-- Rust:
		-- builtin: https://github.com/rust-lang/rust.vim
		rustStructure     = { fg = colors.color1 },
		rustIdentifier    = { fg = colors.color11, italic = true },
		rustModPath       = { fg = colors.color4, italic = true },
		rustModPathSep    = { fg = colors.color8 },
		rustSelf          = { fg = colors.color11, italic = true },
		rustSuper         = { fg = colors.color11, italic = true },
		rustDeriveTrait   = { fg = colors.color5 },
		rustEnumVariant   = { fg = colors.color5 },
		rustMacroVariable = { fg = colors.color11, italic = true },
		rustAssert        = { fg = colors.color2 },
		rustPanic         = { fg = colors.color2 },
		rustPubScopeCrate = { fg = colors.color4, italic = true },
		rustAttribute     = { fg = colors.color5 },
	}
end

return M
