local M = {}

M.get = function(colors)
	return {
		-- CSS:
		-- builtin: https://github.com/JulesWang/css.vim
		cssStringQ        = { fg = colors.color2 },
		cssStringQQ       = { fg = colors.color2 },
		cssAttrComma      = { fg = colors.color8 },
		cssBraces         = { fg = colors.color8 },
		cssTagName        = { fg = colors.color5 },
		cssClassNameDot   = { fg = colors.color11 },
		cssClassName      = { fg = colors.color1 },
		cssFunctionName   = { fg = colors.color11 },
		cssAttr           = { fg = colors.color2 },
		cssCommonAttr     = { fg = colors.color2 },
		cssProp           = { fg = colors.color4 },
		cssPseudoClassId  = { fg = colors.color3 },
		cssPseudoClassFn  = { fg = colors.color2 },
		cssPseudoClass    = { fg = colors.color3 },
		cssImportant      = { fg = colors.color1 },
		cssSelectorOp     = { fg = colors.color11 },
		cssSelectorOp2    = { fg = colors.color11 },
		cssColor          = { fg = colors.color2 },
		cssUnitDecorators = { fg = colors.color11 },
		cssValueLength    = { fg = colors.color2 },
		cssValueInteger   = { fg = colors.color2 },
		cssValueNumber    = { fg = colors.color2 },
		cssValueAngle     = { fg = colors.color2 },
		cssValueTime      = { fg = colors.color2 },
		cssValueFrequency = { fg = colors.color2 },
		cssVendor         = { fg = colors.color8 },
		cssNoise          = { fg = colors.color8 },
	}
end

return M
