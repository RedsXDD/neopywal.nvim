local M = {}

M.get = function(colors)
	return {
		-- OCaml:
		-- builtin: https://github.com/rgrinberg/vim-ocaml
		ocamlArrow         = { fg = colors.color1 },
		ocamlEqual         = { fg = colors.color1 },
		ocamlOperator      = { fg = colors.color1 },
		ocamlKeyChar       = { fg = colors.color1 },
		ocamlModPath       = { fg = colors.color2 },
		ocamlFullMod       = { fg = colors.color2 },
		ocamlModule        = { fg = colors.color4, italic = true },
		ocamlConstructor   = { fg = colors.color11 },
		ocamlModParam      = { fg = colors.foreground },
		ocamlModParam1     = { fg = colors.foreground },
		ocamlAnyVar        = { fg = colors.color6 },
		ocamlPpxEncl       = { fg = colors.color1 },
		ocamlPpxIdentifier = { fg = colors.foreground },
		ocamlSigEncl       = { fg = colors.color1 },
	}
end

return M
