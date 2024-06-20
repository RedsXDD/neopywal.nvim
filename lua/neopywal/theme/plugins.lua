-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

local M = {}
local U = require("neopywal.util")
local O = require("neopywal").options

--: apply_plugin() explanation {{{
--[[
	The apply_plugin function takes an option string and a highlights table as input, and returns a boolean value
	indicating whether the plugin highlights should be applied or not. It does this by checking if the option exists in the
	O table and is a boolean value. If the option is true, it returns the highlights table, otherwise an empty table.
--]]
--: }}}
local function apply_plugin(option, highlights)
	if type(O.plugins[option]) ~= "boolean" then
		return {}
	end

	return O.plugins[option] and highlights or {}
end

M.get = function(colors)
	return vim.tbl_deep_extend(
		"force",
		--: neoclide/coc.nvim {{{
		apply_plugin("coc", {
			CocHighlightText = { styles = { "bold" } },
			CocHoverRange = { styles = { "bold", "underline" } },
			CocHintHighlight = { fg = colors.color2, styles = { "undercurl" } },
			CocErrorFloat = { bg = colors.color8, fg = colors.color1 },
			CocWarningFloat = { bg = colors.color8, fg = colors.color3 },
			CocInfoFloat = { bg = colors.color8, fg = colors.color4 },
			CocHintFloat = { bg = colors.color8, fg = colors.color2 },
			CocCodeLens = { fg = colors.color8 },
			CocErrorSign = { link = "DiffDelete" },
			CocWarningSign = { fg = colors.color3 },
			CocInfoSign = { fg = colors.color4 },
			CocHintSign = { link = "Label" },
			CocErrorHighlight = { fg = colors.color1, styles = { "undercurl" } },
			CocWarningHighlight = { fg = colors.color3, styles = { "undercurl" } },
			CocInfoHighlight = { fg = colors.color4, styles = { "undercurl" } },
			CocWarningVirtualText = { fg = colors.color8 },
			CocErrorVirtualText = { fg = colors.color8 },
			CocInfoVirtualText = { fg = colors.color8 },
			CocHintVirtualText = { fg = colors.color8 },
			CocGitAddedSign = { link = "DiffAdd" },
			CocGitChangeRemovedSign = { fg = colors.color5 },
			CocGitChangedSign = { link = "DiffChange" },
			CocGitRemovedSign = { link = "DiffDelete" },
			CocGitTopRemovedSign = { link = "CocGitRemovedSign" },
			CocExplorerBufferRoot = { fg = colors.color1 },
			CocExplorerBufferExpandIcon = { fg = colors.color4 },
			CocExplorerBufferBufnr = { fg = colors.color3 },
			CocExplorerBufferModified = { fg = colors.color1 },
			CocExplorerBufferBufname = { fg = colors.color8 },
			CocExplorerBufferFullpath = { fg = colors.color8 },
			CocExplorerFileRoot = { fg = colors.color1 },
			CocExplorerFileExpandIcon = { fg = colors.color4 },
			CocExplorerFileFullpath = { fg = colors.color8 },
			CocExplorerFileDirectory = { link = "Directory" },
			CocExplorerFileGitStage = { fg = colors.color4 },
			CocExplorerFileGitUnstage = { fg = colors.color3 },
			CocExplorerFileSize = { fg = colors.color4 },
			CocExplorerTimeAccessed = { fg = colors.color5 },
			CocExplorerTimeCreated = { fg = colors.color5 },
			CocExplorerTimeModified = { fg = colors.color5 },
			CocExplorerFileRootName = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			CocExplorerBufferNameVisible = { link = "Directory" },
		}),
		--: }}}
		--: dense-analysis/ale {{{
		apply_plugin("ale", {
			ALEError = { fg = colors.color1, styles = { "undercurl" } },
			ALEWarning = { fg = U.blend(colors.color1, colors.color3, 0.5), styles = { "undercurl" } },
			ALEInfo = { fg = colors.foreground, styles = { "undercurl" } },
			ALEErrorSign = { link = "DiagnosticError" },
			ALEWarningSign = { link = "DiagnosticWarn" },
			ALEInfoSign = { link = "DiagnosticInfo" },
			ALEVirtualTextError = { link = "DiagnosticError" },
			ALEVirtualTextWarning = { link = "DiagnosticWarn" },
			ALEVirtualTextInfo = { link = "DiagnosticInfo" },
			ALEVirtualTextStyleError = { link = "ALEVirtualTextError" },
			ALEVirtualTextStyleWarning = { link = "ALEVirtualTextWarning" },
		}),
		--: }}}
		--: kdheepak/lazygit.nvim {{{
		apply_plugin("lazygit", {
			LazyGitBorder = { link = "FloatBorder" },
			LazyGitFloat = { link = "NormalFloat" },
		}),
		--: }}}
		--: folke/noice.nvim {{{
		-- Honestly the default integration is already pretty good.
		apply_plugin("noice", {
			NoiceCmdlinePopup = { link = "NormalFloat" },

			NoiceMini = { link = "NoiceLspProgressTitle" },
			NoiceLspProgressTitle = { bg = colors.background, fg = colors.foreground },
			NoiceLspProgressClient = {
				bg = colors.background,
				fg = colors.color4,
				styles = { "bold" },
			},
			NoiceLspProgressSpinner = { link = "NoiceLspProgressClient" },
			NoiceFormatProgressDone = { bg = colors.background },
			NoiceFormatProgressTodo = { bg = colors.background },

			NoiceConfirm = { link = "NormalFloat" },
			NoiceConfirmBorder = { link = "FloatTitle" },

			NoiceCmdlineIcon = { fg = colors.color2 },
			NoiceCmdlinePopupBorderCmdline = { link = "NoiceCmdlineIcon" },

			NoiceCmdlineIconSearch = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlineIconSearch" },

			NoiceCmdlineIconHelp = { fg = colors.color3 },
			NoiceCmdlinePopupBorderHelp = { link = "NoiceCmdlineIconHelp" },

			NoiceCmdlineIconLua = { fg = colors.color4 },
			NoiceCmdlinePopupBorderLua = { link = "NoiceCmdlineIconLua" },

			NoiceCmdlineIconCalculator = { fg = colors.color6 },
			NoiceCmdlinePopupBorderCalculator = { link = "NoiceCmdlineIconCalculator" },

			NoiceCmdlineIconIncRename = { fg = colors.color5 },
			NoiceCmdlinePopupBorderIncRename = { link = "NoiceCmdlinePopupBorder" },

			NoiceCmdlineIconInput = { fg = colors.foreground },
			NoiceCmdlinePopupBorderInput = { link = "NoiceCmdlineIconInput" },

			NoiceCmdlineIconFilter = { fg = colors.color1 },
			NoiceCmdlinePopupBorderFilter = { link = "NoiceCmdlineIconFilter" },
		}),
		--: }}}
		--: rcarriga/nvim-notify {{{
		{
			NotifyBackground = { bg = "#000000" },
		},
		apply_plugin("notify", {
			NotifyERRORBody = {
				bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
				fg = colors.color1,
			},
			NotifyWARNBody = {
				bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
				fg = U.blend(colors.color1, colors.color3, 0.5),
			},
			NotifyINFOBody = {
				bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
				fg = colors.foreground,
			},
			NotifyDEBUGBody = {
				bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
				fg = colors.color8,
			},
			NotifyTRACEBody = {
				bg = (O.transparent_background and vim.o.winblend == 0) and colors.none or colors.background,
				fg = colors.color6,
			},

			NotifyERRORBorder = { link = "NotifyERRORBody" },
			NotifyERRORIcon = { fg = colors.color1 },
			NotifyERRORTitle = { fg = colors.color1, styles = { "italic" } },

			NotifyWARNBorder = { link = "NotifyWARNBody" },
			NotifyWARNIcon = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			NotifyWARNTitle = { fg = U.blend(colors.color1, colors.color3, 0.5), styles = { "italic" } },

			NotifyINFOBorder = { link = "NotifyINFOBody" },
			NotifyINFOIcon = { fg = colors.foreground },
			NotifyINFOTitle = { fg = colors.foreground, styles = { "italic" } },

			NotifyDEBUGBorder = { link = "NotifyDEBUGBody" },
			NotifyDEBUGIcon = { fg = colors.color8 },
			NotifyDEBUGTitle = { fg = colors.color8, styles = { "italic" } },

			NotifyTRACEBorder = { link = "NotifyTRACEBody" },
			NotifyTRACEIcon = { fg = colors.color6 },
			NotifyTRACETitle = { fg = colors.color6, styles = { "italic" } },
		}),
		--: }}}
		--: airblade/vim-gitgutter {{{
		apply_plugin("git_gutter", {
			GitGutterAdd = { link = "DiffAdd" },
			GitGutterChange = { link = "DiffChange" },
			GitGutterDelete = { link = "DiffDelete" },
			GitGutterChangeDelete = { fg = colors.color5 },
		}),
		--: }}}
		--: hrsh7th/nvim-cmp {{{
		apply_plugin("nvim_cmp", {
			CmpDocumentation = { link = "FloatBorder" },
			CmpDocumentationBorder = { link = "FloatBorder" },
			CmpItemAbbr = { bg = colors.none, fg = colors.foreground },
			CmpItemAbbrDeprecated = { bg = colors.none, fg = colors.color2, strikethrough = true },
			CmpItemAbbrMatch = { bg = colors.none, fg = colors.color4 },
			CmpItemAbbrMatchFuzzy = { bg = colors.none, fg = colors.color5 },
			CmpItemKind = { bg = colors.none, fg = colors.foreground },
			CmpItemMenu = { bg = colors.none, fg = colors.color2 },
			CmpItemKindDefault = { bg = colors.none, fg = colors.foreground },
			CmpItemAbbrDefault = { bg = colors.none, fg = colors.foreground },
			CmpItemAbbrDeprecatedDefault = { bg = colors.none, fg = colors.color8, strikethrough = true },
			CmpItemAbbrMatchDefault = { bg = colors.none, fg = colors.foreground },
			CmpItemAbbrMatchFuzzyDefault = { bg = colors.none, fg = colors.foreground },
			CmpItemMenuDefault = { bg = colors.none, fg = colors.foreground },

			-- Kind support:
			CmpItemKindKeyword = { bg = colors.none, fg = colors.color1 }, -- Link Keyword
			CmpItemKindOperator = { bg = colors.none, fg = colors.color1 }, -- Link Operator
			CmpItemKindEnum = { link = "CmpItemKindKeyword" },
			CmpItemKindFunction = { bg = colors.none, fg = colors.color2 }, -- Link Function
			CmpItemKindField = { bg = colors.none, fg = colors.color2 }, -- Link @variable.member
			CmpItemKindProperty = { bg = colors.none, fg = colors.color2 }, -- Link @property
			CmpItemKindMethod = { link = "CmpItemKindFunction" },
			CmpItemKindColor = { bg = colors.none, fg = colors.color3 },
			CmpItemKindInterface = { bg = colors.none, fg = colors.color4 },
			CmpItemKindFolder = { bg = colors.none, fg = colors.color4 }, -- Link Directory
			CmpItemKindVariable = { bg = colors.none, fg = colors.color4 }, -- Link Variable
			CmpItemKindEvent = { link = "CmpItemKindVariable" },
			CmpItemKindConstructor = { bg = colors.none, fg = colors.color5 }, -- Link Special
			CmpItemKindModule = { bg = colors.none, fg = colors.color5 }, -- Link Include
			CmpItemKindUnit = { bg = colors.none, fg = colors.color5 }, -- Link Number
			CmpItemKindSnippet = { link = "CmpItemKindModule" },
			CmpItemKindClass = { bg = colors.none, fg = colors.color6 }, -- Link StorageClass
			CmpItemKindStruct = { bg = colors.none, fg = colors.color6 }, -- Link Structure
			CmpItemKindCopilot = { bg = colors.none, fg = colors.color6 },
			CmpItemKindTabNine = { bg = colors.none, fg = colors.color6 },
			CmpItemKindTypeParameter = { bg = colors.none, fg = U.blend(colors.color1, colors.color3, 0.5) }, -- Link Identifier
			CmpItemKindConstant = { bg = colors.none, fg = U.blend(colors.color1, colors.color3, 0.5) }, -- Link Constant
			CmpItemKindValue = { link = "CmpItemKindConstant" },
			CmpItemKindEnumMember = { link = "CmpItemKindConstant" },
			CmpItemKindText = { bg = colors.none, fg = U.lighten(colors.background, 30) },
			CmpItemKindFile = { link = "CmpItemKindText" },
			CmpItemKindReference = { link = "CmpItemKindText" },
		}),
		--: }}}
		--: neovim/nvim-lspconfig {{{
		apply_plugin("lspconfig", {
			-- These groups are for the native LSP client. Some other LSP clients may
			-- use these groups, or use their own. Consult your LSP client's documentation.

			LspReferenceText = { styles = { "bold" } }, -- used for highlighting "text" references
			LspReferenceRead = { styles = { "bold" } }, -- used for highlighting "read" references
			LspReferenceWrite = { styles = { "bold" } }, -- used for highlighting "write" references
			LspInlayHint = { link = "NonText" },
			LspInfoTitle = { link = "Title" },
			LspInfoTip = { link = "Comment" },
			LspInfoList = { link = "Function" },
			LspInfoBorder = { link = "Label" },
			LspInfoFiletype = { link = "Type" },
			LspCodeLens = { link = "Comment" },
			LspSignatureActiveParameter = { link = "Visual" },

			LspDiagnosticsHint = { link = "DiagnosticHint" },
			LspDiagnosticsInformation = { link = "DiagnosticInfo" },
			LspDiagnosticsWarning = { link = "DiagnosticWarn" },
			LspDiagnosticsError = { link = "DiagnosticError" },

			DiagnosticVirtualTextError = {
				bg = U.blend(colors.color1, colors.background, 0.2),
				fg = colors.color1,
				styles = { "bold" },
			}, -- Used for "Error" diagnostic virtual text
			DiagnosticVirtualTextWarn = {
				bg = U.blend(U.blend(colors.color1, colors.color3, 0.5), colors.background, 0.2),
				fg = U.blend(colors.color1, colors.color3, 0.5),
				styles = { "bold" },
			}, -- Used for "Warning" diagnostic virtual text
			DiagnosticVirtualTextInfo = {
				bg = U.blend(colors.foreground, colors.background, 0.2),
				fg = colors.foreground,
				styles = { "bold" },
			}, -- Used for "Information" diagnostic virtual text
			DiagnosticVirtualTextHint = {
				bg = U.blend(colors.color6, colors.background, 0.2),
				fg = colors.color6,
				styles = { "bold" },
			}, -- Used for "Hint" diagnostic virtual text
			DiagnosticVirtualTextOk = {
				bg = U.blend(colors.color2, colors.background, 0.2),
				fg = colors.color2,
				styles = { "bold" },
			}, -- Used for "Ok" diagnostic virtual text

			DiagnosticUnderlineOk = { sp = colors.color2, styles = { "undercurl" } }, -- Used to underline "Ok" diagnostics
			DiagnosticUnderlineError = { sp = colors.color1, styles = { "undercurl" } }, -- Used to underline "Error" diagnostics
			DiagnosticUnderlineWarn = { sp = U.blend(colors.color1, colors.color3, 0.5), styles = { "undercurl" } }, -- Used to underline "Warning" diagnostics
			DiagnosticUnderlineInfo = { sp = colors.foreground, styles = { "undercurl" } }, -- Used to underline "Information" diagnostics
			DiagnosticUnderlineHint = { sp = colors.color6, styles = { "undercurl" } }, -- Used to underline "Hint" diagnostics
		}),
		--: }}}
		--: Lazy.nvim {{{
		apply_plugin("lazy", {
			LazyProgressDone = { link = "Variable" },
			LazySpecial = { link = "SpecialChar" },
			LazyDir = { link = "Directory" },
			LazyValue = { link = "String" },
			LazyUrl = { link = "LazyDir" },
			LazyDimmed = { link = (O.dim_inactive and "NormalNC" or "Conceal") },
			LazyCommit = { link = "Identifier" },
			LazyH1 = { bg = U.blend(colors.background, colors.foreground, 0.7), styles = { "bold" } }, -- Non-selected buttons.
			LazyH2 = { styles = { "bold" } },
			LazyButton = { bg = U.blend(colors.background, colors.foreground, 0.9), styles = { "bold" } }, -- Selected buttons.
			LazyReasonRuntime = { link = "Macro" },
			LazyReasonRequire = { link = "Include" },
			LazyButtonActive = { link = "LazyH1" },
			LazyReasonStart = { fg = colors.color2 },
		}),
		--: }}}
		--: nvim-neo-tree/neo-tree.nvim {{{
		apply_plugin("neotree", {
			NeoTreeDimText = { link = "Comment" },
			NeoTreeIndentMarker = { link = "NeoTreeDimText" },
			NeoTreeRootName = { link = "Directory" },
			NeoTreeSymbolicLinkTarget = { fg = colors.color6 },
			NeoTreeModified = { link = "DiffChange" },

			NeoTreeGitAdded = { link = "DiffAdd" },
			NeoTreeGitConflict = { link = "DiagnosticError" },
			NeoTreeGitDeleted = { link = "DiffDelete" },
			NeoTreeGitIgnored = { link = "Comment" },
			NeoTreeGitModified = { link = "DiffChange" },
			NeoTreeGitUnstaged = { link = "DiagnosticHint" },
			NeoTreeGitUntracked = { fg = colors.color5 },
			NeoTreeGitStaged = { link = "DiffAdd" },

			NeoTreeFloatTitle = { link = "FloatTitle" },
			NeoTreeTitleBar = { link = "FloatTitle" },

			NeoTreeTabActive = { link = "TabLineSel" },
			NeoTreeTabInactive = { link = "TabLine" },
			NeoTreeTabSeparatorActive = {
				bg = O.transparent_background and colors.none or colors.background,
				fg = O.transparent_background and colors.none or colors.background,
			},
			NeoTreeTabSeparatorInactive = {
				bg = O.transparent_background and colors.none or U.darken(colors.background, 5),
				fg = O.transparent_background and colors.none or U.darken(colors.background, 5),
			},
		}),
		--: }}}
		--: folke/which-key.nvim {{{
		apply_plugin("which_key", {
			WhichKey = { fg = colors.color1 },
			WhichKeyGroup = { fg = colors.color6 },
			WhichKeyDesc = { fg = colors.foreground },
			WhichKeySeperator = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			WhichKeyValue = { link = "Comment" },
			WhichKeySeparator = { link = "Comment" },
			WhichKeyBorder = { link = "FloatBorder" },
			WhichKeyFloat = { link = "NormalFloat" },
		}),
		--: }}}
		--: nvimdev/dashboard-nvim {{{
		apply_plugin("dashboard", {
			DashboardShortCut = { fg = colors.color6 },
			DashboardHeader = { fg = colors.color4 },
			DashboardCenter = { fg = colors.color5 },
			DashboardFooter = { fg = colors.color4 },
			DashboardKey = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			DashboardDesc = { fg = colors.color6 },
			DashboardIcon = { fg = colors.color6, styles = { "bold" } },
		}),
		--: }}}
		--: goolord/alpha-nvim {{{
		apply_plugin("alpha", {
			AlphaShortcut = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			AlphaHeader = { fg = colors.color4 },
			AlphaHeaderLabel = { fg = U.blend(colors.color1, colors.color3, 0.5) },
			AlphaFooter = { fg = colors.color4 },
			AlphaButtons = { fg = colors.color6 },
		}),
		--: }}}
		--: lukas-reineke/indent-blankline.nvim {{{
		apply_plugin("indent_blankline", {
			IndentBlanklineChar = { link = "Comment" },
		}),
		--: }}}
		--: vim.org/netrw {{{
		--: https://www.vim.org/scripts/script.php?script_id=1075
		apply_plugin("netrw", {
			netrwDir = { link = "Directory" },
			netrwClassify = { fg = colors.color2 },
			netrwLink = { fg = colors.color8 },
			netrwSymLink = { fg = colors.foreground },
			netrwExe = { fg = colors.color1 },
			netrwComment = { link = "Comment" },
			netrwList = { fg = colors.color3 },
			netrwHelpCmd = { fg = colors.color4 },
			netrwCmdSep = { fg = colors.color8 },
			netrwVersion = { fg = colors.color5 },
		}),
		--: }}}
		--: mbbill/undotree {{{
		apply_plugin("undotree", {
			UndotreeSavedBig = { fg = colors.color1, styles = { "bold" } },
			UndotreeNode = { fg = colors.color4 },
			UndotreeNodeCurrent = { fg = colors.color5 },
			UndotreeSeq = { fg = colors.color2 },
			UndotreeCurrent = { fg = colors.color4 },
			UndotreeNext = { fg = colors.color3 },
			UndotreeTimeStamp = { fg = colors.color8 },
			UndotreeHead = { fg = colors.color5 },
			UndotreeBranch = { fg = colors.color4 },
			UndotreeSavedSmall = { fg = colors.color1 },
		}),
		--: }}}
		--: nvim-telescope/telescope.nvim {{{
		apply_plugin("telescope", {
			TelescopeNormal = { link = "Normal" },
			TelescopeBorder = { link = "FloatBorder" },
			TelescopeSelection = { link = "CursorLine" },
			TelescopeMatching = { fg = colors.color4, styles = { "bold" } },
			TelescopePromptBorder = { link = "TelescopeBorder" },
			TelescopePromptNormal = { fg = colors.foreground },
			TelescopePromptPrefix = { fg = colors.color4, styles = { "bold" } },
			TelescopePreviewTitle = { fg = colors.color3 },
			TelescopePromptTitle = { fg = colors.color4 },
			TelescopeResultsTitle = { fg = colors.color6 },
			TelescopeSelectionCaret = { bg = U.blend(colors.background, colors.foreground, 0.9), fg = colors.color6 },
			TelescopeResultsVariable = { link = "SpecialChar" },
			TelescopeResultsStruct = { link = "Struct" },
			TelescopeResultsOperator = { link = "Operator" },
			TelescopeResultsMethod = { link = "Method" },
			TelescopeResultsFunction = { link = "Function" },
			TelescopeResultsField = { link = "Function" },
			TelescopeResultsConstant = { link = "Constant" },
			TelescopeResultsClass = { link = "Function" },
			TelescopePreviewMessageFillchar = { link = "TelescopePreviewMessage" },
			TelescopePreviewMessage = { link = "TelescopePreviewNormal" },
			TelescopePreviewNormal = { link = "TelescopeNormal" },
			TelescopePreviewDate = { link = "Directory" },
			TelescopePreviewGroup = { link = "Constant" },
			TelescopePreviewUser = { link = "Constant" },
			TelescopePreviewSize = { link = "String" },
			TelescopePreviewSticky = { link = "Keyword" },
			TelescopePreviewHyphen = { link = "NonText" },
			TelescopePreviewExecute = { link = "String" },
			TelescopePreviewWrite = { link = "Statement" },
			TelescopePreviewRead = { link = "Constant" },
			TelescopePreviewSocket = { link = "Statement" },
			TelescopePreviewLink = { link = "Special" },
			TelescopePreviewBlock = { link = "Constant" },
			TelescopePreviewDirectory = { link = "Directory" },
			TelescopePreviewCharDev = { link = "Constant" },
			TelescopePreviewPipe = { link = "Constant" },
			TelescopePreviewMatch = { link = "Search" },
			TelescopePreviewLine = { link = "Visual" },
			TelescopePromptCounter = { link = "NonText" },
			TelescopeTitle = { link = "TelescopeBorder" },
			TelescopePreviewBorder = { link = "TelescopeBorder" },
			TelescopeResultsBorder = { link = "TelescopeBorder" },
			TelescopeResultsNormal = { link = "TelescopeNormal" },
			TelescopeMultiIcon = { link = "Identifier" },
			TelescopeMultiSelection = { link = "Type" },
			TelescopeResultsDiffUntracked = { link = "NonText" },
			TelescopeResultsDiffDelete = { link = "DiffDelete" },
			TelescopeResultsDiffAdd = { link = "DiffAdd" },
			TelescopeResultsDiffChange = { link = "DiffChange" },
			TelescopeResultsSpecialComment = { link = "SpecialComment" },
			TelescopeResultsComment = { link = "Comment" },
			TelescopeResultsNumber = { link = "Number" },
			TelescopeResultsIdentifier = { link = "Identifier" },
			TelescopeResultsLineNr = { link = "LineNr" },
		}),
		--: }}}
		{}
	)
end

return M
