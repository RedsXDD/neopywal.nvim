-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

local M = {}

function M.get()
	return {
		--: Neovim {{{
		Normal = { bg = O.transparent_background and C.none or C.background, fg = C.foreground }, -- normal text
		NormalNC = {
			bg = O.transparent_background and C.none or O.dim_inactive and U.darken(C.background, 5) or C.background,
		}, -- normal text in non-current windows.
		-- Terminal = { },
		NormalFloat = { bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background }, -- Normal text in floating windows.
		FloatBorder = { link = "NormalFloat" }, -- Border used in floating windows.
		FloatTitle = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.color2,
			styles = { "bold", "italic" },
		}, -- Title text in floating windows.
		Comment = { fg = C.color8, styles = O.styles.comments or {} }, -- any comment
		NonText = { fg = C.color8 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		EndOfBuffer = { fg = O.show_end_of_buffer and C.color8 or C.background }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		Title = { fg = C.color4, styles = { "bold" } }, -- titles for output from ":set all", ":autocmd" etc.
		VertSplit = { link = "WinSeparator" }, -- the column separating vertically split windows
		WinSeparator = {
			bg = O.transparent_background and C.none or O.dim_inactive and U.darken(C.background, 5) or C.background,
			fg = O.show_split_lines and C.color8 or O.dim_inactive and U.darken(C.background, 5) or C.background,
		}, -- the column separating vertically split windows
		Visual = { bg = U.blend(C.color5, C.background, 0.2), fg = C.color5, styles = { "bold" } }, -- Visual mode selection.
		VisualNOS = {
			bg = U.blend(C.color5, C.background, 0.2),
			fg = C.color5,
			styles = { "bold", "strikethrough" },
		}, -- Visual mode selection when vim is "Not Owning the Selection".
		healthError = { fg = C.color1 },
		healthSuccess = { fg = C.color2 },
		healthWarning = { fg = C.color3 },
		debugPC = { bg = C.color2, fg = C.color8 }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = C.color1, fg = C.color8 }, -- used for breakpoint colors in terminal-debug
		SignColumn = { fg = C.color8 }, -- column where |signs| are displayed.
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
		CursorLine = { bg = U.blend(C.background, C.foreground, 0.9) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLineNr = { link = "CursorLine" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold = { link = "SignColumn" }, -- Line used when hovering over closed folds.
		ColorColumn = { link = "CursorColumn" }, -- used for the columns set with 'colorcolumn'.
		--: }}}
		--: Diff {{{
		DiffAdd = { link = "DiagnosticOk" }, -- diff mode: Added line |diff.txt|.
		DiffChange = { link = "DiagnosticWarn" }, -- diff mode: Changed line |diff.txt|.
		DiffDelete = { link = "DiagnosticError" }, -- diff mode: Deleted line |diff.txt|.
		DiffText = { reverse = true }, -- diff mode: Changed text within a changed line |diff.txt|.
		--: }}}
		--: Misc {{{
		Conceal = { fg = C.color8 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Whitespace = { fg = C.color8 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		SpecialKey = { fg = C.color8 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		Directory = { fg = C.color4 }, -- directory names (and other special names in listings).
		MatchParen = { bg = C.color8 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		--: }}}
		--: Prompt {{{
		ErrorMsg = { fg = C.color1, styles = { "bold", "underline" } }, -- error messages on the command line.
		WarningMsg = { fg = C.color3, styles = { "bold" } }, -- warning messages.
		ModeMsg = { fg = C.foreground, styles = { "bold" } }, -- 'showmode' message (e.g., "-- INSERT -- ").
		MoreMsg = { fg = C.color4, styles = { "bold" } }, -- |more-prompt|
		WildMenu = { bg = C.color4, fg = C.background, styles = { "bold" } }, -- Current match in 'wildmenu' completion.
		Question = { fg = C.color3 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { fg = C.color4, styles = { "bold" } }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		MsgArea = { fg = U.darken(C.foreground, 20) }, -- Area for messages and cmdline
		MsgSeparator = { link = "Normal" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		--: }}}
		--: Search {{{
		Search = { bg = C.color2, fg = C.background, styles = { "bold" } }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = U.blend(C.color1, C.color3, 0.5), fg = C.background, styles = { "bold" } }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute = { bg = C.color4, fg = C.background, styles = { "bold" } }, -- |:substitute| replacement text highlighting
		--: }}}
		--: Pmenu {{{
		Pmenu = {
			bg = (O.transparent_background and vim.o.winblend == 0 and vim.o.pumblend == 0) and C.none
				or U.blend(C.background, C.foreground, 0.85),
		}, -- Popup menu: normal item.
		PmenuSel = { bg = U.blend(C.background, C.foreground, 0.75), styles = { "bold", "italic" } }, -- Popup menu: selected item.
		PmenuSbar = { bg = U.blend(C.background, C.foreground, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { link = "PmenuSel" }, -- Popup menu: Thumb of the scrollbar.
		--: }}}
		--: Spell {{{
		SpellBad = { fg = C.color1, styles = { "undercurl" } }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { fg = C.color3, styles = { "undercurl" } }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { fg = C.foreground, styles = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { fg = C.color6, styles = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		--: }}}
		--: Statusline {{{
		StatusLine = {
			bg = O.transparent_background and C.none or U.blend(C.color8, C.background, 0.3),
			fg = C.foreground,
		}, -- status line of current window.
		StatusLineNC = { link = "StatusLine" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm = { link = "StatusLine" }, -- status line of current terminal window.
		StatusLineTermNC = { link = "StatusLineNC" }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		--: }}}
		--: Tabline {{{
		WinBar = { link = "TabLineFill" }, -- Per-buffer tabline.
		WinBarNC = { link = "NormalNC" }, -- Per-buffer tabline on inactive buffers.
		TabLine = {
			bg = O.transparent_background and C.none or U.blend(C.background, C.foreground, 0.9),
		}, -- tab pages line, not active tab page label.
		TabLineFill = { link = "TabLine" }, -- tab pages line, where there are no labels.
		TabLineSel = {
			bg = O.transparent_background and U.lighten(C.background, 20) or C.background,
			fg = C.foreground,
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
		Variable = { fg = C.color4, styles = O.styles.variables or {} }, -- (preferred) any variable.
		Constant = { fg = C.color3, styles = { "italic" } }, -- (preferred) any constant
		String = { fg = C.foreground, styles = O.styles.strings or {} }, -- a string constant: "this is a string"
		Character = { fg = C.color3 }, -- a character constant: 'c', '\n'
		Number = { fg = C.color5, styles = O.styles.numbers or {} }, -- a number constant: 234, 0xff
		Boolean = { fg = C.color5, styles = O.styles.booleans or {} }, -- a boolean constant: TRUE, FALSE
		Float = { fg = C.color5 }, -- a floating point constant: 2.3e10
		Identifier = { fg = U.blend(C.color1, C.color3, 0.5), styles = O.styles.variables or {} }, -- (preferred) any variable name
		Function = { fg = C.color2, styles = O.styles.functions or {} }, -- function name (also: methods for classes)
		--: }}}
		--: Statements {{{
		Statement = { fg = C.color1 }, -- (preferred) any statement
		Conditional = { fg = C.color1, styles = O.styles.conditionals or {} }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = C.color1, styles = O.styles.loops or {} }, -- for, do, while, etc.
		Label = { link = "Statement" }, -- case, default, etc.
		Exception = { fg = C.color1, styles = O.styles.keywords or {} }, -- try, catch, throw
		Operator = { fg = C.color1, styles = O.styles.operators or {} }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = C.color1, styles = O.styles.keywords or {} }, -- any other keyword
		Debug = { fg = C.color3 }, -- Debugging statements.
		--: }}}
		--: Preprocessors {{{
		PreProc = { fg = C.color5 }, -- (preferred) generic Preprocessor
		Include = { fg = C.color5, styles = O.styles.includes or {} }, -- preprocessor #include
		Define = { link = "PreProc" }, -- preprocessor #define
		Macro = { link = "PreProc" }, -- same as Define
		PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
		--: }}}
		--: Type definitions {{{
		Type = { fg = C.color6, styles = O.styles.types or {} }, -- (preferred) int, long, char, etc.
		Structure = { link = "Type" }, -- struct, union, enum, etc.
		StorageClass = { link = "Type" }, -- static, register, volatile, etc.
		Typedef = { link = "Type" }, -- A typedef
		--: }}}
		--: Special {{{
		Special = { fg = C.color5 }, -- (preferred) any special symbol
		SecialChar = { fg = C.color5 }, -- special character in a constant
		Tag = { fg = U.blend(C.color1, C.color3, 0.5) }, -- you can use CTRL-] on this
		Delimiter = { fg = C.foreground }, -- character that needs attention
		SpecialComment = { fg = C.color8, styles = { "italic" } }, -- special things inside a comment
		--: }}}
		--: Text styles {{{
		Underlined = { styles = { "underline" } }, -- (preferred) text that stands out, HTML links
		Bold = { styles = { "bold" } }, -- (preferred) any bold text
		Italic = { styles = { "italic" } }, -- (preferred) any italic text
		Strikethrough = { styles = { "strikethrough" } }, -- (preferred) any strikethrough text
		--: }}}
		--: Misc {{{
		Ignore = { fg = C.color8 }, -- (preferred) left blank, hidden |hl-Ignore|
		Error = { fg = C.color1 }, -- (preferred) any erroneous construct
		Todo = { fg = C.color4, styles = { "bold", "italic" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Note = { bg = C.foreground, fg = C.background, styles = { "bold", "italic" } },
		Hint = { bg = C.color6, fg = C.background, styles = { "bold", "italic" } },
		Warn = {
			bg = U.blend(C.color1, C.color3, 0.5),
			fg = C.background,
			styles = { "bold", "italic" },
		},
		Err = { bg = C.color1, fg = C.background, styles = { "bold", "italic" } },
		URLlink = { fg = C.color4, styles = { "italic", "underline" } },

		-- Rainbow
		rainbow1 = { fg = C.color1 },
		rainbow2 = { fg = U.blend(C.color1, C.color3, 0.5) },
		rainbow3 = { fg = C.color3 },
		rainbow4 = { fg = C.color2 },
		rainbow5 = { fg = C.color4 },
		rainbow6 = { fg = C.color5 },
		--: }}}
		--: Diagnostics {{{
		DiagnosticOk = { fg = C.color2, styles = O.styles.lsp.virtual_text.ok or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticError = { fg = C.color1, styles = O.styles.lsp.virtual_text.errors or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticWarn = { fg = U.blend(C.color1, C.color3, 0.5), styles = O.styles.lsp.virtual_text.warnings or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticInfo = { fg = C.foreground, styles = O.styles.lsp.virtual_text.information or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticHint = { fg = C.color6, styles = O.styles.lsp.virtual_text.hints or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		DiagnosticUnnecessary = { fg = C.color8, styles = O.styles.lsp.virtual_text.unnecessary or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
		--: }}}
		--: }}}
	}
end

return M
