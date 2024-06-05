-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

local M = {}
local U = require("neopywal.util")
local O = require("neopywal").options

M.get = function(colors)
	return {
		--: Neovim {{{
		Normal = { bg = O.transparent and colors.none or colors.background, fg = colors.foreground }, -- normal text
		NormalNC = {
			bg = O.transparent and colors.none
				or O.dim_inactive and U.blend(colors.background, colors.color8, 0.9)
				or colors.background,
		}, -- normal text in non-current windows.
		-- Terminal = { },
		NormalFloat = { bg = colors.background }, -- Normal text in floating windows.
		FloatBorder = { bg = colors.background }, -- Border used in floating windows.
		FloatTitle = { fg = colors.color2, bold = true, italic = true }, -- Title text in floating windows.
		Comment = { fg = colors.color8, italic = true }, -- any comment
		NonText = { fg = colors.color8 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		EndOfBuffer = { fg = colors.background }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		Title = { fg = colors.color4, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		ToolbarLine = { fg = colors.foreground },
		ToolbarButton = { bg = colors.color4, fg = colors.background, bold = true },
		VertSplit = { bg = O.transparent and colors.none or colors.background, fg = colors.foreground }, -- the column separating vertically split windows
		Visual = { bg = U.blend(colors.color5, colors.background, 0.2), fg = colors.color5, bold = true }, -- Visual mode selection.
		VisualNOS = {
			bg = U.blend(colors.color5, colors.background, 0.2),
			fg = colors.color5,
			bold = true,
			strikethrough = true,
		}, -- Visual mode selection when vim is "Not Owning the Selection".
		healthError = { fg = colors.color1 },
		healthSuccess = { fg = colors.color2 },
		healthWarning = { fg = colors.color3 },
		debugPC = { bg = colors.color2, fg = colors.color8 }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = colors.color1, fg = colors.color8 }, -- used for breakpoint colors in terminal-debug
		SignColumn = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = colors.color8,
		}, -- column where |signs| are displayed.
		Folded = { bg = U.blend(colors.background, colors.color8, 0.9), bold = true }, -- Line used for closed folds.
		FoldColumn = { link = "SignColumn" }, -- 'foldcolumn'
		--: }}}
		--: Cursor {{{
		Cursor = { reverse = true }, -- character under the cursor.
		vCursor = { link = "Cursor" }, -- the character under the cursor in visual mode.
		iCursor = { link = "Cursor" }, -- the character under the cursor in insert mode.
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor').
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|.
		-- TermCursor   = { }, -- cursor in a focused terminal.
		-- TermCursorNC = { }, -- cursor in an unfocused terminal.
		LineNr = { link = "SignColumn" }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLine = { bg = U.blend(colors.background, colors.foreground, 0.9) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLineNr = { link = "CursorLine" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold = { link = "SignColumn" }, -- Line used when hovering over closed folds.
		ColorColumn = { link = "CursorColumn" }, -- used for the columns set with 'colorcolumn'.
		--: }}}
		--: Diff {{{
		DiffAdd = { fg = colors.color10 }, -- diff mode: Added line |diff.txt|.
		DiffChange = { fg = colors.color12 }, -- diff mode: Changed line |diff.txt|.
		DiffDelete = { fg = colors.color9 }, -- diff mode: Deleted line |diff.txt|.
		DiffText = { reverse = true }, -- diff mode: Changed text within a changed line |diff.txt|.
		--: }}}
		--: Misc {{{
		Conceal = { fg = colors.color8 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Whitespace = { fg = colors.color8 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		SpecialKey = { fg = colors.color8 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		Directory = { fg = colors.color4 }, -- directory names (and other special names in listings).
		MatchParen = { bg = colors.color8 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		--: }}}
		--: Prompt {{{
		ErrorMsg = { fg = colors.color1, bold = true, underline = true }, -- error messages on the command line.
		WarningMsg = { fg = colors.color3, bold = true }, -- warning messages.
		ModeMsg = { fg = colors.foreground, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ").
		MoreMsg = { fg = colors.color4, bold = true }, -- |more-prompt|
		WildMenu = { bg = colors.color4, fg = colors.background, bold = true }, -- Current match in 'wildmenu' completion.
		Question = { fg = colors.color3 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { fg = colors.color4, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		MsgArea = { fg = U.darken(colors.foreground, 20) }, -- Area for messages and cmdline
		MsgSeparator = { link = "Normal" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		--: }}}
		--: Search {{{
		Search = { bg = colors.color2, fg = colors.background, bold = true }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = U.blend(colors.color1, colors.color3, 0.5), fg = colors.background, bold = true }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute = { bg = colors.color4, fg = colors.background, bold = true }, -- |:substitute| replacement text highlighting
		--: }}}
		--: Pmenu {{{
		Pmenu = { bg = (O.transparent_background and vim.o.pumblend == 0) and colors.none or U.blend(colors.background, colors.foreground, 0.85) }, -- Popup menu: normal item.
		PmenuSel = { bg = U.blend(colors.background, colors.foreground, 0.75), bold = true, italic = true }, -- Popup menu: selected item.
		PmenuSbar = { bg = U.blend(colors.background, colors.foreground, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { link = "PmenuSel" }, -- Popup menu: Thumb of the scrollbar.
		--: }}}
		--: Spell {{{
		SpellBad = { fg = colors.color1, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { fg = colors.color3, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { fg = colors.foreground, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { fg = colors.color6, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		--: }}}
		--: Statusline {{{
		StatusLine = {
			bg = O.transparent and colors.none or U.lighten(colors.background, 20),
			fg = colors.foreground,
		}, -- status line of current window.
		StatusLineNC = { link = "StatusLine" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm = { link = "StatusLine" }, -- status line of current terminal window.
		StatusLineTermNC = { link = "StatusLineNC" }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		--: }}}
		--: Tabline {{{
		WinBar = { link = "StatusLine" }, -- window bar
		WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows
		TabLine = { bg = U.blend(colors.background, colors.color8, 0.9), fg = colors.foreground }, -- tab pages line, not active tab page label.
		TabLineFill = { link = "SignColumn" }, -- tab pages line, where there are no labels.
		TabLineSel = {
			bg = O.transparent and U.lighten(colors.background, 20) or colors.background,
			fg = colors.color4,
			bold = true,
			italic = true,
		}, -- tab pages line, active tab page label.
		--: }}}
		--: Syntax {{{
		--[[
			These groups are not listed as default vim groups,
			but they are defacto standard group names for syntax highlighting.
			commented out groups should chain up to their "preferred" group by
			default,
			Uncomment and edit if you want more specific syntax highlighting.
		]]
		--: Variable types {{{
		Variable = { fg = colors.color4 }, -- (preferred) any variable.
		Constant = { fg = colors.color3, italic = true }, -- (preferred) any constant
		String = { fg = colors.color3 }, -- a string constant: "this is a string"
		Character = { fg = colors.color3 }, -- a character constant: 'c', '\n'
		Number = { fg = colors.color5 }, -- a number constant: 234, 0xff
		Boolean = { fg = colors.color5 }, -- a boolean constant: TRUE, FALSE
		Float = { fg = colors.color5 }, -- a floating point constant: 2.3e10
		Identifier = { fg = U.blend(colors.color1, colors.color3, 0.5), italic = true }, -- (preferred) any variable name
		Function = { fg = colors.color2 }, -- function name (also: methods for classes)
		--: }}}
		--: Statements {{{
		Statement = { fg = colors.color1 }, -- (preferred) any statement
		Conditional = { link = "Statement" }, -- if, then, else, endif, switch, etc.
		Repeat = { link = "Statement" }, -- for, do, while, etc.
		Label = { link = "Statement" }, -- case, default, etc.
		Exception = { link = "Statement" }, -- try, catch, throw
		Operator = { link = "Statement" }, -- "sizeof", "+", "*", etc.
		Keyword = { link = "Statement" }, -- any other keyword
		Debug = { fg = colors.color3 }, -- Debugging statements.
		--: }}}
		--: Preprocessors {{{
		PreProc = { fg = colors.color5, italic = true }, -- (preferred) generic Preprocessor
		Include = { link = "PreProc" }, -- preprocessor #include
		Define = { link = "PreProc" }, -- preprocessor #define
		Macro = { link = "PreProc" }, -- same as Define
		PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
		--: }}}
		--: Type definitions {{{
		Type = { fg = colors.color6, italic = true }, -- (preferred) int, long, char, etc.
		Structure = { link = "Type" }, -- struct, union, enum, etc.
		StorageClass = { link = "Type" }, -- static, register, volatile, etc.
		Typedef = { link = "Type" }, -- A typedef
		--: }}}
		--: Special {{{
		Special = { fg = colors.color5 }, -- (preferred) any special symbol
		SecialChar = { fg = colors.color5 }, -- special character in a constant
		Tag = { fg = U.blend(colors.color1, colors.color3, 0.5) }, -- you can use CTRL-] on this
		Delimiter = { fg = colors.foreground }, -- character that needs attention
		SpecialComment = { fg = colors.color8, italic = true }, -- special things inside a comment
		--: }}}
		--: Text styles {{{
		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true }, -- (preferred) any bold text
		Italic = { italic = true }, -- (preferred) any italic text
		Strikethrough = { strikethrough = true }, -- (preferred) any strikethrough text
		--: }}}
		--: Misc {{{
		Ignore = { fg = colors.color8 }, -- (preferred) left blank, hidden |hl-Ignore|
		Error = { fg = colors.color1 }, -- (preferred) any erroneous construct
		Todo = { bg = colors.color4, fg = colors.background, bold = true, italic = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Note = { bg = colors.foreground, fg = colors.background, bold = true, italic = true },
		Hint = { bg = colors.color6, fg = colors.background, bold = true, italic = true },
		Warn = { bg = U.blend(colors.color1, colors.color3, 0.5), fg = colors.background, bold = true, italic = true },
		Err = { bg = colors.color1, fg = colors.background, bold = true, italic = true },
		URLlink = { fg = colors.color4, italic = true, underline = true },

		-- Rainbow
		rainbow1 = { fg = colors.color1 },
		rainbow2 = { fg = U.blend(colors.color1, colors.color3, 0.5) },
		rainbow3 = { fg = colors.color3 },
		rainbow4 = { fg = colors.color2 },
		rainbow5 = { fg = colors.color4 },
		rainbow6 = { fg = colors.color5 },
		--: }}}
		--: Diagnostics {{{
		DiagnosticError = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = colors.color1,
			bold = true,
		}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = U.blend(colors.color1, colors.color3, 0.5),
			bold = true,
		}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = colors.foreground,
			bold = true,
		}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = colors.color6,
			bold = true,
		}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticUnnecessary = {
			bg = O.transparent and colors.none or U.blend(colors.background, colors.color8, 0.9),
			fg = colors.color8,
			bold = true,
		}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		--: }}}
		--: }}}
	}
end

return M
