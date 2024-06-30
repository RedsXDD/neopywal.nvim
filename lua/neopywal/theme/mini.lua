-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

local M = {}
local U = require("neopywal.utils.color")
local O = require("neopywal").options

--: apply_plugin() explanation {{{
--[[
	The apply_plugin function takes an option string and a highlights table as input, and returns a boolean value
	indicating whether the plugin highlights should be applied or not. It does this by checking if the option exists in the
	O table and is a boolean value. If the option is true, it returns the highlights table, otherwise an empty table.
--]]
--: }}}
local function apply_plugin(option, highlights)
	if type(O.plugins.mini[option]) ~= "boolean" then
		return {}
	end

	return O.plugins.mini[option] and highlights or {}
end

M.get = function(colors)
	return vim.tbl_deep_extend(
		"force",
		--: mini.indentscope {{{
		apply_plugin("indentscope", {
			MiniIndentscopeSymbol = { link = "Comment" },
			MiniIndentscopeSymbolOff = { link = "MiniIndentscopeSymbol" },
		}),
		--: }}}
		--: mini.statusline {{{
		apply_plugin("statusline", {
			MiniStatuslineModeNormal = { bg = colors.color4, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeVisual = { bg = colors.color5, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeInsert = { bg = colors.color6, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeCommand = { bg = colors.color1, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeReplace = { bg = colors.color2, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeOther = { bg = colors.color3, fg = colors.background, styles = { "bold" } },
			MiniStatuslineModeDevInfo = { link = "StatusLine" },
			MiniStatuslineModeFilename = { link = "StatusLineNC" },
			MiniStatuslineModeFileInfo = { link = "StatusLineNC" },
			MiniStatuslineModeInactive = { link = "StatusLineNC" },
		}),
		--: }}}
		--: mini.tabline {{{
		apply_plugin("tabline", {
			MiniTablineCurrent = { link = "TabLineSel" },
			MiniTablineFill = { link = "TabLineFill" },
			MiniTablineVisible = { link = "TabLine" },
			MiniTablineHidden = { link = "MiniTablineVisible" },
			MiniTablineModifiedCurrent = {
				bg = O.transparent_background and U.lighten(colors.background, 20) or colors.background,
				fg = U.blend(colors.color1, colors.color3, 0.5),
				styles = { "bold", "italic" },
			},
			MiniTablineModifiedVisible = { link = "MiniTablineVisible" },
			MiniTablineModifiedHidden = { link = "MiniTablineModifiedVisible" },
			MiniTablineTabpagesection = { link = "MiniTablineCurrent" },
		}),
		--: }}}
		--: mini.cursorword {{{
		apply_plugin("cursorword", {
			MiniCursorword = { styles = { "underline" } },
			MiniCursorwordCurrent = { link = "MiniCursorword" },
		}),
		--: }}}
		--: mini.files {{{
		apply_plugin("files", {
			MiniFilesBorder = { link = "FloatBorder" },
			MiniFilesBorderModified = { link = "DiagnosticWarn" },
			MiniFilesCursorLine = { link = "CursorLine" },
			MiniFilesDirectory = { link = "Directory" },
			MiniFilesFile = {},
			MiniFilesNormal = { link = "NormalFloat" },
			MiniFilesTitle = { link = "Comment" },
			MiniFilesTitleFocused = { link = "FloatTitle" },
		}),
		--: }}}
		--: mini.hipatterns {{{
		apply_plugin("hipatterns", {
			MiniHipatternsFixme = { bg = colors.color1, fg = colors.background, styles = { "bold", "italic" } },
			MiniHipatternsHack = {
				bg = U.blend(colors.color1, colors.color3, 0.5),
				fg = colors.background,
				styles = { "bold", "italic" },
			},
			MiniHipatternsTodo = { bg = colors.color4, fg = colors.background, styles = { "bold", "italic" } },
			MiniHipatternsNote = { bg = colors.foreground, fg = colors.background, styles = { "bold", "italic" } },
		}),
		--: }}}
		--: mini.pick {{{
		apply_plugin("pick", {
			MiniPickBorder = { link = "FloatBorder" },
			MiniPickBorderBusy = { link = "DiagnosticWarn" },
			MiniPickBorderText = { link = "FloatTitle" },
			MiniPickIconDirectory = { link = "Directory" },
			MiniPickNormal = { link = "NormalFloat" },
			MiniPickIconFile = { link = "MiniPickNormal" },
			MiniPickHeader = { link = "DiagnosticHint" },
			MiniPickMatchCurrent = { link = "CursorLine" },
			MiniPickMatchMarked = { link = "Visual" },
			MiniPickMatchRanges = { fg = colors.color4 },
			MiniPickPreviewLine = { link = "CursorLine" },
			MiniPickPreviewRegion = { link = "IncSearch" },
			MiniPickPrompt = { link = "FloatTitle" },
		}),
		--: }}}
		--: mini.starter: {{{
		apply_plugin("starter", {
			MiniStarterCurrent = { link = "CursorLine" },
			MiniStarterHeader = { fg = colors.color4, styles = { "bold", "italic" } },
			MiniStarterFooter = { fg = colors.color5, styles = { "bold", "italic" } },
			MiniStarterInactive = { link = "Comment" },
			MiniStarterItem = { link = "Normal" },
			MiniStarterItemBullet = { link = "Delimiter" },
			MiniStarterItemPrefix = { fg = colors.foreground, styles = { "bold", "italic" } },
			MiniStarterSection = { fg = colors.color6, styles = { "bold", "italic" } },
			MiniStarterQuery = { fg = colors.color1 },
		}),
		--: }}}
		{}
	)
end

return M
