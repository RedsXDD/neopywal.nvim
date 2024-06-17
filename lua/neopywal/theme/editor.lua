-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

local M = {}
local U = require("neopywal.util")
local O = require("neopywal").options

M.get = function(colors)
	return {
		--: Neovim {{{
		Normal = { bg = O.transparent_background and colors.none or colors.background, fg = colors.foreground }, -- normal text
		NormalNC = {
			bg = O.transparent_background and colors.none
				or O.dim_inactive and U.darken(colors.background, 5)
				or colors.background,
		}, -- normal text in non-current windows.
		-- Terminal = { },
		NormalFloat = { bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background }, -- Normal text in floating windows.
		FloatBorder = { link = "NormalFloat" }, -- Border used in floating windows.
		FloatTitle = {
			bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
			fg = colors.color2,
			styles = { "bold", "italic" },
		}, -- Title text in floating windows.
		Comment = { fg = colors.color8, styles = O.styles.comments or {} }, -- any comment
		NonText = { fg = colors.color8 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		EndOfBuffer = { fg = O.show_end_of_buffer and colors.color8 or colors.background }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		Title = { fg = colors.color4, styles = { "bold" } }, -- titles for output from ":set all", ":autocmd" etc.
		VertSplit = { link = "WinSeparator" }, -- the column separating vertically split windows
		WinSeparator = {
			bg = O.transparent_background and colors.none
				or O.dim_inactive and U.darken(colors.background, 5)
				or colors.background,
			fg = colors.color8,
		}, -- the column separating vertically split windows
		Visual = { bg = U.blend(colors.color5, colors.background, 0.2), fg = colors.color5, styles = { "bold" } }, -- Visual mode selection.
		VisualNOS = {
			bg = U.blend(colors.color5, colors.background, 0.2),
			fg = colors.color5,
			styles = { "bold", "strikethrough" },
		}, -- Visual mode selection when vim is "Not Owning the Selection".
		healthError = { fg = colors.color1 },
		healthSuccess = { fg = colors.color2 },
		healthWarning = { fg = colors.color3 },
		debugPC = { bg = colors.color2, fg = colors.color8 }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = colors.color1, fg = colors.color8 }, -- used for breakpoint colors in terminal-debug
		SignColumn = { fg = colors.color8 }, -- column where |signs| are displayed.
		Folded = { link = "CursorLine" }, -- Line used for closed folds.
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
		ErrorMsg = { fg = colors.color1, styles = { "bold", "underline" } }, -- error messages on the command line.
		WarningMsg = { fg = colors.color3, styles = { "bold" } }, -- warning messages.
		ModeMsg = { fg = colors.foreground, styles = { "bold" } }, -- 'showmode' message (e.g., "-- INSERT -- ").
		MoreMsg = { fg = colors.color4, styles = { "bold" } }, -- |more-prompt|
		WildMenu = { bg = colors.color4, fg = colors.background, styles = { "bold" } }, -- Current match in 'wildmenu' completion.
		Question = { fg = colors.color3 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { fg = colors.color4, styles = { "bold" } }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		MsgArea = { fg = U.darken(colors.foreground, 20) }, -- Area for messages and cmdline
		MsgSeparator = { link = "Normal" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		--: }}}
		--: Search {{{
		Search = { bg = colors.color2, fg = colors.background, styles = { "bold" } }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = U.blend(colors.color1, colors.color3, 0.5), fg = colors.background, styles = { "bold" } }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute = { bg = colors.color4, fg = colors.background, styles = { "bold" } }, -- |:substitute| replacement text highlighting
		--: }}}
		--: Pmenu {{{
		Pmenu = {
			bg = (O.transparent_background and vim.o.winblend == 0 and vim.o.pumblend == 0) and colors.none
				or U.blend(colors.background, colors.foreground, 0.85),
		}, -- Popup menu: normal item.
		PmenuSel = { bg = U.blend(colors.background, colors.foreground, 0.75), styles = { "bold", "italic" } }, -- Popup menu: selected item.
		PmenuSbar = { bg = U.blend(colors.background, colors.foreground, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { link = "PmenuSel" }, -- Popup menu: Thumb of the scrollbar.
		--: }}}
		--: Spell {{{
		SpellBad = { fg = colors.color1, styles = { "undercurl" } }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { fg = colors.color3, styles = { "undercurl" } }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { fg = colors.foreground, styles = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { fg = colors.color6, styles = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		--: }}}
		--: Statusline {{{
		StatusLine = {
			bg = O.transparent_background and colors.none or U.blend(colors.color8, colors.background, 0.3),
			fg = colors.foreground,
		}, -- status line of current window.
		StatusLineNC = { link = "StatusLine" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm = { link = "StatusLine" }, -- status line of current terminal window.
		StatusLineTermNC = { link = "StatusLineNC" }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		--: }}}
		--: Tabline {{{
		WinBar = { link = "TabLineFill" }, -- Per-buffer tabline.
		WinBarNC = { link = "NormalNC" }, -- Per-buffer tabline on inactive buffers.
		TabLine = {
			bg = O.transparent_background and colors.none or U.blend(colors.background, colors.foreground, 0.9),
		}, -- tab pages line, not active tab page label.
		TabLineFill = { link = "TabLine" }, -- tab pages line, where there are no labels.
		TabLineSel = {
			bg = O.transparent_background and U.lighten(colors.background, 20) or colors.background,
			fg = colors.foreground,
			styles = { "bold", "italic" },
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
		Variable = { fg = colors.color4, styles = O.styles.variables or {} }, -- (preferred) any variable.
		Constant = { fg = colors.color3, styles = { "italic" } }, -- (preferred) any constant
		String = { fg = colors.color3, styles = O.styles.strings or {} }, -- a string constant: "this is a string"
		Character = { fg = colors.color3 }, -- a character constant: 'c', '\n'
		Number = { fg = colors.color5, styles = O.styles.numbers or {} }, -- a number constant: 234, 0xff
		Boolean = { fg = colors.color5, styles = O.styles.booleans or {} }, -- a boolean constant: TRUE, FALSE
		Float = { fg = colors.color5 }, -- a floating point constant: 2.3e10
		Identifier = { fg = U.blend(colors.color1, colors.color3, 0.5), styles = O.styles.variables or {} }, -- (preferred) any variable name
		Function = { fg = colors.color2, styles = O.styles.functions or {} }, -- function name (also: methods for classes)
		--: }}}
		--: Statements {{{
		Statement = { fg = colors.color1 }, -- (preferred) any statement
		Conditional = { fg = colors.color1, styles = O.styles.conditionals or {} }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = colors.color1, styles = O.styles.loops or {} }, -- for, do, while, etc.
		Label = { link = "Statement" }, -- case, default, etc.
		Exception = { fg = colors.color1, styles = O.styles.keywords or {} }, -- try, catch, throw
		Operator = { fg = colors.color1, styles = O.styles.operators or {} }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = colors.color1, styles = O.styles.keywords or {} }, -- any other keyword
		Debug = { fg = colors.color3 }, -- Debugging statements.
		--: }}}
		--: Preprocessors {{{
		PreProc = { fg = colors.color5 }, -- (preferred) generic Preprocessor
		Include = { fg = colors.color5, styles = O.styles.includes or {} }, -- preprocessor #include
		Define = { link = "PreProc" }, -- preprocessor #define
		Macro = { link = "PreProc" }, -- same as Define
		PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
		--: }}}
		--: Type definitions {{{
		Type = { fg = colors.color6, styles = O.styles.types or {} }, -- (preferred) int, long, char, etc.
		Structure = { link = "Type" }, -- struct, union, enum, etc.
		StorageClass = { link = "Type" }, -- static, register, volatile, etc.
		Typedef = { link = "Type" }, -- A typedef
		--: }}}
		--: Special {{{
		Special = { fg = colors.color5 }, -- (preferred) any special symbol
		SecialChar = { fg = colors.color5 }, -- special character in a constant
		Tag = { fg = U.blend(colors.color1, colors.color3, 0.5) }, -- you can use CTRL-] on this
		Delimiter = { fg = colors.foreground }, -- character that needs attention
		SpecialComment = { fg = colors.color8, styles = { "italic" } }, -- special things inside a comment
		--: }}}
		--: Text styles {{{
		Underlined = { styles = { "underline" } }, -- (preferred) text that stands out, HTML links
		Bold = { styles = { "bold" } }, -- (preferred) any bold text
		Italic = { styles = { "italic" } }, -- (preferred) any italic text
		Strikethrough = { styles = { "strikethrough" } }, -- (preferred) any strikethrough text
		--: }}}
		--: Misc {{{
		Ignore = { fg = colors.color8 }, -- (preferred) left blank, hidden |hl-Ignore|
		Error = { fg = colors.color1 }, -- (preferred) any erroneous construct
		Todo = { bg = colors.color4, fg = colors.background, styles = { "bold", "italic" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Note = { bg = colors.foreground, fg = colors.background, styles = { "bold", "italic" } },
		Hint = { bg = colors.color6, fg = colors.background, styles = { "bold", "italic" } },
		Warn = {
			bg = U.blend(colors.color1, colors.color3, 0.5),
			fg = colors.background,
			styles = { "bold", "italic" },
		},
		Err = { bg = colors.color1, fg = colors.background, styles = { "bold", "italic" } },
		URLlink = { fg = colors.color4, styles = { "italic", "underline" } },

		-- Rainbow
		rainbow1 = { fg = colors.color1 },
		rainbow2 = { fg = U.blend(colors.color1, colors.color3, 0.5) },
		rainbow3 = { fg = colors.color3 },
		rainbow4 = { fg = colors.color2 },
		rainbow5 = { fg = colors.color4 },
		rainbow6 = { fg = colors.color5 },
		--: }}}
		--: Diagnostics {{{
		DiagnosticOk = { fg = colors.color2, styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticError = { fg = colors.color1, styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticWarn = { fg = U.blend(colors.color1, colors.color3, 0.5), styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticInfo = { fg = colors.foreground, styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticHint = { fg = colors.color6, styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticUnnecessary = { fg = colors.color8, styles = { "bold" } }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		--: }}}
		--: }}}
	}
end

return M
