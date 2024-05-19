local M = {}
local O = require("neopywal").options

M.get = function(colors)
	return {
		-- UI:
		Normal                    = { bg = O.transparent and colors.none or colors.background, fg = colors.foreground },
		NormalNC                  = { link = "Normal" }, -- normal text in non-current windows.
		Terminal                  = { link = "Normal" },
		EndOfBuffer               = { fg = colors.background },
		Folded                    = { bg = colors.color0, fg = colors.foreground, bold = true },
		FoldColumn                = { link = "SignColumn" },
		ColorColumn               = { link = "CursorColumn" },
		SignColumn                = { bg = O.transparent and colors.none or colors.background, fg = colors.foreground },
		ToolbarLine               = { bg = colors.background, fg = colors.foreground },
		Conceal                   = { bg = colors.background, fg = colors.color8 },
		Cursor                    = { bg = colors.cursor, fg = colors.foreground, reverse = true },
		vCursor                   = { link = "Cursor" },
		iCursor                   = { link = "Cursor" },
		lCursor                   = { link = "Cursor" },
		CursorIM                  = { link = "Cursor" },
		TermCursor                = { link = "Cursor" },
		TermCursorNC              = { link = "Cursor" },
		LineNr                    = { fg = colors.color8 },
		CursorLine                = { bg = colors.color0, },
		CursorColumn              = { bg = colors.color0, },
		CursorLineNr              = { link = "CursorLine" },
		CursorLineFold            = { link = "SignColumn" },
		DiffAdd                   = { fg = colors.color10 },
		DiffChange                = { fg = colors.color12 },
		DiffDelete                = { fg = colors.color9 },
		DiffText                  = { reverse = true },
		Directory                 = { fg = colors.color4 },
		ErrorMsg                  = { fg = colors.color1, bold = true, underline = true },
		WarningMsg                = { fg = colors.color3, bold = true },
		ModeMsg                   = { fg = colors.foreground, bold = true },
		MoreMsg                   = { fg = colors.color4, bold = true },
		IncSearch                 = { bg = colors.color1, fg = colors.background, bold = true },
		Search                    = { bg = colors.color2, fg = colors.background, bold = true },
		MatchParen                = { bg = colors.color8 },
		NonText                   = { fg = colors.color8 },
		Whitespace                = { fg = colors.color8 },
		SpecialKey                = { fg = colors.color8 },
		Pmenu                     = { bg = (O.transparent_background and vim.o.pumblend == 0) and colors.none or colors.color8, fg = colors.foreground },
		PmenuSbar                 = { link = "Pmenu" },
		PmenuSel                  = { bg = colors.color4, fg = colors.background },
		PmenuThumb                = { link = "PmenuSel" },
		WildMenu                  = { bg = colors.color4, fg = colors.color8 },
		Question                  = { fg = colors.color3 },
		SpellBad                  = { fg = colors.color1, undercurl = true },
		SpellCap                  = { fg = colors.color3, undercurl = true },
		SpellLocal                = { fg = colors.color4, undercurl = true },
		SpellRare                 = { fg = colors.color5, undercurl = true },
		-- StatusLine                = { bg = colors.foreground, fg = colors.background }, -- Mini.statusline highlights.
		StatusLine                = { bg = O.transparent and colors.none or colors.background, fg = colors.foreground }, -- Lualine highlights.
		StatusLineNC              = { bg = colors.color8 },
		StatusLineTerm            = { link = "StatusLine" },
		StatusLineTermNC          = { link = "StatusLine" },
		TabLine                   = { link = "Normal" },
		TabLineFill               = { link = "TabLine" },
		TabLineSel                = { bg = colors.color0, fg = colors.color4, bold = true, italic = true },
		VertSplit                 = { bg = O.transparent and colors.none or colors.background, fg = colors.color7 },
		Visual                    = { bg = colors.color5, fg = colors.background, bold = true },
		VisualNOS                 = { link = "Visual", underline = true },
		QuickFixLine              = { fg = colors.color4, bold = true },
		Debug                     = { fg = colors.color3 },
		debugPC                   = { bg = colors.color2, fg = colors.color8 },
		debugBreakpoint           = { bg = colors.color1, fg = colors.color8 },
		ToolbarButton             = { bg = colors.color4, fg = colors.color8 },
		healthError               = { fg = colors.color1 },
		healthSuccess             = { fg = colors.color2 },
		healthWarning             = { fg = colors.color3 },
		MsgArea                   = { link = "Normal" },
		MsgSeparator              = { link = "Normal" },
	}
end

return M
