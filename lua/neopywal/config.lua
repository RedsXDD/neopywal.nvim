-- vim:fileencoding=utf-8:foldmethod=marker

-- Tip: You can discover the highlight groups names that are currently in use by running ":filer /FILTER_STRING/ hi"
-- E.g. To find all the highlight groups for the neovim plugin "bufferline.nvim" you can do ":filter /BufferLine/ hi"

local M = {}

M.get_highlights = function (colors)
	return {
		--: Common highlight groups: {{{
		--: UI: {{{
		Normal                    = { bg = colors.background, fg = colors.foreground },
		NormalNC                  = { link = "Normal" },
		Terminal                  = { link = "Normal" },
		EndOfBuffer               = { fg = colors.background },
		Folded                    = { bg = colors.color0, fg = colors.foreground, bold = true },
		FoldColumn                = { link = "SignColumn" },
		ColorColumn               = { link = "CursorColumn" },
		SignColumn                = { bg = colors.background, fg = colors.foreground },
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
		CursorLine                = { bg = colors.color0, bold = true, italic = true },
		CursorColumn              = { bg = colors.color0, bold = true },
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
		Pmenu                     = { bg = colors.color8, fg = colors.foreground },
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
		StatusLine                = { bg = colors.background, fg = colors.foreground }, -- Lualine highlights.
		StatusLineNC              = { bg = colors.color8 },
		StatusLineTerm            = { link = "StatusLine" },
		StatusLineTermNC          = { link = "StatusLine" },
		TabLine                   = { link = "Normal" },
		TabLineFill               = { link = "TabLine" },
		TabLineSel                = { fg = colors.color4, bold = true, italic = true },
		VertSplit                 = { fg = colors.color7 },
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
		--: }}}
		--: Syntax: {{{
		Type           = { fg = colors.color4, italic = true },
		Structure      = { fg = colors.color4, italic = true },
		StorageClass   = { fg = colors.color4, italic = true },
		Identifier     = { fg = colors.color11, italic = true },
		Constant       = { fg = colors.color11, italic = true },
		PreProc        = { fg = colors.color1 },
		PreCondit      = { fg = colors.color1 },
		Include        = { fg = colors.color1 },
		Keyword        = { fg = colors.color1 },
		Define         = { fg = colors.color1 },
		Typedef        = { fg = colors.color1 },
		Exception      = { fg = colors.color1 },
		Conditional    = { fg = colors.color1 },
		Repeat         = { fg = colors.color1 },
		Statement      = { fg = colors.color1 },
		Macro          = { fg = colors.color5 },
		Error          = { fg = colors.color1 },
		Label          = { fg = colors.color5 },
		Special        = { fg = colors.color5 },
		SpecialChar    = { fg = colors.color5 },
		Substitute     = { bg = colors.color4, fg = colors.background, bold = true },
		Variable       = { fg = colors.color4 },
		Boolean        = { fg = colors.color5 },
		String         = { fg = colors.color3 },
		Character      = { fg = colors.color3 },
		Number         = { fg = colors.color5 },
		Float          = { fg = colors.color5 },
		NormalFloat    = { bg = colors.background },
		FloatBorder    = { bg = colors.none },
		FloatTitle     = { fg = colors.color2, bold = true, italic = true },
		Function       = { fg = colors.color2 },
		Operator       = { fg = colors.color1 },
		Title          = { fg = colors.color1, bold = true },
		Tag            = { fg = colors.color11 },
		Delimiter      = { fg = colors.foreground },
		Comment        = { fg = colors.color8, italic = true },
		SpecialComment = { fg = colors.color8, italic = true },
		Todo           = { fg = colors.color4, bold = true, italic = true },
		Ignore         = { fg = colors.color8 },
		Underlined     = { underline = true },
		--: }}}
		--: }}}
		--: Extended file types: {{{
		--: Markdown: {{{
		--: builtin: {{{
		markdownH1                = { bg = colors.background, fg = colors.color1, bold = true },
		markdownH2                = { bg = colors.background, fg = colors.color11, bold = true },
		markdownH3                = { bg = colors.background, fg = colors.color3, bold = true },
		markdownH4                = { bg = colors.background, fg = colors.color2, bold = true },
		markdownH5                = { bg = colors.background, fg = colors.color4, bold = true },
		markdownH6                = { bg = colors.background, fg = colors.color5, bold = true },
		markdownUrl               = { bg = colors.background, fg = colors.color4, underline = true },
		markdownItalic            = { bg = colors.background, fg = colors.foreground, italic = true },
		markdownBold              = { bg = colors.background, fg = colors.foreground, bold = true },
		markdownItalicDelimiter   = { bg = colors.background, fg = colors.color8, italic = true },
		markdownCode              = { fg = colors.color2 },
		markdownCodeBlock         = { fg = colors.color2 },
		markdownCodeDelimiter     = { fg = colors.color2 },
		markdownBlockquote        = { fg = colors.color8 },
		markdownListMarker        = { fg = colors.color1 },
		markdownOrderedListMarker = { fg = colors.color1 },
		markdownRule              = { fg = colors.color5 },
		markdownHeadingRule       = { fg = colors.color8 },
		markdownUrlDelimiter      = { fg = colors.color8 },
		markdownLinkDelimiter     = { fg = colors.color8 },
		markdownLinkTextDelimiter = { fg = colors.color8 },
		markdownHeadingDelimiter  = { fg = colors.color8 },
		markdownLinkText          = { fg = colors.color1 },
		markdownUrlTitleDelimiter = { fg = colors.color2 },
		markdownIdDeclaration     = { link = "markdownLinkText" },
		markdownBoldDelimiter     = { fg = colors.color8 },
		markdownId                = { fg = colors.color3 },
		--: }}}
		--: vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
		mkdURL            = { bg = colors.background, fg = colors.color4, underline = true },
		mkdInlineURL      = { bg = colors.background, fg = colors.color4, underline = true },
		mkdItalic         = { bg = colors.background, fg = colors.color8, italic = true },
		mkdCodeDelimiter  = { fg = colors.color2 },
		mkdBold           = { fg = colors.color8 },
		mkdLink           = { fg = colors.color1 },
		mkdHeading        = { fg = colors.color8 },
		mkdListItem       = { fg = colors.color1 },
		mkdRule           = { fg = colors.color5 },
		mkdDelimiter      = { fg = colors.color8 },
		mkdId             = { fg = colors.color3 },
		--: }}}
		--: }}}
		--: ReStructuredText: {{{
		--: builtin: https://github.com/marshallward/vim-restructuredtext{{{
		rstStandaloneHyperlink                   = { bg = colors.background, fg = colors.color5, underline = true },
		rstEmphasis                              = { bg = colors.background, fg = colors.foreground, italic = true },
		rstStrongEmphasis                        = { bg = colors.background, fg = colors.foreground, bold = true },
		rstHyperlinkTarget                       = { bg = colors.background, fg = colors.color4, underline = true },
		rstSubstitutionReference                 = { fg = colors.color4 },
		rstInterpretedTextOrHyperlinkReference   = { fg = colors.color2 },
		rstTableLines                            = { fg = colors.color8 },
		rstInlineLiteral                         = { fg = colors.color2 },
		rstLiteralBlock                          = { fg = colors.color2 },
		rstQuotedLiteralBlock                    = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: LaTex: {{{
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
		texStatement    = { fg = colors.color4, italic = true },
		texOnlyMath     = { fg = colors.color8 },
		texDefName      = { fg = colors.color3 },
		texNewCmd       = { fg = colors.color11 },
		texCmdName      = { fg = colors.color4 },
		texBeginEnd     = { fg = colors.color1 },
		texBeginEndName = { fg = colors.color2 },
		texDocType      = { fg = colors.color1, italic = true },
		texDocTypeArgs  = { fg = colors.color11 },
		texInputFile    = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: Html: {{{
		--: builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
		htmlH1                  = { bg = colors.background, fg = colors.color1, bold = true },
		htmlH2                  = { bg = colors.background, fg = colors.color11, bold = true },
		htmlH3                  = { bg = colors.background, fg = colors.color3, bold = true },
		htmlH4                  = { bg = colors.background, fg = colors.color2, bold = true },
		htmlH5                  = { bg = colors.background, fg = colors.color4, bold = true },
		htmlH6                  = { bg = colors.background, fg = colors.color5, bold = true },
		htmlLink                = { bg = colors.background, fg = colors.foreground, underline = true },
		htmlBold                = { bg = colors.background, fg = colors.foreground, bold = true },
		htmlBoldUnderline       = { bg = colors.background, fg = colors.foreground, bold = true, underline = true },
		htmlBoldItalic          = { bg = colors.background, fg = colors.foreground, bold = true, italic = true },
		htmlBoldUnderlineItalic = { bg = colors.background, fg = colors.foreground, bold = true, underline = true, italic = true },
		htmlUnderline           = { bg = colors.background, fg = colors.foreground, underline = true },
		htmlUnderlineItalic     = { bg = colors.background, fg = colors.foreground, underline = true, italic = true },
		htmlItalic              = { bg = colors.background, fg = colors.foreground, italic = true },
		htmlTag                 = { fg = colors.color2 },
		htmlEndTag              = { fg = colors.color4 },
		htmlTagN                = { fg = colors.color1, italic = true },
		htmlTagName             = { fg = colors.color1, italic = true },
		htmlArg                 = { fg = colors.color4 },
		htmlScriptTag           = { fg = colors.color5 },
		htmlSpecialTagName      = { fg = colors.color1, italic = true },
		htmlString              = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: Xml: {{{
		--: builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
		xmlTag            = { fg = colors.color2 },
		xmlEndTag         = { fg = colors.color4 },
		xmlTagName        = { fg = colors.color1, italic = true },
		xmlEqual          = { fg = colors.color11 },
		xmlAttrib         = { fg = colors.color4 },
		xmlEntity         = { fg = colors.color1 },
		xmlEntityPunct    = { fg = colors.color1 },
		xmlDocTypeDecl    = { fg = colors.color8 },
		xmlDocTypeKeyword = { fg = colors.color1, italic = true },
		xmlCdataStart     = { fg = colors.color8 },
		xmlCdataCdata     = { fg = colors.color5 },
		xmlString         = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: CSS: {{{
		--: builtin: https://github.com/JulesWang/css.vim{{{
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
		--: }}}
		--: }}}
		--: SASS: {{{
		--: scss-syntax: https://github.com/cakebaker/scss-syntax.vim{{{
		scssMixinName              = { fg = colors.color11 },
		scssSelectorChar           = { fg = colors.color11 },
		scssSelectorName           = { fg = colors.color1 },
		scssInterpolationDelimiter = { fg = colors.color3 },
		scssVariableValue          = { fg = colors.color2 },
		scssNull                   = { fg = colors.color5 },
		scssBoolean                = { fg = colors.color5 },
		scssVariableAssignment     = { fg = colors.color8 },
		scssAttribute              = { fg = colors.color2 },
		scssFunctionName           = { fg = colors.color11 },
		scssVariable               = { fg = colors.foreground },
		scssAmpersand              = { fg = colors.color5 },
		--: }}}
		--: }}}
		--: LESS: {{{
		--: vim-less: https://github.com/groenewege/vim-less{{{
		lessMixinChar = { fg = colors.color8 },
		lessClass     = { fg = colors.color1 },
		lessFunction  = { fg = colors.color11 },
		--: }}}
		--: }}}
		--: JavaScript: {{{
		--: builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
		javaScriptNull       = { fg = colors.color11, italic = true },
		javaScriptIdentifier = { fg = colors.color4, italic = true },
		javaScriptParens     = { fg = colors.foreground },
		javaScriptBraces     = { fg = colors.foreground },
		javaScriptNumber     = { fg = colors.color5 },
		javaScriptLabel      = { fg = colors.color1 },
		javaScriptGlobal     = { fg = colors.color4, italic = true },
		javaScriptMessage    = { fg = colors.color4, italic = true },
		--: }}}
		--: vim-javascript: https://github.com/pangloss/vim-javascript{{{
		jsNoise              = { fg = colors.foreground },
		Noise                = { fg = colors.foreground },
		jsParens             = { fg = colors.foreground },
		jsBrackets           = { fg = colors.foreground },
		jsObjectBraces       = { fg = colors.foreground },
		jsThis               = { fg = colors.color4, italic = true },
		jsUndefined          = { fg = colors.color11, italic = true },
		jsNull               = { fg = colors.color11, italic = true },
		jsNan                = { fg = colors.color11, italic = true },
		jsSuper              = { fg = colors.color11, italic = true },
		jsPrototype          = { fg = colors.color11, italic = true },
		jsFunction           = { fg = colors.color1 },
		jsGlobalNodeObjects  = { fg = colors.color4, italic = true },
		jsGlobalObjects      = { fg = colors.color4, italic = true },
		jsArrowFunction      = { fg = colors.color1 },
		jsArrowFuncArgs      = { fg = colors.foreground },
		jsFuncArgs           = { fg = colors.foreground },
		jsObjectProp         = { fg = colors.foreground },
		jsVariableDef        = { fg = colors.foreground },
		jsObjectKey          = { fg = colors.foreground },
		jsParen              = { fg = colors.foreground },
		jsParenIfElse        = { fg = colors.foreground },
		jsParenRepeat        = { fg = colors.foreground },
		jsParenSwitch        = { fg = colors.foreground },
		jsParenCatch         = { fg = colors.foreground },
		jsBracket            = { fg = colors.foreground },
		jsObjectValue        = { fg = colors.foreground },
		jsDestructuringBlock = { fg = colors.foreground },
		jsBlockLabel         = { fg = colors.color5 },
		jsFunctionKey        = { fg = colors.color2 },
		jsClassDefinition    = { fg = colors.color4, italic = true },
		jsDot                = { fg = colors.color11 },
		jsSpreadExpression   = { fg = colors.color5 },
		jsSpreadOperator     = { fg = colors.color2 },
		jsModuleKeyword      = { fg = colors.color4, italic = true },
		jsTemplateExpression = { fg = colors.color5 },
		jsTemplateBraces     = { fg = colors.color5 },
		jsClassMethodType    = { fg = colors.color4, italic = true },
		jsExceptions         = { fg = colors.color4, italic = true },
		--: }}}
		--: yajs: https://github.com/othree/yajs.vim{{{
		javascriptOpSymbol                  = { fg = colors.color1 },
		javascriptOpSymbols                 = { fg = colors.color1 },
		javascriptIdentifierName            = { fg = colors.foreground },
		javascriptVariable                  = { fg = colors.color4, italic = true },
		javascriptObjectLabel               = { fg = colors.foreground },
		javascriptPropertyNameString        = { fg = colors.foreground },
		javascriptFuncArg                   = { fg = colors.foreground },
		javascriptObjectLiteral             = { fg = colors.color2 },
		javascriptIdentifier                = { fg = colors.color11, italic = true },
		javascriptArrowFunc                 = { fg = colors.color1 },
		javascriptTemplate                  = { fg = colors.color5 },
		javascriptTemplateSubstitution      = { fg = colors.color5 },
		javascriptTemplateSB                = { fg = colors.color5 },
		javascriptNodeGlobal                = { fg = colors.color4, italic = true },
		javascriptDocTags                   = { fg = colors.color1, italic = true },
		javascriptDocNotation               = { fg = colors.color4 },
		javascriptClassSuper                = { fg = colors.color11, italic = true },
		javascriptClassName                 = { fg = colors.color4, italic = true },
		javascriptClassSuperName            = { fg = colors.color4, italic = true },
		javascriptOperator                  = { fg = colors.color1 },
		javascriptBrackets                  = { fg = colors.foreground },
		javascriptBraces                    = { fg = colors.foreground },
		javascriptLabel                     = { fg = colors.color5 },
		javascriptEndColons                 = { fg = colors.color8 },
		javascriptObjectLabelColon          = { fg = colors.color8 },
		javascriptDotNotation               = { fg = colors.color11 },
		javascriptGlobalArrayDot            = { fg = colors.color11 },
		javascriptGlobalBigIntDot           = { fg = colors.color11 },
		javascriptGlobalDateDot             = { fg = colors.color11 },
		javascriptGlobalJSONDot             = { fg = colors.color11 },
		javascriptGlobalMathDot             = { fg = colors.color11 },
		javascriptGlobalNumberDot           = { fg = colors.color11 },
		javascriptGlobalObjectDot           = { fg = colors.color11 },
		javascriptGlobalPromiseDot          = { fg = colors.color11 },
		javascriptGlobalRegExpDot           = { fg = colors.color11 },
		javascriptGlobalStringDot           = { fg = colors.color11 },
		javascriptGlobalSymbolDot           = { fg = colors.color11 },
		javascriptGlobalURLDot              = { fg = colors.color11 },
		javascriptMethod                    = { fg = colors.color2 },
		javascriptMethodName                = { fg = colors.color2 },
		javascriptObjectMethodName          = { fg = colors.color2 },
		javascriptGlobalMethod              = { fg = colors.color2 },
		javascriptDOMStorageMethod          = { fg = colors.color2 },
		javascriptFileMethod                = { fg = colors.color2 },
		javascriptFileReaderMethod          = { fg = colors.color2 },
		javascriptFileListMethod            = { fg = colors.color2 },
		javascriptBlobMethod                = { fg = colors.color2 },
		javascriptURLStaticMethod           = { fg = colors.color2 },
		javascriptNumberStaticMethod        = { fg = colors.color2 },
		javascriptNumberMethod              = { fg = colors.color2 },
		javascriptDOMNodeMethod             = { fg = colors.color2 },
		javascriptES6BigIntStaticMethod     = { fg = colors.color2 },
		javascriptBOMWindowMethod           = { fg = colors.color2 },
		javascriptHeadersMethod             = { fg = colors.color2 },
		javascriptRequestMethod             = { fg = colors.color2 },
		javascriptResponseMethod            = { fg = colors.color2 },
		javascriptES6SetMethod              = { fg = colors.color2 },
		javascriptReflectMethod             = { fg = colors.color2 },
		javascriptPaymentMethod             = { fg = colors.color2 },
		javascriptPaymentResponseMethod     = { fg = colors.color2 },
		javascriptTypedArrayStaticMethod    = { fg = colors.color2 },
		javascriptGeolocationMethod         = { fg = colors.color2 },
		javascriptES6MapMethod              = { fg = colors.color2 },
		javascriptServiceWorkerMethod       = { fg = colors.color2 },
		javascriptCacheMethod               = { fg = colors.color2 },
		javascriptFunctionMethod            = { fg = colors.color2 },
		javascriptXHRMethod                 = { fg = colors.color2 },
		javascriptBOMNavigatorMethod        = { fg = colors.color2 },
		javascriptDOMEventTargetMethod      = { fg = colors.color2 },
		javascriptDOMEventMethod            = { fg = colors.color2 },
		javascriptIntlMethod                = { fg = colors.color2 },
		javascriptDOMDocMethod              = { fg = colors.color2 },
		javascriptStringStaticMethod        = { fg = colors.color2 },
		javascriptStringMethod              = { fg = colors.color2 },
		javascriptSymbolStaticMethod        = { fg = colors.color2 },
		javascriptRegExpMethod              = { fg = colors.color2 },
		javascriptObjectStaticMethod        = { fg = colors.color2 },
		javascriptObjectMethod              = { fg = colors.color2 },
		javascriptBOMLocationMethod         = { fg = colors.color2 },
		javascriptJSONStaticMethod          = { fg = colors.color2 },
		javascriptGeneratorMethod           = { fg = colors.color2 },
		javascriptEncodingMethod            = { fg = colors.color2 },
		javascriptPromiseStaticMethod       = { fg = colors.color2 },
		javascriptPromiseMethod             = { fg = colors.color2 },
		javascriptBOMHistoryMethod          = { fg = colors.color2 },
		javascriptDOMFormMethod             = { fg = colors.color2 },
		javascriptClipboardMethod           = { fg = colors.color2 },
		javascriptBroadcastMethod           = { fg = colors.color2 },
		javascriptDateStaticMethod          = { fg = colors.color2 },
		javascriptDateMethod                = { fg = colors.color2 },
		javascriptConsoleMethod             = { fg = colors.color2 },
		javascriptArrayStaticMethod         = { fg = colors.color2 },
		javascriptArrayMethod               = { fg = colors.color2 },
		javascriptMathStaticMethod          = { fg = colors.color2 },
		javascriptSubtleCryptoMethod        = { fg = colors.color2 },
		javascriptCryptoMethod              = { fg = colors.color2 },
		javascriptProp                      = { fg = colors.foreground },
		javascriptBOMWindowProp             = { fg = colors.foreground },
		javascriptDOMStorageProp            = { fg = colors.foreground },
		javascriptFileReaderProp            = { fg = colors.foreground },
		javascriptURLUtilsProp              = { fg = colors.foreground },
		javascriptNumberStaticProp          = { fg = colors.foreground },
		javascriptDOMNodeProp               = { fg = colors.foreground },
		javascriptRequestProp               = { fg = colors.foreground },
		javascriptResponseProp              = { fg = colors.foreground },
		javascriptES6SetProp                = { fg = colors.foreground },
		javascriptPaymentProp               = { fg = colors.foreground },
		javascriptPaymentResponseProp       = { fg = colors.foreground },
		javascriptPaymentAddressProp        = { fg = colors.foreground },
		javascriptPaymentShippingOptionProp = { fg = colors.foreground },
		javascriptTypedArrayStaticProp      = { fg = colors.foreground },
		javascriptServiceWorkerProp         = { fg = colors.foreground },
		javascriptES6MapProp                = { fg = colors.foreground },
		javascriptRegExpStaticProp          = { fg = colors.foreground },
		javascriptRegExpProp                = { fg = colors.foreground },
		javascriptXHRProp                   = { fg = colors.foreground },
		javascriptBOMNavigatorProp          = { fg = colors.color2 },
		javascriptDOMEventProp              = { fg = colors.foreground },
		javascriptBOMNetworkProp            = { fg = colors.foreground },
		javascriptDOMDocProp                = { fg = colors.foreground },
		javascriptSymbolStaticProp          = { fg = colors.foreground },
		javascriptSymbolProp                = { fg = colors.foreground },
		javascriptBOMLocationProp           = { fg = colors.foreground },
		javascriptEncodingProp              = { fg = colors.foreground },
		javascriptCryptoProp                = { fg = colors.foreground },
		javascriptBOMHistoryProp            = { fg = colors.foreground },
		javascriptDOMFormProp               = { fg = colors.foreground },
		javascriptDataViewProp              = { fg = colors.foreground },
		javascriptBroadcastProp             = { fg = colors.foreground },
		javascriptMathStaticProp            = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: JavaScript React: {{{
		--: vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
		jsxTagName    = { fg = colors.color1, italic = true },
		jsxOpenPunct  = { fg = colors.color2 },
		jsxClosePunct = { fg = colors.color4 },
		jsxEscapeJs   = { fg = colors.color5 },
		jsxAttrib     = { fg = colors.color4 },
		--: }}}
		--: }}}
		--: TypeScript: {{{
		--: vim-typescript: https://github.com/leafgarland/typescript-vim{{{
		typescriptStorageClass           = { fg = colors.color1 },
		typescriptEndColons              = { fg = colors.foreground },
		typescriptSource                 = { fg = colors.color4, italic = true },
		typescriptMessage                = { fg = colors.color2 },
		typescriptGlobalObjects          = { fg = colors.color4, italic = true },
		typescriptInterpolation          = { fg = colors.color5 },
		typescriptInterpolationDelimiter = { fg = colors.color5 },
		typescriptBraces                 = { fg = colors.foreground },
		typescriptParens                 = { fg = colors.foreground },
		--: }}}
		--: yats: https:github.com/HerringtonDarkholme/yats.vim{{{
		typescriptMethodAccessor            = { fg = colors.color1 },
		typescriptVariable                  = { fg = colors.color1 },
		typescriptVariableDeclaration       = { fg = colors.foreground },
		typescriptTypeReference             = { fg = colors.color4, italic = true },
		typescriptEnumKeyword               = { fg = colors.color1 },
		typescriptEnum                      = { fg = colors.color4, italic = true },
		typescriptIdentifierName            = { fg = colors.foreground },
		typescriptProp                      = { fg = colors.foreground },
		typescriptCall                      = { fg = colors.foreground },
		typescriptInterfaceName             = { fg = colors.color4, italic = true },
		typescriptMember                    = { fg = colors.foreground },
		typescriptMemberOptionality         = { fg = colors.color1 },
		typescriptObjectLabel               = { fg = colors.foreground },
		typescriptDefaultParam              = { fg = colors.foreground },
		typescriptArrowFunc                 = { fg = colors.color1 },
		typescriptAbstract                  = { fg = colors.color1 },
		typescriptObjectColon               = { fg = colors.color8 },
		typescriptTypeAnnotation            = { fg = colors.color8 },
		typescriptAssign                    = { fg = colors.color1 },
		typescriptBinaryOp                  = { fg = colors.color1 },
		typescriptUnaryOp                   = { fg = colors.color1 },
		typescriptFuncComma                 = { fg = colors.foreground },
		typescriptClassName                 = { fg = colors.color4, italic = true },
		typescriptClassHeritage             = { fg = colors.color4, italic = true },
		typescriptInterfaceHeritage         = { fg = colors.color4, italic = true },
		typescriptIdentifier                = { fg = colors.color11, italic = true },
		typescriptGlobal                    = { fg = colors.color4, italic = true },
		typescriptOperator                  = { fg = colors.color1 },
		typescriptNodeGlobal                = { fg = colors.color4, italic = true },
		typescriptExport                    = { fg = colors.color1 },
		typescriptImport                    = { fg = colors.color1 },
		typescriptTypeParameter             = { fg = colors.color4, italic = true },
		typescriptReadonlyModifier          = { fg = colors.color1 },
		typescriptAccessibilityModifier     = { fg = colors.color1 },
		typescriptAmbientDeclaration        = { fg = colors.color1 },
		typescriptTemplateSubstitution      = { fg = colors.color5 },
		typescriptTemplateSB                = { fg = colors.color5 },
		typescriptExceptions                = { fg = colors.color1 },
		typescriptCastKeyword               = { fg = colors.color1 },
		typescriptOptionalMark              = { fg = colors.color1 },
		typescriptNull                      = { fg = colors.color11, italic = true },
		typescriptMappedIn                  = { fg = colors.color1 },
		typescriptFuncTypeArrow             = { fg = colors.color1 },
		typescriptTernaryOp                 = { fg = colors.color1 },
		typescriptParenExp                  = { fg = colors.foreground },
		typescriptIndexExpr                 = { fg = colors.foreground },
		typescriptDotNotation               = { fg = colors.color11 },
		typescriptGlobalNumberDot           = { fg = colors.color11 },
		typescriptGlobalStringDot           = { fg = colors.color11 },
		typescriptGlobalArrayDot            = { fg = colors.color11 },
		typescriptGlobalObjectDot           = { fg = colors.color11 },
		typescriptGlobalSymbolDot           = { fg = colors.color11 },
		typescriptGlobalMathDot             = { fg = colors.color11 },
		typescriptGlobalDateDot             = { fg = colors.color11 },
		typescriptGlobalJSONDot             = { fg = colors.color11 },
		typescriptGlobalRegExpDot           = { fg = colors.color11 },
		typescriptGlobalPromiseDot          = { fg = colors.color11 },
		typescriptGlobalURLDot              = { fg = colors.color11 },
		typescriptGlobalMethod              = { fg = colors.color2 },
		typescriptDOMStorageMethod          = { fg = colors.color2 },
		typescriptFileMethod                = { fg = colors.color2 },
		typescriptFileReaderMethod          = { fg = colors.color2 },
		typescriptFileListMethod            = { fg = colors.color2 },
		typescriptBlobMethod                = { fg = colors.color2 },
		typescriptURLStaticMethod           = { fg = colors.color2 },
		typescriptNumberStaticMethod        = { fg = colors.color2 },
		typescriptNumberMethod              = { fg = colors.color2 },
		typescriptDOMNodeMethod             = { fg = colors.color2 },
		typescriptPaymentMethod             = { fg = colors.color2 },
		typescriptPaymentResponseMethod     = { fg = colors.color2 },
		typescriptHeadersMethod             = { fg = colors.color2 },
		typescriptRequestMethod             = { fg = colors.color2 },
		typescriptResponseMethod            = { fg = colors.color2 },
		typescriptES6SetMethod              = { fg = colors.color2 },
		typescriptReflectMethod             = { fg = colors.color2 },
		typescriptBOMWindowMethod           = { fg = colors.color2 },
		typescriptGeolocationMethod         = { fg = colors.color2 },
		typescriptServiceWorkerMethod       = { fg = colors.color2 },
		typescriptCacheMethod               = { fg = colors.color2 },
		typescriptES6MapMethod              = { fg = colors.color2 },
		typescriptFunctionMethod            = { fg = colors.color2 },
		typescriptRegExpMethod              = { fg = colors.color2 },
		typescriptXHRMethod                 = { fg = colors.color2 },
		typescriptBOMNavigatorMethod        = { fg = colors.color2 },
		typescriptIntlMethod                = { fg = colors.color2 },
		typescriptDOMEventTargetMethod      = { fg = colors.color2 },
		typescriptDOMEventMethod            = { fg = colors.color2 },
		typescriptDOMDocMethod              = { fg = colors.color2 },
		typescriptStringStaticMethod        = { fg = colors.color2 },
		typescriptStringMethod              = { fg = colors.color2 },
		typescriptSymbolStaticMethod        = { fg = colors.color2 },
		typescriptObjectStaticMethod        = { fg = colors.color2 },
		typescriptObjectMethod              = { fg = colors.color2 },
		typescriptJSONStaticMethod          = { fg = colors.color2 },
		typescriptEncodingMethod            = { fg = colors.color2 },
		typescriptBOMLocationMethod         = { fg = colors.color2 },
		typescriptPromiseStaticMethod       = { fg = colors.color2 },
		typescriptPromiseMethod             = { fg = colors.color2 },
		typescriptSubtleCryptoMethod        = { fg = colors.color2 },
		typescriptCryptoMethod              = { fg = colors.color2 },
		typescriptBOMHistoryMethod          = { fg = colors.color2 },
		typescriptDOMFormMethod             = { fg = colors.color2 },
		typescriptConsoleMethod             = { fg = colors.color2 },
		typescriptDateStaticMethod          = { fg = colors.color2 },
		typescriptDateMethod                = { fg = colors.color2 },
		typescriptArrayStaticMethod         = { fg = colors.color2 },
		typescriptArrayMethod               = { fg = colors.color2 },
		typescriptMathStaticMethod          = { fg = colors.color2 },
		typescriptStringProperty            = { fg = colors.foreground },
		typescriptDOMStorageProp            = { fg = colors.foreground },
		typescriptFileReaderProp            = { fg = colors.foreground },
		typescriptURLUtilsProp              = { fg = colors.foreground },
		typescriptNumberStaticProp          = { fg = colors.foreground },
		typescriptDOMNodeProp               = { fg = colors.foreground },
		typescriptBOMWindowProp             = { fg = colors.foreground },
		typescriptRequestProp               = { fg = colors.foreground },
		typescriptResponseProp              = { fg = colors.foreground },
		typescriptPaymentProp               = { fg = colors.foreground },
		typescriptPaymentResponseProp       = { fg = colors.foreground },
		typescriptPaymentAddressProp        = { fg = colors.foreground },
		typescriptPaymentShippingOptionProp = { fg = colors.foreground },
		typescriptES6SetProp                = { fg = colors.foreground },
		typescriptServiceWorkerProp         = { fg = colors.foreground },
		typescriptES6MapProp                = { fg = colors.foreground },
		typescriptRegExpStaticProp          = { fg = colors.foreground },
		typescriptRegExpProp                = { fg = colors.foreground },
		typescriptBOMNavigatorProp          = { fg = colors.color2 },
		typescriptXHRProp                   = { fg = colors.foreground },
		typescriptDOMEventProp              = { fg = colors.foreground },
		typescriptDOMDocProp                = { fg = colors.foreground },
		typescriptBOMNetworkProp            = { fg = colors.foreground },
		typescriptSymbolStaticProp          = { fg = colors.foreground },
		typescriptEncodingProp              = { fg = colors.foreground },
		typescriptBOMLocationProp           = { fg = colors.foreground },
		typescriptCryptoProp                = { fg = colors.foreground },
		typescriptDOMFormProp               = { fg = colors.foreground },
		typescriptBOMHistoryProp            = { fg = colors.foreground },
		typescriptMathStaticProp            = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: Dart: {{{
		--: dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
		dartCoreClasses   = { fg = colors.color4, italic = true },
		dartTypeName      = { fg = colors.color4, italic = true },
		dartInterpolation = { fg = colors.color5 },
		dartTypeDef       = { fg = colors.color1 },
		dartClassDecl     = { fg = colors.color1 },
		dartLibrary       = { fg = colors.color1 },
		dartMetadata      = { fg = colors.color11, italic = true },
		--: }}}
		--: }}}
		--: C/C++: {{{
		--: vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
		cLabel          = { fg = colors.color1 },
		cppSTLnamespace = { fg = colors.color4, italic = true },
		cppSTLtype      = { fg = colors.color4, italic = true },
		cppAccess       = { fg = colors.color1 },
		cppStructure    = { fg = colors.color1 },
		cppSTLios       = { fg = colors.color4, italic = true },
		cppSTLiterator  = { fg = colors.color4, italic = true },
		cppSTLexception = { fg = colors.color1 },
		--: }}}
		--: vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
		cppSTLVariable = { fg = colors.color4, italic = true },
		--: }}}
		--: chromatica: https://github.com/arakashic/chromatica.nvim{{{
		Member              = { fg = colors.color11, italic = true },
		-- Variable            = { fg = colors.foreground },
		Namespace           = { fg = colors.color4, italic = true },
		EnumConstant        = { fg = colors.color11, italic = true },
		chromaticaException = { fg = colors.color1 },
		chromaticaCast      = { fg = colors.color1 },
		OperatorOverload    = { fg = colors.color1 },
		AccessQual          = { fg = colors.color1 },
		Linkage             = { fg = colors.color1 },
		AutoType            = { fg = colors.color4, italic = true },
		--: }}}
		--: vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight{{{
		LspCxxHlSkippedRegion         = { fg = colors.color8 },
		LspCxxHlSkippedRegionBeginEnd = { fg = colors.color1 },
		LspCxxHlGroupEnumConstant     = { fg = colors.color11, italic = true },
		LspCxxHlGroupNamespace        = { fg = colors.color4, italic = true },
		LspCxxHlGroupMemberVariable   = { fg = colors.color11, italic = true },
		--: }}}
		--: }}}
		--: ObjectiveC: {{{
		--: builtin: {{{
		objcModuleImport      = { fg = colors.color1 },
		objcException         = { fg = colors.color1 },
		objcProtocolList      = { fg = colors.foreground },
		objcDirective         = { fg = colors.color1 },
		objcPropertyAttribute = { fg = colors.color5 },
		objcHiddenArgument    = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: C#: {{{
		--: builtin: https://github.com/nickspoons/vim-cs{{{
		csUnspecifiedStatement   = { fg = colors.color1 },
		csStorage                = { fg = colors.color1 },
		csClass                  = { fg = colors.color1 },
		csNewType                = { fg = colors.color4, italic = true },
		csContextualStatement    = { fg = colors.color1 },
		csInterpolationDelimiter = { fg = colors.color5 },
		csInterpolation          = { fg = colors.color5 },
		csEndColon               = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: Python: {{{
		--: builtin: {{{
		pythonBuiltin       = { fg = colors.color4, italic = true },
		pythonExceptions    = { fg = colors.color1 },
		pythonDecoratorName = { fg = colors.color11, italic = true },
		--: }}}
		--: python-syntax: https://github.com/vim-python/python-syntax{{{
		pythonExClass     = { fg = colors.color4, italic = true },
		pythonBuiltinType = { fg = colors.color4, italic = true },
		pythonBuiltinObj  = { fg = colors.color11, italic = true },
		pythonDottedName  = { fg = colors.color11, italic = true },
		pythonBuiltinFunc = { fg = colors.color2 },
		pythonFunction    = { fg = colors.color2 },
		pythonDecorator   = { fg = colors.color11, italic = true },
		pythonInclude     = { link = "Inclue" },
		pythonImport      = { link = "PreProc" },
		pythonOperator    = { fg = colors.color1 },
		pythonConditional = { fg = colors.color1 },
		pythonRepeat      = { fg = colors.color1 },
		pythonException   = { fg = colors.color1 },
		pythonNone        = { fg = colors.color11, italic = true },
		pythonCoding      = { fg = colors.color8 },
		pythonDot         = { fg = colors.color8 },
		--: }}}
		--: semshi: https://github.com/numirias/semshi{{{
		semshiUnresolved      = { bg = colors.background, fg = colors.color11, undercurl = true },
		semshiImported        = { fg = colors.color4, italic = true },
		semshiParameter       = { fg = colors.color11, italic = true },
		semshiParameterUnused = { fg = colors.color8 },
		semshiSelf            = { fg = colors.color4, italic = true },
		semshiGlobal          = { fg = colors.color2 },
		semshiBuiltin         = { fg = colors.color2 },
		semshiAttribute       = { fg = colors.color11, italic = true },
		semshiLocal           = { fg = colors.color1 },
		semshiFree            = { fg = colors.color1 },
		semshiSelected        = { link = "CocHighlightText" },
		semshiErrorSign       = { link = "ALEErrorSign" },
		semshiErrorChar       = { link = "ALEErrorSign" },
		--: }}}
		--: }}}
		--: Lua: {{{
		--: builtin: {{{
		luaFunc     = { fg = colors.color2 },
		luaFunction = { fg = colors.color1 },
		luaTable    = { fg = colors.color4 },
		luaIn       = { fg = colors.color1 },
		--: }}}
		--: vim-lua: https://github.com/tbastos/vim-lua{{{
		luaFuncCall     = { fg = colors.color2 },
		luaLocal        = { fg = colors.color1 },
		luaSpecialValue = { fg = colors.color2 },
		luaBraces       = { fg = colors.foreground },
		luaBuiltIn      = { fg = colors.color4, italic = true },
		luaNoise        = { fg = colors.color8 },
		luaLabel        = { fg = colors.color5 },
		luaFuncTable    = { fg = colors.color4, italic = true },
		luaFuncArgName  = { fg = colors.foreground },
		luaEllipsis     = { fg = colors.color1 },
		luaDocTag       = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: Java: {{{
		--: builtin: {{{
		javaClassDecl  = { fg = colors.color1 },
		javaMethodDecl = { fg = colors.color1 },
		javaVarArg     = { fg = colors.foreground },
		javaAnnotation = { fg = colors.color5 },
		javaUserLabel  = { fg = colors.color5 },
		javaTypedef    = { fg = colors.color11, italic = true },
		javaParen      = { fg = colors.foreground },
		javaParen1     = { fg = colors.foreground },
		javaParen2     = { fg = colors.foreground },
		javaParen3     = { fg = colors.foreground },
		javaParen4     = { fg = colors.foreground },
		javaParen5     = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: Kotlin: {{{
		--: kotlin-vim: https://github.com/udalov/kotlin-vim{{{
		ktSimpleInterpolation       = { fg = colors.color5 },
		ktComplexInterpolation      = { fg = colors.color5 },
		ktComplexInterpolationBrace = { fg = colors.color5 },
		ktStructure                 = { fg = colors.color1 },
		ktKeyword                   = { fg = colors.color11, italic = true },
		--: }}}
		--: }}}
		--: Scala: {{{
		--: builtin: https://github.com/derekwyatt/vim-scala{{{
		scalaNameDefinition        = { fg = colors.foreground },
		scalaInterpolationBoundary = { fg = colors.color5 },
		scalaInterpolation         = { fg = colors.color5 },
		scalaTypeOperator          = { fg = colors.color1 },
		scalaOperator              = { fg = colors.color1 },
		scalaKeywordModifier       = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: Go: {{{
		--: builtin: https://github.com/google/vim-ft-go{{{
		goDirective = { fg = colors.color1 },
		goConstants = { fg = colors.color11, italic = true },
		goDeclType  = { fg = colors.color1 },
		--: }}}
		--: polyglot: {{{
		goPackage               = { fg = colors.color1 },
		goImport                = { fg = colors.color1 },
		goBuiltins              = { fg = colors.color2 },
		goPredefinedIdentifiers = { fg = colors.color11, italic = true },
		goVar                   = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: Rust: {{{
		--: builtin: https://github.com/rust-lang/rust.vim{{{
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
		--: }}}
		--: }}}
		--: Swift: {{{
		--: swift.vim: https://github.com/keith/swift.vim{{{
		swiftInterpolatedWrapper = { fg = colors.color5 },
		swiftInterpolatedString  = { fg = colors.color5 },
		swiftProperty            = { fg = colors.foreground },
		swiftTypeDeclaration     = { fg = colors.color1 },
		swiftClosureArgument     = { fg = colors.color11, italic = true },
		swiftStructure           = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: PHP: {{{
		--: builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
		phpVarSelector       = { fg = colors.foreground },
		phpIdentifier        = { fg = colors.foreground },
		phpDefine            = { fg = colors.color2 },
		phpStructure         = { fg = colors.color1 },
		phpSpecialFunction   = { fg = colors.color2 },
		phpInterpSimpleCurly = { fg = colors.color5 },
		phpComparison        = { fg = colors.color1 },
		phpMethodsVar        = { fg = colors.foreground },
		phpInterpVarname     = { fg = colors.foreground },
		phpMemberSelector    = { fg = colors.color1 },
		phpLabel             = { fg = colors.color1 },
		--: }}}
		--: php.vim: https://github.com/StanAngeloff/php.vim{{{
		phpParent       = { fg = colors.foreground },
		phpNowDoc       = { fg = colors.color3 },
		phpFunction     = { fg = colors.color2 },
		phpMethod       = { fg = colors.color2 },
		phpClass        = { fg = colors.color4, italic = true },
		phpSuperglobals = { fg = colors.color4, italic = true },
		phpNullValue    = { fg = colors.color11, italic = true },
		--: }}}
		--: }}}
		--: Ruby: {{{
		--: builtin: https://github.com/vim-ruby/vim-ruby{{{
		rubyKeywordAsMethod        = { fg = colors.color2 },
		rubyInterpolation          = { fg = colors.color5 },
		rubyInterpolationDelimiter = { fg = colors.color5 },
		rubyStringDelimiter        = { fg = colors.color3 },
		rubyBlockParameterList     = { fg = colors.foreground },
		rubyDefine                 = { fg = colors.color1 },
		rubyModuleName             = { fg = colors.color1 },
		rubyAccess                 = { fg = colors.color1 },
		rubyMacro                  = { fg = colors.color1 },
		rubySymbol                 = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: Haskell: {{{
		--: haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
		haskellBrackets        = { fg = colors.foreground },
		haskellIdentifier      = { fg = colors.color11, italic = true },
		haskellDecl            = { fg = colors.color1 },
		haskellType            = { fg = colors.color4, italic = true },
		haskellDeclKeyword     = { fg = colors.color1 },
		haskellWhere           = { fg = colors.color1 },
		haskellDeriving        = { fg = colors.color1 },
		haskellForeignKeywords = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: Perl: {{{
		--: builtin: https://github.com/vim-perl/vim-perl{{{
		perlStatementPackage    = { fg = colors.color1 },
		perlStatementInclude    = { fg = colors.color1 },
		perlStatementStorage    = { fg = colors.color1 },
		perlStatementList       = { fg = colors.color1 },
		perlMatchStartEnd       = { fg = colors.color1 },
		perlVarSimpleMemberName = { fg = colors.color2 },
		perlVarSimpleMember     = { fg = colors.foreground },
		perlMethod              = { fg = colors.color2 },
		podVerbatimLine         = { fg = colors.color2 },
		podCmdText              = { fg = colors.color3 },
		perlVarPlain            = { fg = colors.foreground },
		perlVarPlain2           = { fg = colors.foreground },
		--: }}}
		--: }}}
		--: OCaml: {{{
		--: builtin: https://github.com/rgrinberg/vim-ocaml{{{
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
		--: }}}
		--: }}}
		--: Erlang: {{{
		--: builtin: https://github.com/vim-erlang/vim-erlang-runtime
		erlangAtom           = { fg = colors.foreground },
		erlangVariable       = { fg = colors.foreground },
		erlangLocalFuncRef   = { fg = colors.color2 },
		erlangLocalFuncCall  = { fg = colors.color2 },
		erlangGlobalFuncRef  = { fg = colors.color2 },
		erlangGlobalFuncCall = { fg = colors.color2 },
		erlangAttribute      = { fg = colors.color4, italic = true },
		erlangPipe           = { fg = colors.color1 },
		--:
		--: }}}
		--: Elixir: {{{
		--: vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
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
		--: }}}
		--: }}}
		--: Common Lisp: {{{
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
		lispAtomMark = { fg = colors.color5 },
		lispKey      = { fg = colors.color11 },
		lispFunc     = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: Clojure: {{{
		--: builtin: https://github.com/guns/vim-clojure-static{{{
		clojureMacro    = { fg = colors.color1 },
		clojureFunc     = { fg = colors.color2 },
		clojureConstant = { fg = colors.color11, italic = true },
		clojureSpecial  = { fg = colors.color1 },
		clojureDefine   = { fg = colors.color1 },
		clojureKeyword  = { fg = colors.color4 },
		clojureVariable = { fg = colors.foreground },
		clojureMeta     = { fg = colors.color5 },
		clojureDeref    = { fg = colors.color5 },
		--: }}}
		--: }}}
		--: Matlab: {{{
		--: builtin: {{{
		matlabSemicolon          = { fg = colors.foreground },
		matlabFunction           = { fg = colors.color1, italic = true },
		matlabImplicit           = { fg = colors.color2 },
		matlabDelimiter          = { fg = colors.foreground },
		matlabOperator           = { fg = colors.color2 },
		matlabArithmeticOperator = { fg = colors.color1 },
		matlabRelationalOperator = { fg = colors.color1 },
		matlabLogicalOperator    = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: Shell: {{{
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
		shRange         = { fg = colors.foreground },
		shOption        = { fg = colors.color5 },
		shQuote         = { fg = colors.color3 },
		shVariable      = { fg = colors.color4, italic = true },
		shDerefSimple   = { fg = colors.color4, italic = true },
		shDerefVar      = { fg = colors.color4, italic = true },
		shDerefSpecial  = { fg = colors.color4, italic = true },
		shDerefOff      = { fg = colors.color4, italic = true },
		shVarAssign     = { fg = colors.color1 },
		shFunctionOne   = { fg = colors.color2 },
		shFunctionKey   = { fg = colors.color1 },
		--: }}}
		--: }}}
		--: Zsh: {{{
		--: builtin: https://github.com/chrisbra/vim-zsh{{{
		zshOption   = { fg = colors.color4, italic = true },
		zshSubst    = { fg = colors.color11 },
		zshFunction = { fg = colors.color2 },
		--: }}}
		--: }}}
		--: PowerShell: {{{
		--: vim-ps1: https://github.com/PProvost/vim-ps1{{{
		ps1FunctionInvocation     = { fg = colors.color2 },
		ps1FunctionDeclaration    = { fg = colors.color2 },
		ps1InterpolationDelimiter = { fg = colors.color5 },
		ps1BuiltIn                = { fg = colors.color4, italic = true },
		--: }}}
		--: }}}
		--: VimL: {{{
		vimLet            = { fg = colors.color1 },
		vimFunction       = { fg = colors.color2 },
		vimIsCommand      = { fg = colors.foreground },
		vimUserFunc       = { fg = colors.color2 },
		vimFuncName       = { fg = colors.color2 },
		vimMap            = { fg = colors.color4, italic = true },
		vimNotation       = { fg = colors.color5 },
		vimMapLhs         = { fg = colors.color2 },
		vimMapRhs         = { fg = colors.color2 },
		vimSetEqual       = { fg = colors.color4, italic = true },
		vimSetSep         = { fg = colors.foreground },
		vimOption         = { fg = colors.color4, italic = true },
		vimUserAttrbKey   = { fg = colors.color4, italic = true },
		vimUserAttrb      = { fg = colors.color2 },
		vimAutoCmdSfxList = { fg = colors.color11 },
		vimSynType        = { fg = colors.color11 },
		vimHiBang         = { fg = colors.color11 },
		vimSet            = { fg = colors.color4, italic = true },
		--: }}}
		--: Makefile: {{{
		makeIdent      = { fg = colors.color5 },
		makeSpecTarget = { fg = colors.color4, italic = true },
		makeTarget     = { fg = colors.color11 },
		makeCommands   = { fg = colors.color1 },
		--: }}}
		--: CMake: {{{
		cmakeCommand                            = { fg = colors.color1 },
		cmakeKWconfigure_package_config_file    = { fg = colors.color4, italic = true },
		cmakeKWwrite_basic_package_version_file = { fg = colors.color4, italic = true },
		cmakeKWExternalProject                  = { fg = colors.color2 },
		cmakeKWadd_compile_definitions          = { fg = colors.color2 },
		cmakeKWadd_compile_options              = { fg = colors.color2 },
		cmakeKWadd_custom_command               = { fg = colors.color2 },
		cmakeKWadd_custom_target                = { fg = colors.color2 },
		cmakeKWadd_definitions                  = { fg = colors.color2 },
		cmakeKWadd_dependencies                 = { fg = colors.color2 },
		cmakeKWadd_executable                   = { fg = colors.color2 },
		cmakeKWadd_library                      = { fg = colors.color2 },
		cmakeKWadd_link_options                 = { fg = colors.color2 },
		cmakeKWadd_subdirectory                 = { fg = colors.color2 },
		cmakeKWadd_test                         = { fg = colors.color2 },
		cmakeKWbuild_command                    = { fg = colors.color2 },
		cmakeKWcmake_host_system_information    = { fg = colors.color2 },
		cmakeKWcmake_minimum_required           = { fg = colors.color2 },
		cmakeKWcmake_parse_arguments            = { fg = colors.color2 },
		cmakeKWcmake_policy                     = { fg = colors.color2 },
		cmakeKWconfigure_file                   = { fg = colors.color2 },
		cmakeKWcreate_test_sourcelist           = { fg = colors.color2 },
		cmakeKWctest_build                      = { fg = colors.color2 },
		cmakeKWctest_configure                  = { fg = colors.color2 },
		cmakeKWctest_coverage                   = { fg = colors.color2 },
		cmakeKWctest_memcheck                   = { fg = colors.color2 },
		cmakeKWctest_run_script                 = { fg = colors.color2 },
		cmakeKWctest_start                      = { fg = colors.color2 },
		cmakeKWctest_submit                     = { fg = colors.color2 },
		cmakeKWctest_test                       = { fg = colors.color2 },
		cmakeKWctest_update                     = { fg = colors.color2 },
		cmakeKWctest_upload                     = { fg = colors.color2 },
		cmakeKWdefine_property                  = { fg = colors.color2 },
		cmakeKWdoxygen_add_docs                 = { fg = colors.color2 },
		cmakeKWenable_language                  = { fg = colors.color2 },
		cmakeKWenable_testing                   = { fg = colors.color2 },
		cmakeKWexec_program                     = { fg = colors.color2 },
		cmakeKWexecute_process                  = { fg = colors.color2 },
		cmakeKWexport                           = { fg = colors.color2 },
		cmakeKWexport_library_dependencies      = { fg = colors.color2 },
		cmakeKWfile                             = { fg = colors.color2 },
		cmakeKWfind_file                        = { fg = colors.color2 },
		cmakeKWfind_library                     = { fg = colors.color2 },
		cmakeKWfind_package                     = { fg = colors.color2 },
		cmakeKWfind_path                        = { fg = colors.color2 },
		cmakeKWfind_program                     = { fg = colors.color2 },
		cmakeKWfltk_wrap_ui                     = { fg = colors.color2 },
		cmakeKWforeach                          = { fg = colors.color2 },
		cmakeKWfunction                         = { fg = colors.color2 },
		cmakeKWget_cmake_property               = { fg = colors.color2 },
		cmakeKWget_directory_property           = { fg = colors.color2 },
		cmakeKWget_filename_component           = { fg = colors.color2 },
		cmakeKWget_property                     = { fg = colors.color2 },
		cmakeKWget_source_file_property         = { fg = colors.color2 },
		cmakeKWget_target_property              = { fg = colors.color2 },
		cmakeKWget_test_property                = { fg = colors.color2 },
		cmakeKWif                               = { fg = colors.colors2 },
		cmakeKWinclude                          = { fg = colors.colors2 },
		cmakeKWinclude_directories              = { fg = colors.colors2 },
		cmakeKWinclude_external_msproject       = { fg = colors.colors2 },
		cmakeKWinclude_guard                    = { fg = colors.colors2 },
		cmakeKWinstall                          = { fg = colors.colors2 },
		cmakeKWinstall_files                    = { fg = colors.colors2 },
		cmakeKWinstall_programs                 = { fg = colors.colors2 },
		cmakeKWinstall_targets                  = { fg = colors.colors2 },
		cmakeKWlink_directories                 = { fg = colors.colors2 },
		cmakeKWlist                             = { fg = colors.colors2 },
		cmakeKWload_cache                       = { fg = colors.colors2 },
		cmakeKWload_command                     = { fg = colors.colors2 },
		cmakeKWmacro                            = { fg = colors.colors2 },
		cmakeKWmark_as_advanced                 = { fg = colors.colors2 },
		cmakeKWmath                             = { fg = colors.colors2 },
		cmakeKWmessage                          = { fg = colors.colors2 },
		cmakeKWoption                           = { fg = colors.colors2 },
		cmakeKWproject                          = { fg = colors.colors2 },
		cmakeKWqt_wrap_cpp                      = { fg = colors.colors2 },
		cmakeKWqt_wrap_ui                       = { fg = colors.colors2 },
		cmakeKWremove                           = { fg = colors.colors2 },
		cmakeKWseparate_arguments               = { fg = colors.colors2 },
		cmakeKWset                              = { fg = colors.colors2 },
		cmakeKWset_directory_properties         = { fg = colors.colors2 },
		cmakeKWset_property                     = { fg = colors.colors2 },
		cmakeKWset_source_files_properties      = { fg = colors.colors2 },
		cmakeKWset_target_properties            = { fg = colors.colors2 },
		cmakeKWset_tests_properties             = { fg = colors.colors2 },
		cmakeKWsource_group                     = { fg = colors.colors2 },
		cmakeKWstring                           = { fg = colors.colors2 },
		cmakeKWsubdirs                          = { fg = colors.colors2 },
		cmakeKWtarget_compile_definitions       = { fg = colors.colors2 },
		cmakeKWtarget_compile_features          = { fg = colors.colors2 },
		cmakeKWtarget_compile_options           = { fg = colors.colors2 },
		cmakeKWtarget_include_directories       = { fg = colors.colors2 },
		cmakeKWtarget_link_directories          = { fg = colors.colors2 },
		cmakeKWtarget_link_libraries            = { fg = colors.colors2 },
		cmakeKWtarget_link_options              = { fg = colors.colors2 },
		cmakeKWtarget_precompile_headers        = { fg = colors.colors2 },
		cmakeKWtarget_sources                   = { fg = colors.colors2 },
		cmakeKWtry_compile                      = { fg = colors.colors2 },
		cmakeKWtry_run                          = { fg = colors.colors2 },
		cmakeKWunset                            = { fg = colors.colors2 },
		cmakeKWuse_mangled_mesa                 = { fg = colors.colors2 },
		cmakeKWvariable_requires                = { fg = colors.colors2 },
		cmakeKWvariable_watch                   = { fg = colors.colors2 },
		cmakeKWwrite_file                       = { fg = colors.colors2 },
		--: }}}
		--: Json: {{{
		jsonKeyword = { fg = colors.color1 },
		jsonString  = { fg = colors.color2 },
		jsonBoolean = { fg = colors.color4 },
		jsonNoise   = { fg = colors.color8 },
		jsonQuote   = { fg = colors.color8 },
		jsonBraces  = { fg = colors.foreground },
		--: }}}
		--: Yaml: {{{
		yamlKey      = { fg = colors.color1 },
		yamlConstant = { fg = colors.color4, italic = true },
		yamlString   = { fg = colors.color2 },
		--: }}}
		--: Toml: {{{
		tomlTable      = { bg = colors.background, fg = colors.color5, bold = true },
		tomlKey        = { fg = colors.color1 },
		tomlBoolean    = { fg = colors.color4 },
		tomlString     = { fg = colors.color2 },
		tomlTableArray = { link = "tomlTable" },
		--: }}}
		--: Diff: {{{
		diffAdded     = { fg = colors.color2 },
		diffRemoved   = { fg = colors.color1 },
		diffChanged   = { fg = colors.color4 },
		diffOldFile   = { fg = colors.color3 },
		diffNewFile   = { fg = colors.color11 },
		diffFile      = { fg = colors.color5 },
		diffLine      = { fg = colors.color8 },
		diffIndexLine = { fg = colors.color5 },
		--: }}}
		--: Git Commit: {{{
		gitcommitSummary   = { fg = colors.color1 },
		gitcommitUntracked = { fg = colors.color8 },
		gitcommitDiscarded = { fg = colors.color8 },
		gitcommitSelected  = { fg = colors.color8 },
		gitcommitUnmerged  = { fg = colors.color8 },
		gitcommitOnBranch  = { fg = colors.color8 },
		gitcommitArrow     = { fg = colors.color8 },
		gitcommitFile      = { fg = colors.color2 },
		--: }}}
		--: INI: {{{
		dosiniHeader = { fg = colors.color1, bold = true },
		dosiniLabel  = { fg = colors.color4 },
		dosiniValue  = { fg = colors.color2 },
		dosiniNumber = { fg = colors.color2 },
		--: }}}
		--: Help: {{{
		helpNote           = { fg = colors.color5, bold = true },
		helpHeadline       = { fg = colors.color1, bold = true },
		helpHeader         = { fg = colors.color11, bold = true },
		helpURL            = { fg = colors.color2, underline = true },
		helpHyperTextEntry = { fg = colors.color4, bold = true },
		helpHyperTextJump  = { fg = colors.color4 },
		helpCommand        = { fg = colors.color3 },
		helpExample        = { fg = colors.color2 },
		helpSpecial        = { fg = colors.color5 },
		helpSectionDelim   = { fg = colors.color8 },
		--: }}}
		--: }}}
		--: Plugins: {{{
		--: Dependency highlights {{{
		--: neoclide/coc.nvim {{{
		CocHighlightText             = { bold = true },
		CocHoverRange                = { bold = true, underline = true },
		CocHintHighlight             = { fg = colors.color2, undercurl = true },
		CocErrorFloat                = { bg = colors.color8, fg = colors.color1 },
		CocWarningFloat              = { bg = colors.color8, fg = colors.color3 },
		CocInfoFloat                 = { bg = colors.color8, fg = colors.color4 },
		CocHintFloat                 = { bg = colors.color8, fg = colors.color2 },
		CocCodeLens                  = { fg = colors.color8 },
		CocErrorSign                 = { link = "ALEErrorSign" },
		CocWarningSign               = { link = "ALEWarningSign" },
		CocInfoSign                  = { link = "ALEInfoSign" },
		CocHintSign                  = { link = "Label" },
		CocErrorHighlight            = { link = "ALEError" },
		CocWarningHighlight          = { link = "ALEWarning" },
		CocInfoHighlight             = { link = "ALEInfo" },
		CocWarningVirtualText        = { link = "ALEVirtualTextWarning" },
		CocErrorVirtualText          = { link = "ALEVirtualTextError" },
		CocInfoVirtualText           = { link = "ALEVirtualTextInfo" },
		CocHintVirtualText           = { link = "ALEVirtualTextInfo" },
		CocGitAddedSign              = { link = "GitGutterAdd" },
		CocGitChangeRemovedSign      = { link = "GitGutterChangeDelete" },
		CocGitChangedSign            = { link = "GitGutterChange" },
		CocGitRemovedSign            = { link = "GitGutterDelete" },
		CocGitTopRemovedSign         = { link = "GitGutterDelete" },
		CocExplorerBufferRoot        = { fg = colors.color1 },
		CocExplorerBufferExpandIcon  = { fg = colors.color4 },
		CocExplorerBufferBufnr       = { fg = colors.color3 },
		CocExplorerBufferModified    = { fg = colors.color1 },
		CocExplorerBufferBufname     = { fg = colors.color8 },
		CocExplorerBufferFullpath    = { fg = colors.color8 },
		CocExplorerFileRoot          = { fg = colors.color1 },
		CocExplorerFileExpandIcon    = { fg = colors.color4 },
		CocExplorerFileFullpath      = { fg = colors.color8 },
		CocExplorerFileDirectory     = { fg = colors.color2 },
		CocExplorerFileGitStage      = { fg = colors.color4 },
		CocExplorerFileGitUnstage    = { fg = colors.color3 },
		CocExplorerFileSize          = { fg = colors.color4 },
		CocExplorerTimeAccessed      = { fg = colors.color5 },
		CocExplorerTimeCreated       = { fg = colors.color5 },
		CocExplorerTimeModified      = { fg = colors.color5 },
		CocExplorerFileRootName      = { fg = colors.color11 },
		CocExplorerBufferNameVisible = { fg = colors.color2 },
		--: }}}
		--: dense-analysis/ale {{{
		ALEError                   = { fg = colors.color1, undercurl = true },
		ALEWarning                 = { fg = colors.color3, undercurl = true },
		ALEInfo                    = { fg = colors.color4, undercurl = true },
		ALEErrorSign               = { fg = colors.color1 },
		ALEWarningSign             = { fg = colors.color3 },
		ALEInfoSign                = { fg = colors.color4 },
		ALEVirtualTextError        = { fg = colors.color8 },
		ALEVirtualTextWarning      = { fg = colors.color8 },
		ALEVirtualTextInfo         = { fg = colors.color8 },
		ALEVirtualTextStyleError   = { link = "ALEVirtualTextError" },
		ALEVirtualTextStyleWarning = { link = "ALEVirtualTextWarning" },
		--: }}}
		--: airblade/vim-gitgutter{{{
		GitGutterAdd          = { fg = colors.color2 },
		GitGutterChange       = { fg = colors.color4 },
		GitGutterDelete       = { fg = colors.color1 },
		GitGutterChangeDelete = { fg = colors.color5 },
		--: }}}
		--: hrsh7th/nvim-cmp {{{
		CmpDocumentationBorder    = { link = "FloatBorder" },
		CmpItemAbbr               = { fg = colors.foreground },
		CmpItemAbbrDeprecated     = { fg = colors.color2 },
		CmpItemAbbrMatch          = { fg = colors.color4 },
		CmpItemAbbrMatchFuzzy     = { fg = colors.color5 },
		CmpItemKind               = { fg = colors.color4 },
		CmpItemMenu               = { fg = colors.color2 },
		--: }}}
		--: neovim/nvim-lspconfig {{{
		LspInlayHint                  = { link = "NonText" },
		LspDiagnosticsHint            = { fg = colors.color6 },
		LspDiagnosticsInformation     = { fg = colors.color7 },
		LspDiagnosticsWarning         = { fg = colors.color11 },
		LspDiagnosticsError           = { fg = colors.color1 },
		LspReferenceText              = { link = "CocHighlightText" },
		LspReferenceRead              = { link = "CocHighlightText" },
		LspReferenceWrite             = { link = "CocHighlightText" },
		LspInfoTitle                  = { link = "Title" },
		LspInfoTip                    = { link = "Comment" },
		LspInfoList                   = { link = "Function" },
		LspInfoBorder                 = { link = "Label" },
		LspInfoFiletype               = { link = "Type" },
		LspCodeLens                   = { link = "Comment" },
		LspSignatureActiveParameter   = { link = "Visual" },

		DiagnosticError       = { link = "LspDiagnosticsError" },
		DiagnosticWarn        = { link = "LspDiagnosticsWarning" },
		DiagnosticInfo        = { link = "LspDiagnosticsInformation" },
		DiagnosticHint        = { link = "LspDiagnosticsHint" },
		DiagnosticUnnecessary = { link = "Comment" },

		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn  = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo  = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint  = { link = "DiagnosticHint" },

		DiagnosticUnderlineError = { link = "DiagnosticError", undercurl = true },
		DiagnosticUnderlineWarn  = { link = "DiagnosticWarn", undercurl = true },
		DiagnosticUnderlineInfo  = { link = "DiagnosticInfo", undercurl = true },
		DiagnosticUnderlineHint  = { link = "DiagnosticHint", undercurl = true },
		--: }}}
		--: }}}
		--: Lazy.nvim {{{
		LazyProgressTodo  = { link = "LineNr" },
		LazyProgressDone  = { link = "Constant" },
		LazySpecial       = { link = "@punctuation.special" },
		LazyDir           = { link = "@markup.link" },
		LazyNoCond        = { link = "DiagnosticWarn" },
		LazyNormal        = { link = "NormalFloat" },
		LazyValue         = { link = "@string" },
		LazyUrl           = { link = "@markup.link" },
		LazyLocal         = { link = "Constant" },
		LazyProp          = { link = "Conceal" },
		LazyDimmed        = { link = "Conceal" },
		LazyCommitType    = { link = "Title" },
		LazyCommitIssue   = { link = "Number" },
		LazyCommitScope   = { italic = true },
		LazyCommit        = { link = "@variable.builtin" },
		LazyH1            = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		LazyH2            = { bold = true },
		LazyReasonRuntime = { link = "@macro" },
		LazyComment       = { link = "Comment" },
		LazyReasonRequire = { link = "@variable.parameter" },
		LazyReasonImport  = { link = "Identifier" },
		LazyReasonCmd     = { link = "Operator" },
		LazyReasonFt      = { link = "Character" },
		LazyButton        = { bg = colors.color8, bold = true },
		LazyReasonSource  = { link = "Character" },
		LazyButtonActive  = { link = "LazyH1" },
		LazyReasonStart   = { link = "@variable.member" },
		LazyTaskOutput    = { link = "MsgArea" },
		LazyReasonKeys    = { link = "Statement" },
		LazyReasonEvent   = { link = "Constant" },
		LazyReasonPlugin  = { link = "Special" },
		LazyTaskError     = { link = "ErrorMsg" },
		LazyBackdrop      = { bg = "#000000" },
		--: }}}
		--: nvim-treesitter/nvim-treesitter {{{
		["@annotation"]               = { link = "PreProc" },
		["@attribute"]                = { link = "PreProc" },
		["@boolean"]                  = { link = "Boolean" },
		["@character"]                = { link = "Character" },
		["@character.special"]        = { link = "SpecialChar" },
		["@comment"]                  = { link = "Comment" },
		["@keyword.conditional"]      = { link = "Conditional" },
		["@constant"]                 = { link = "Constant" },
		["@constant.builtin"]         = { link = "Special" },
		["@constant.macro"]           = { link = "Define" },
		["@keyword.debug"]            = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Define" },
		["@keyword.exception"]        = { link = "Exception" },
		["@number.float"]             = { link = "Float" },
		["@function"]                 = { link = "Function" },
		["@function.builtin"]         = { link = "Special" },
		["@function.call"]            = { link = "@function" },
		["@function.macro"]           = { link = "Macro" },
		["@keyword.import"]           = { link = "Include" },
		["@keyword.coroutine"]        = { link = "@keyword" },
		["@keyword.operator"]         = { link = "@operator" },
		["@keyword.return"]           = { link = "@keyword" },
		["@function.method"]          = { link = "Function" },
		["@function.method.call"]     = { link = "@function.method" },
		["@namespace.builtin"]        = { link = "@variable.builtin" },
		["@none"]                     = {},
		["@number"]                   = { link = "Number" },
		["@keyword.directive"]        = { link = "PreProc" },
		["@keyword.repeat"]           = { link = "Repeat" },
		["@keyword.storage"]          = { link = "StorageClass" },
		["@string"]                   = { link = "String" },
		["@markup.link.label"]        = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@tag"]                      = { link = "Label" },
		["@tag.attribute"]            = { link = "@property" },
		["@tag.delimiter"]            = { link = "Delimiter" },
		["@markup"]                   = { link = "@none" },
		["@markup.environment"]       = { link = "Macro" },
		["@markup.environment.name"]  = { link = "Type" },
		["@markup.raw"]               = { link = "String" },
		["@markup.math"]              = { link = "Special" },
		["@markup.strong"]            = { bold = true },
		["@markup.emphasis"]          = { italic = true },
		["@markup.strikethrough"]     = { strikethrough = true },
		["@markup.underline"]         = { underline = true },
		["@markup.heading"]           = { link = "Title" },
		["@comment.note"]             = { fg = colors.color6 },
		["@comment.error"]            = { link = "Error" },
		["@comment.hint"]             = { fg = colors.color6 },
		["@comment.info"]             = { fg = colors.color4 },
		["@comment.warning"]          = { fg = colors.color3 },
		["@comment.todo"]             = { link = "Todo" },
		["@markup.link.url"]          = { link = "Underlined" },
		["@type"]                     = { link = "Type" },
		["@type.definition"]          = { link = "Typedef" },
		["@type.qualifier"]           = { link = "@keyword" },
		--
		--- Misc
		["@comment.documentation"] = { },
		["@operator"] = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.
		--
		--- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters ie: `.`
		["@punctuation.bracket"]   = { fg = colors.foreground }, -- For brackets and parens.
		["@punctuation.special"]   = { link = "SpecialChar" }, -- For special symbols (e.g. `{}` in string interpolation)
		["@markup.list"]           = { fg = colors.color4 }, -- For special punctutation that does not fall in the catagories before.
		["@markup.list.markdown"]  = { link = "markdownListMarker", bold = true },
		--
		--- Literals
		["@string.documentation"] = { fg = colors.color3 },
		["@string.regexp"]        = { fg = colors.color6 }, -- For regexes.
		["@string.escape"]        = { fg = colors.color5 }, -- For escape characters within a string.
		--
		--- Functions
		["@constructor"]                = { fg = colors.color5 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@variable.parameter"]         = { fg = colors.color3 }, -- For parameters of a function.
		["@variable.parameter.builtin"] = { fg = colors.color3 }, -- For builtin parameters of a function, e.g. "..." or Smali"s p[1-99]
		--
		--- Keywords
		["@keyword"]          = { link = "Keyword" }, -- For keywords that don"t fall in previous categories.
		["@keyword.function"] = { link = "Function" }, -- For keywords used to define a fuction.
		--
		["@label"] = { link = "Label" }, -- For labels: `label:` in C and `:label:` in Lua.
		--
		--- Types
		["@type.builtin"]    = { fg = colors.color4 },
		["@variable.member"] = { fg = colors.color2 }, -- For fields.
		["@property"]        = { fg = colors.color2 },
		--
		--- Identifiers
		["@variable"]         = { link = "Variable" }, -- Any variable name that does not have another highlight.
		["@variable.builtin"] = { fg = colors.color1 }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@module.builtin"]   = { fg = colors.color1 }, -- Variable names that are defined by the languages, like `this` or `self`.
		--
		--- Text
		["@markup.raw.markdown"]        = { fg = colors.color4 },
		["@markup.raw.markdown_inline"] = { fg = colors.color4 },
		["@markup.link"]                = { fg = colors.color11 },
		--
		["@markup.list.unchecked"] = { fg = colors.color4 }, -- For brackets and parens.
		["@markup.list.checked"]   = { fg = colors.color2 }, -- For brackets and parens.
		--
		["@diff.plus"]  = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },
		--
		["@module"] = { link = "Include" },
		--
		-- tsx
		["@tag.tsx"]           = { fg = colors.color1 },
		["@constructor.tsx"]   = { fg = colors.color4 },
		["@tag.delimiter.tsx"] = { fg = colors.color4 },
		--
		-- LSP Semantic Token Groups
		["@lsp.type.boolean"]                      = { link = "@boolean" },
		["@lsp.type.builtinType"]                  = { link = "@type.builtin" },
		["@lsp.type.comment"]                      = { link = "@comment" },
		["@lsp.type.decorator"]                    = { link = "@attribute" },
		["@lsp.type.deriveHelper"]                 = { link = "@attribute" },
		["@lsp.type.enum"]                         = { link = "@type" },
		["@lsp.type.enumMember"]                   = { link = "@constant" },
		["@lsp.type.escapeSequence"]               = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"]              = { link = "@markup.list" },
		["@lsp.type.generic"]                      = { link = "@variable" },
		["@lsp.type.interface"]                    = { fg = colors.color4 },
		["@lsp.type.keyword"]                      = { link = "@keyword" },
		["@lsp.type.lifetime"]                     = { link = "@keyword.storage" },
		["@lsp.type.namespace"]                    = { link = "@module" },
		["@lsp.type.number"]                       = { link = "@number" },
		["@lsp.type.operator"]                     = { link = "@operator" },
		["@lsp.type.parameter"]                    = { link = "@variable.parameter" },
		["@lsp.type.property"]                     = { link = "@property" },
		["@lsp.type.selfKeyword"]                  = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"]              = { link = "@variable.builtin" },
		["@lsp.type.string"]                       = { link = "@string" },
		["@lsp.type.typeAlias"]                    = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"]          = { link = "Error", undercurl = true },
		["@lsp.type.variable"]                     = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"]         = { link = "@operator" },
		["@lsp.typemod.string.injected"]           = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"]     = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"]       = { fg = colors.color4 },
		["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = colors.color4 },
		["@lsp.typemod.variable.callable"]         = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"]         = { link = "@variable" },
		["@lsp.typemod.variable.static"]           = { link = "@constant" },
		-- NOTE: maybe add these with distinct highlights?
		-- ["@lsp.typemod.variable.globalScope"] (global variables)
		--: }}}
		--: nvim-neo-tree/neo-tree.nvim {{{
		NeoTreeDirectoryName        = { link = "Directory" },
		NeoTreeDirectoryIcon        = { link = "Directory" },
		NeoTreeNormal               = { link = "Normal" },
		NeoTreeNormalNC             = { link = "NormalNC" },
		NeoTreeExpander             = { link = "Comment" },
		NeoTreeIndentMarker         = { link = "NeoTreeExpander" },
		NeoTreeRootName             = { link = "Directory" },
		NeoTreeSymbolicLinkTarget   = { fg = colors.color6 },
		NeoTreeModified             = { fg = colors.color11 },

		NeoTreeGitIgnored           = { link = "Comment" },
		NeoTreeGitModified          = { link = "NeoTreeModified" },
		NeoTreeGitAdded             = { link = "GitGutterAdd" },
		NeoTreeGitConflict          = { link = "GitGutterDelete" },
		NeoTreeGitDeleted           = { link = "GitGutterDelete" },
		NeoTreeGitUnstaged          = { link = "GitGutterDelete" },
		NeoTreeGitUntracked         = { link = "GitGutterChangeDelete" },
		NeoTreeGitStaged            = { link = "GitGutterAdd" },

		NeoTreeFloatBorder          = { link = "FloatBorder" },
		NeoTreeFloatTitle           = { link = "FloatTitle" },
		NeoTreeTitleBar             = { bg = colors.color4, fg = colors.background },
		NeoTreeFileNameOpened       = { fg = colors.color5 },
		NeoTreeDimText              = { link = "Comment" },
		NeoTreeFilterTerm           = { fg = colors.color2, bold = true },
		NeoTreeTabActive            = { fg = colors.color13, bold = true },
		NeoTreeTabInactive          = { bg = colors.color8, fg = colors.color7 },
		NeoTreeTabSeparatorActive   = { fg = colors.background },
		NeoTreeTabSeparatorInactive = { bg = colors.color8, fg = colors.color8 },
		NeoTreeVertSplit            = { bg = colors.color8, fg = colors.background },
		NeoTreeStatusLineNC         = { fg = colors.background },
		NeoTreeDotfile              = { link = "Normal" },
		NeoTreeHiddenByName         = { link = "Normal" }, -- links to NeoTreeDotfile
		NeoTreeWindowsHidden        = { link = "Normal" }, -- links to NeoTreeDotfile
		NeoTreeCursorLine           = { link = "CursorLine" },
		NeoTreeFileIcon             = { link = "NeoTreeDirectoryIcon" },
		NeoTreePreview              = { link = "Search" },
		NeoTreeGitRenamed           = { link = "NeoTreeGitModified" },
		NeoTreeFileStats            = { link = "Comment" },
		NeoTreeFileStatsHeader      = { link = "Comment", bold = true },
		NeoTreeSignColumn           = { link = "SignColumn" },
		NeoTreeStatusLine           = { link = "StatusLine" },
		NeoTreeWinSeparator         = { link = "WinSeparator" },
		NeoTreeEndOfBuffer          = { link = "EndOfBuffer" },
		NeoTreeFloatNormal          = { link = "NormalFloat" },
		NeoTreeBufferNumber         = { link = "SpecialChar" },
		NeoTreeMessage              = { link = "Comment", italic = true },
		NeoTreeFadeText1            = { link = "Comment" },
		NeoTreeFadeText2            = { link = "Comment" },
		--: }}}
		--: akinsho/bufferline.nvim {{{
		BufferLineBackground                = { link = "TabLine" },
		BufferLineFill                      = { link = "TabLineFill" },
		BufferLineGroupLabel                = { fg = colors.color7 },
		BufferLineGroupSeparator            = { fg = colors.color7 },
		BufferLineTruncMarker               = { fg = colors.color7 },
		BufferLineBuffer                    = { bg = colors.color1, fg = colors.color2 },
		BufferLineBufferVisible             = { fg = colors.color7 },
		BufferLineBufferSelected            = { link = "BufferLineTabSelected" },
		BufferLineDuplicate                 = { fg = colors.color7 },
		BufferLineDuplicateVisible          = { fg = colors.color7 },
		BufferLineDuplicateSelected         = { fg = colors.color3, bold = true, italic = true },
		BufferLineTab                       = { fg = colors.color7 },
		BufferLineTabSelected               = { link = "TabLineSel" },
		BufferLineTabSeparator              = { fg = colors.background },
		BufferLineTabSeparatorSelected      = { fg = colors.color4, bold = true },
		BufferLineTabClose                  = { bg = colors.color1, fg = colors.background, bold = true },
		BufferLineIndicatorVisible          = { fg = colors.color7 },
		BufferLineIndicatorSelected         = { link = "BufferLineTabSelected" },
		BufferLineSeparator                 = { fg = colors.background },
		BufferLineSeparatorVisible          = { fg = colors.background },
		BufferLineSeparatorSelected         = { fg = colors.background },
		BufferLineOffsetSeparator           = { fg = colors.background },
		BufferLineCloseButton               = { fg = colors.color1, bold = true},
		BufferLineCloseButtonVisible        = { fg = colors.color1 },
		BufferLineCloseButtonSelected       = { fg = colors.color1, bold = true, italic = true },
		BufferLineNumbers                   = { fg = colors.color7 },
		BufferLineNumbersVisible            = { fg = colors.color7 },
		BufferLineNumbersSelected           = { fg = colors.color7, bold = true, italic = true },
		BufferLineError                     = { fg = colors.color1 },
		BufferLineErrorVisible              = { fg = colors.color1 },
		BufferLineErrorSelected             = { fg = colors.color1, bold = true, italic = true },
		BufferLineErrorDiagnostic           = { fg = colors.color1 },
		BufferLineErrorDiagnosticVisible    = { fg = colors.color1 },
		BufferLineErrorDiagnosticSelected   = { fg = colors.color1, bold = true, italic = true },
		BufferLineWarning                   = { fg = colors.color3 },
		BufferLineWarningVisible            = { fg = colors.color3 },
		BufferLineWarningSelected           = { fg = colors.color3, bold = true, italic = true },
		BufferLineWarningDiagnostic         = { fg = colors.color3 },
		BufferLineWarningDiagnosticVisible  = { fg = colors.color3 },
		BufferLineWarningDiagnosticSelected = { fg = colors.color3, bold = true, italic = true },
		BufferLineInfo                      = { fg = colors.color6 },
		BufferLineInfoVisible               = { fg = colors.color6 },
		BufferLineInfoSelected              = { fg = colors.color6, bold = true, italic = true },
		BufferLineInfoDiagnostic            = { fg = colors.color6 },
		BufferLineInfoDiagnosticVisible     = { fg = colors.color6 },
		BufferLineInfoDiagnosticSelected    = { fg = colors.color6, bold = true, italic = true },
		BufferLineHint                      = { fg = colors.color5 },
		BufferLineHintVisible               = { fg = colors.color5 },
		BufferLineHintSelected              = { fg = colors.color5, bold = true, italic = true },
		BufferLineHintDiagnostic            = { fg = colors.color5 },
		BufferLineHintDiagnosticVisible     = { fg = colors.color5 },
		BufferLineHintDiagnosticSelected    = { fg = colors.color5, bold = true, italic = true },
		BufferLineDiagnostic                = { fg = colors.color2 },
		BufferLineDiagnosticVisible         = { fg = colors.color2 },
		BufferLineDiagnosticSelected        = { fg = colors.color2, bold = true, italic = true },
		BufferLineModified                  = { fg = colors.color11 },
		BufferLineModifiedVisible           = { fg = colors.color11 },
		BufferLineModifiedSelected          = { fg = colors.color11, bold = true, italic = true },
		BufferLinePick                      = { fg = colors.color7 },
		BufferLinePickVisible               = { fg = colors.color7 },
		BufferLinePickSelected              = { fg = colors.color7, bold = true, italic = true },
		--: DevIcons Coloring {{{
		-- BufferLineDevIconPy.typed            = { bg = colors.background, fg = colors.color7 },
		BufferLineDevIconDefaultSelected      = { bg = colors.background, fg = colors.color7, bold = true },
		BufferLineDevIconDefault              = { bg = colors.background, fg = colors.color7 },
		BufferLineDevIconBazelWorkspace       = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLess                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconClojure              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHpp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCSharpProject        = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNodeModules          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconKotlinScript         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEdn                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCjs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJpegXl               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconXul                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconH                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVala                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVHDL                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCp                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPp                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSabayon              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTerraform            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconC                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconScheme               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBashrc               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSystemVerilog        = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRedhat               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHrl                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVlang                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconConfiguration        = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRaspberryPiOS        = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconYml                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBashProfile          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconParrot               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVimrc                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTrueTypeFont         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconopenSUSE             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTwig                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconcuda                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPy                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLicense              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRake                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWebmanifest          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLog                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTFVars               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconR                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMageia               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAi                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNushell              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCts                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSettingsJson         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconErb                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTestTs               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFennel               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGDScript             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGraphQL              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTestJs               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLuaurc               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconExe                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJl                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitlabCI             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMts                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPrisma               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconReScriptInterface    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTcl                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconElf                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTextScene            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFedora               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBabelrc              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEslintrc             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEditorConfig         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCsh                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconElementary           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDsStore              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconErl                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDevuan               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconKsh                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTypeScriptReactSpec  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconArch                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDeepin               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJavaScriptReactSpec  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDb                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDebian               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCobol                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRss                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconConf                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCxxm                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSass                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOrgMode              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSig                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSql                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCpp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRazorPage            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPyi                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconXaml                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTerminal             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCppm                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconConfigRu             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconYaml                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconXml                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNim                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconScss                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCPlusPlusModule      = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitModules           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconScala                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGemspec              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZshenv               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBazel                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPxd                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAzureCli             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAppleScript          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconApp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDockerfile           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRakefile             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZigObjectNotation    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSvelte               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEnv                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconImportConfiguration  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRs                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTailwindConfig       = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOut                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBazelBuild           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSvelteConfig         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNPMIgnore            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconReScript             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPackageLockJson      = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconQuery                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNswag                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGvimrc               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMixLock              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCPlusPlus            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMarkdown             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconarduino              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZig                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFavicon              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPm                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitConfig            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJson5                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTxt                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconE                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPl                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJava                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLiquid               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZshprofile           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconIni                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHh                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBrewfile             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVerilog              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEslintIgnore         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZshrc                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMakefile             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPackageJson          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconStyl                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBzl                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCMake                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZorin                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLua                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNixOS                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRockyLinu            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHaml                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGui                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconClojureJS            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTextResource         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHtml                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLhs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEndeavour            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSlackware            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTempl                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGentoo               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOpenBSD              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWebpack              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconIllumos              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconKali                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSolus                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSpecTs               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVim                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSuo                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconClojureDart          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRb                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSml                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBudgie               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMli                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHbs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPxi                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconArti                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEe                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMjs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconExs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNi                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPsScriptfile         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAOSC                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTs                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPng                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBackup               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAlpine               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCrystal              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPsScriptModulefile   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAlmalinu             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconElm                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCentos               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconManjaro              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconUbuntu               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconApple                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLuau                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFreeBSD              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitIgnore            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHurl                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDart                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconsbt                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSpecJs               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHs                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGo                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCsv                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCss                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconKotlin               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconProlog               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTe                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDesktopEntry         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJpg                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTypeScriptReactTest  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMd                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJsonc                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconM4A                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVoid                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVue                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWebOpenFontFormat    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPop_OS               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCoffee               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHtm                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSwift                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSln                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHee                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGif                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMpp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconZsh                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJavaScriptReactTest  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPackedResource       = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDump                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconI                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCMakeLists           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBibTe                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPhp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNotebook             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTSConfig             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSh                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconD                    = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGroovy               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconNPMrc                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLinu                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAwk                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPyd                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPyc                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPsd                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPsb                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconProcfile             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPpt                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPrettierConfig       = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOpenTypeFont         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOPUS                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOgg                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMp4                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMp3                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMOV                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMotoko               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMkv                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMint                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconM4V                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSvg                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMaterial             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLock                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRmd                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJpeg                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconClojureC             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconIco                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHuff                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconHaxe                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGulpfile             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGruntfile            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGodotProject         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBinaryGLTF           = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCheckhealth          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFlac                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDropbo               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconToml                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDrools               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDoc                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBmp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconLee                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMl                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGemfile              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconDiff                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAvif                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCs                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconVagrantfile          = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBash                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFsscript             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitLogo              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWindows              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEpp                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPsManifestfile       = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEjs                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitCommit            = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconCson                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconAac                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPyo                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRlib                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconRproj                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconEmbeddedOpenTypeFont = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSlim                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconJson                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFish                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconMustache             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWav                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWebm                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWebp                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconcudah                = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconXcPlayground         = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconXls                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFortran              = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconGitAttributes        = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconSolidity             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconOpenSCAD             = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconPdf                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFsi                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconTor                  = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFsharp               = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconFs                   = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconWasm                 = { link = "BufferLineDevIconDefault" },
		BufferLineDevIconBat                  = { link = "BufferLineDevIconDefault" },
		--: }}}
		--: }}}
		--: liuchengxu/vim-which-key {{{
		WhichKey          = { fg = colors.color1 },
		WhichKeyGroup     = { fg = colors.color11 },
		WhichKeyDesc      = { fg = colors.color6 },
		WhichKeySeperator = { link = "Comment" },
		WhichKeyValue     = { link = "Comment" },
		WhichKeySeparator = { link = "Comment" },
		WhichKeyBorder    = { link = "FloatBorder" },
		WhichKeyFloat     = { link = "NormalFloat" },
		--: }}}
		--: nvimdev/dashboard-nvim {{{
		DashboardShortCut = { fg = colors.color6 },
		DashboardHeader   = { fg = colors.color4 },
		DashboardCenter   = { fg = colors.color5 },
		DashboardFooter   = { fg = colors.color4 },
		DashboardKey      = { fg = colors.color11 },
		DashboardDesc     = { fg = colors.color6 },
		DashboardIcon     = { fg = colors.color6, bold = true },
		--: }}}
		--: goolord/alpha-nvim {{{
		AlphaShortcut    = { fg = colors.color11 },
		AlphaHeader      = { fg = colors.color4 },
		AlphaHeaderLabel = { fg = colors.color11 },
		AlphaFooter      = { fg = colors.color4 },
		AlphaButtons     = { fg = colors.color6 },
		--: }}}
		--: lukas-reineke/indent-blankline.nvim {{{
		IndentBlanklineChar = { link = "Comment" },
		--: }}}
		--: vim.org/netrw {{{
		--: https://www.vim.org/scripts/script.php?script_id=1075
		netrwDir      = { link = "Directory" },
		netrwClassify = { fg = colors.color2 },
		netrwLink     = { fg = colors.color8 },
		netrwSymLink  = { fg = colors.foreground },
		netrwExe      = { fg = colors.color1 },
		netrwComment  = { link = "Comment" },
		netrwList     = { fg = colors.color3 },
		netrwHelpCmd  = { fg = colors.color4 },
		netrwCmdSep   = { fg = colors.color8 },
		netrwVersion  = { fg = colors.color5 },
		--: }}}
		--: mbbill/undotree {{{
		UndotreeSavedBig    = { fg = colors.color1, bold = true },
		UndotreeNode        = { fg = colors.color4 },
		UndotreeNodeCurrent = { fg = colors.color5 },
		UndotreeSeq         = { fg = colors.color2 },
		UndotreeCurrent     = { fg = colors.color4 },
		UndotreeNext        = { fg = colors.color3 },
		UndotreeTimeStamp   = { fg = colors.color8 },
		UndotreeHead        = { fg = colors.color5 },
		UndotreeBranch      = { fg = colors.color4 },
		UndotreeSavedSmall  = { fg = colors.color1 },
		--: }}}
		--: nvim-telescope/telescope.nvim {{{
		TelescopeNormal                 = { link = "Normal" },
		TelescopeBorder                 = { link = "FloatBorder" },
		TelescopeSelection              = { link = "CursorLine" },
		TelescopeMatching               = { fg = colors.color4, bold = true },
		TelescopePromptBorder           = { link = "TelescopeBorder" },
		TelescopePromptNormal           = { fg = colors.foreground },
		TelescopePromptPrefix           = { fg = colors.color4, bold = true },
		TelescopePreviewTitle           = { fg = colors.color3 },
		TelescopePromptTitle            = { fg = colors.color4 },
		TelescopeResultsTitle           = { fg = colors.color6 },
		TelescopeSelectionCaret         = { fg = colors.color6 },
		TelescopeResultsVariable        = { link = "SpecialChar" },
		TelescopeResultsStruct          = { link = "Struct" },
		TelescopeResultsOperator        = { link = "Operator" },
		TelescopeResultsMethod          = { link = "Method" },
		TelescopeResultsFunction        = { link = "Function" },
		TelescopeResultsField           = { link = "Function" },
		TelescopeResultsConstant        = { link = "Constant" },
		TelescopeResultsClass           = { link = "Function" },
		TelescopePreviewMessageFillchar = { link = "TelescopePreviewMessage" },
		TelescopePreviewMessage         = { link = "TelescopePreviewNormal" },
		TelescopePreviewNormal          = { link = "TelescopeNormal" },
		TelescopePreviewDate            = { link = "Directory" },
		TelescopePreviewGroup           = { link = "Constant" },
		TelescopePreviewUser            = { link = "Constant" },
		TelescopePreviewSize            = { link = "String" },
		TelescopePreviewSticky          = { link = "Keyword" },
		TelescopePreviewHyphen          = { link = "NonText" },
		TelescopePreviewExecute         = { link = "String" },
		TelescopePreviewWrite           = { link = "Statement" },
		TelescopePreviewRead            = { link = "Constant" },
		TelescopePreviewSocket          = { link = "Statement" },
		TelescopePreviewLink            = { link = "Special" },
		TelescopePreviewBlock           = { link = "Constant" },
		TelescopePreviewDirectory       = { link = "Directory" },
		TelescopePreviewCharDev         = { link = "Constant" },
		TelescopePreviewPipe            = { link = "Constant" },
		TelescopePreviewMatch           = { link = "Search" },
		TelescopePreviewLine            = { link = "Visual" },
		TelescopePromptCounter          = { link = "NonText" },
		TelescopeTitle                  = { link = "TelescopeBorder" },
		TelescopePreviewBorder          = { link = "TelescopeBorder" },
		TelescopeResultsBorder          = { link = "TelescopeBorder" },
		TelescopeResultsNormal          = { link = "TelescopeNormal" },
		TelescopeMultiIcon              = { link = "Identifier" },
		TelescopeMultiSelection         = { link = "Type" },
		TelescopeResultsDiffUntracked   = { link = "NonText" },
		TelescopeResultsDiffDelete      = { link = "DiffDelete" },
		TelescopeResultsDiffAdd         = { link = "DiffAdd" },
		TelescopeResultsDiffChange      = { link = "DiffChange" },
		TelescopeResultsSpecialComment  = { link = "SpecialComment" },
		TelescopeResultsComment         = { link = "Comment" },
		TelescopeResultsNumber          = { link = "Number" },
		TelescopeResultsIdentifier      = { link = "Identifier" },
		TelescopeResultsLineNr          = { link = "LineNr" },
		--: }}}
		--: echasnovski/mini.nvim {{{
		--: mini.indentscope {{{
		MiniIndentscopeSymbol    = { link = "Comment" },
		MiniIndentscopeSymbolOff = { link = "MiniIndentscopeSymbol" },
		--: }}}
		--: mini.statusline {{{
		MiniStatuslineModeNormal   = { bg = colors.color4, fg = colors.background, bold = true },
		MiniStatuslineModeVisual   = { bg = colors.color5, fg = colors.background, bold = true },
		MiniStatuslineModeInsert   = { bg = colors.color6, fg = colors.background, bold = true },
		MiniStatuslineModeCommand  = { bg = colors.color1, fg = colors.background, bold = true },
		MiniStatuslineModeReplace  = { bg = colors.color2, fg = colors.background, bold = true },
		MiniStatuslineModeOther    = { bg = colors.color3, fg = colors.background, bold = true },
		MiniStatuslineModeDevInfo  = { link = "StatusLine", bold = true },
		MiniStatuslineModeFilename = { link = "StatusLineNC", bold = true },
		MiniStatuslineModeFileInfo = { link = "StatusLineNC", bold = true },
		MiniStatuslineModeInactive = { link = "Normal", bold = true },
		--: }}}
		--: mini.tabline {{{
		MiniTablineCurrent         = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		MiniTablineFill            = { link = "TabLineFill" },
		MiniTablineVisible         = { link = "TabLine" },
		MiniTablineHidden          = { link = "MiniTablineVisible" },
		MiniTablineModifiedCurrent = { bg = colors.color3, fg = colors.background, bold = true, italic = true },
		MiniTablineModifiedVisible = { fg = colors.color6 },
		MiniTablineModifiedHidden  = { fg = colors.color5 },
		MiniTablineTabpagesection  = { bg = colors.color4, fg = colors.background, bold = true },
		--: }}}
		--: mini.starter {{{
		MiniStarterCurrent    = { link = "CursorLine" },
		MiniStarterHeader     = { fg = colors.color4, bold = true, italic = true },
		MiniStarterFooter     = { fg = colors.color5, bold = true, italic = true },
		MiniStarterInactive   = { link = "Comment" },
		MiniStarterItem       = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { fg = colors.foreground, bold = true, italic = true },
		MiniStarterSection    = { fg = colors.color6, bold = true, italic = true },
		MiniStarterQuery      = { fg = colors.color1 },
		--: }}}
		--: mini.cursorword {{{
		MiniCursorword        = { bg = colors.color8, bold = true },
		MiniCursorwordCurrent = { link = "MiniCursorword" },
		--: }}}
		--: mini.files {{{
		MiniFilesBorder         = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticVirtualTextWarn" },
		MiniFilesCursorLine     = { link = "CursorLine" },
		MiniFilesDirectory      = { link = "Directory" },
		MiniFilesFile           = {},
		MiniFilesNormal         = { link = "NormalFloat" },
		MiniFilesTitle          = { link = "Comment" },
		MiniFilesTitleFocused   = { link = "FloatTitle" },
		--: }}}
		--: mini.hipatterns {{{
		MiniHipatternsFixme = { bg = colors.color1, fg = colors.background, bold = true, italic = true },
		MiniHipatternsHack  = { bg = colors.color11, fg = colors.background, bold = true, italic = true },
		MiniHipatternsTodo  = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		MiniHipatternsNote  = { bg = colors.foreground, fg = colors.background, bold = true, italic = true },
		--: }}}
		--: mini.pick {{{
		MiniPickBorder        = { link = "FloatBorder" },
		MiniPickBorderBusy    = { link = "DiagnosticVirtualTextWarn" },
		MiniPickBorderText    = { link = "FloatTitle" },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile      = { link = "MiniPickNormal" },
		MiniPickNormal        = { link = "NormalFloat" },
		MiniPickHeader        = { link = "DiagnosticVirtualTextHint" },
		MiniPickMatchCurrent  = { link = "CursorLine" },
		MiniPickMatchMarked   = { link = "Visual" },
		MiniPickMatchRanges   = { fg = colors.color4 },
		MiniPickPreviewLine   = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt        = { link = "FloatTitle" },
		--: }}}
		--: }}}
		--: Not configured {{{
		--: junegunn/vim-plug{{{
		--: call s:HL("plug1", s:palette.red, s:palette.none, "bold")
		--: call s:HL("plugNumber", s:palette.yellow, s:palette.none, "bold")
		--: highlight! link plug2 Blue
		--: highlight! link plugBracket Blue
		--: highlight! link plugName Green
		--: highlight! link plugDash Red
		--: highlight! link plugNotLoaded Grey
		--: highlight! link plugH2 Purple
		--: highlight! link plugMessage Purple
		--: highlight! link plugError Red
		--: highlight! link plugRelDate Grey
		--: highlight! link plugStar Purple
		--: highlight! link plugUpdate Blue
		--: highlight! link plugDeleted Grey
		--: highlight! link plugEdge Purple
		--: }}}
		--: neomake/neomake{{{
		--: highlight! link NeomakeError ALEError
		--: highlight! link NeomakeErrorSign ALEErrorSign
		--: highlight! link NeomakeWarning ALEWarning
		--: highlight! link NeomakeWarningSign ALEWarningSign
		--: highlight! link NeomakeInfo ALEInfo
		--: highlight! link NeomakeInfoSign ALEInfoSign
		--: highlight! link NeomakeMessage ALEInfo
		--: highlight! link NeomakeMessageSign CocHintSign
		--: highlight! link NeomakeVirtualtextError Grey
		--: highlight! link NeomakeVirtualtextWarning Grey
		--: highlight! link NeomakeVirtualtextInfo Grey
		--: highlight! link NeomakeVirtualtextMessag Grey
		--: }}}
		--: vim-syntastic/syntastic{{{
		--: highlight! link SyntasticError ALEError
		--: highlight! link SyntasticWarning ALEWarning
		--: highlight! link SyntasticErrorSign ALEErrorSign
		--: highlight! link SyntasticWarningSign ALEWarningSign
		--: }}}
		--: Yggdroot/LeaderF{{{
		--: if !exists("g:Lf_StlColorscheme")
		--:   let g:Lf_StlColorscheme = "one"
		--: endif
		--: call s:HL("Lf_hl_match", s:palette.green, s:palette.none, "bold")
		--: call s:HL("Lf_hl_match0", s:palette.green, s:palette.none, "bold")
		--: call s:HL("Lf_hl_match1", s:palette.blue, s:palette.none, "bold")
		--: call s:HL("Lf_hl_match2", s:palette.red, s:palette.none, "bold")
		--: call s:HL("Lf_hl_match3", s:palette.yellow, s:palette.none, "bold")
		--: call s:HL("Lf_hl_match4", s:palette.purple, s:palette.none, "bold")
		--: call s:HL("Lf_hl_matchRefine", s:palette.yellow, s:palette.none, "bold")
		--: highlight! link Lf_hl_cursorline Fg
		--: highlight! link Lf_hl_selection DiffAdd
		--: highlight! link Lf_hl_rgHighlight Visual
		--: highlight! link Lf_hl_gtagsHighlight Visual
		--: }}}
		--: junegunn/fzf.vim{{{
		--: let g:fzf_colors = {
		--:       \ "fg": ["fg", "Normal"],
		--:       \ "bg": ["bg", "Normal"],
		--:       \ "hl": ["fg", "Green"],
		--:       \ "fg+": ["fg", "CursorLine", "CursorColumn", "Normal"],
		--:       \ "bg+": ["bg", "CursorLine", "CursorColumn"],
		--:       \ "hl+": ["fg", "Green"],
		--:       \ "info": ["fg", "Yellow"],
		--:       \ "prompt": ["fg", "Red"],
		--:       \ "pointer": ["fg", "Blue"],
		--:       \ "marker": ["fg", "Blue"],
		--:       \ "spinner": ["fg", "Yellow"],
		--:       \ "header": ["fg", "Blue"]
		--:       \ }
		--: }}}
		--: Shougo/denite.nvim{{{
		--: call s:HL("deniteMatchedChar", s:palette.green, s:palette.none, "bold")
		--: call s:HL("deniteMatchedRange", s:palette.green, s:palette.none, "bold,underline")
		--: call s:HL("deniteInput", s:palette.green, s:palette.bg1, "bold")
		--: call s:HL("deniteStatusLineNumber", s:palette.purple, s:palette.bg1)
		--: call s:HL("deniteStatusLinePath", s:palette.fg, s:palette.bg1)
		--: highlight! link deniteSelectedLine Green
		--: }}}
		--: kien/ctrlp.vim{{{
		--: call s:HL("CtrlPMatch", s:palette.green, s:palette.none, "bold")
		--: call s:HL("CtrlPPrtBase", s:palette.grey, s:palette.none)
		--: call s:HL("CtrlPLinePre", s:palette.grey, s:palette.none)
		--: call s:HL("CtrlPMode1", s:palette.blue, s:palette.bg1, "bold")
		--: call s:HL("CtrlPMode2", s:palette.bg1, s:palette.blue, "bold")
		--: call s:HL("CtrlPStats", s:palette.grey, s:palette.bg1, "bold")
		--: highlight! link CtrlPNoEntries Red
		--: highlight! link CtrlPPrtCursor Blue
		--: }}}
		--: majutsushi/tagbar{{{
		--: highlight! link TagbarFoldIcon Blue
		--: highlight! link TagbarSignature Green
		--: highlight! link TagbarKind Red
		--: highlight! link TagbarScope Orange
		--: highlight! link TagbarNestedKind Blue
		--: highlight! link TagbarVisibilityPrivate Red
		--: highlight! link TagbarVisibilityPublic Blue
		--: }}}
		--: liuchengxu/vista.vim{{{
		--: highlight! link VistaBracket Grey
		--: highlight! link VistaChildrenNr Yellow
		--: highlight! link VistaScope Red
		--: highlight! link VistaTag Green
		--: highlight! link VistaPrefix Grey
		--: highlight! link VistaColon Green
		--: highlight! link VistaIcon Purple
		--: highlight! link VistaLineNr Fg
		--: }}}
		--: mhinz/vim-signify{{{
		--: highlight! link SignifySignAdd GitGutterAdd
		--: highlight! link SignifySignChange GitGutterChange
		--: highlight! link SignifySignDelete GitGutterDelete
		--: highlight! link SignifySignChangeDelete GitGutterChangeDelete
		--: }}}
		--: scrooloose/nerdtree{{{
		--: highlight! link NERDTreeDir Green
		--: highlight! link NERDTreeDirSlash Green
		--: highlight! link NERDTreeOpenable Blue
		--: highlight! link NERDTreeClosable Blue
		--: highlight! link NERDTreeFile Fg
		--: highlight! link NERDTreeExecFile Red
		--: highlight! link NERDTreeUp Grey
		--: highlight! link NERDTreeCWD Purple
		--: highlight! link NERDTreeHelp Grey
		--: highlight! link NERDTreeToggleOn Green
		--: highlight! link NERDTreeToggleOff Red
		--: highlight! link NERDTreeFlags Blue
		--: highlight! link NERDTreeLinkFile Grey
		--: highlight! link NERDTreeLinkTarget Green
		--: }}}
		--: justinmk/vim-dirvish{{{
		--: highlight! link DirvishPathTail Blue
		--: highlight! link DirvishArg Yellow
		--: }}}
		--: andymass/vim-matchup{{{
		--: call s:HL("MatchParenCur", s:palette.none, s:palette.none, "bold")
		--: call s:HL("MatchWord", s:palette.none, s:palette.none, "underline")
		--: call s:HL("MatchWordCur", s:palette.none, s:palette.none, "underline")
		--: }}}
		--: easymotion/vim-easymotion {{{
		--: highlight! link EasyMotionTarget Search
		--: highlight! link EasyMotionShade Grey
		--: }}}
		--: justinmk/vim-sneak {{{
		--: highlight! link Sneak Cursor
		--: highlight! link SneakLabel Cursor
		--: highlight! link SneakScope DiffAdd
		--: }}}
		--: terryma/vim-multiple-cursors{{{
		--: highlight! link multiple_cursors_cursor Cursor
		--: highlight! link multiple_cursors_visual Visual
		--: }}}
		--: mg979/vim-visual-multi{{{
		--: let g:VM_Mono_hl = "Cursor"
		--: let g:VM_Extend_hl = "Visual"
		--: let g:VM_Cursor_hl = "Cursor"
		--: let g:VM_Insert_hl = "Cursor"
		--: }}}
		--: dominikduda/vim_current_word{{{
		--: highlight! link CurrentWord CocHighlightText
		--: highlight! link CurrentWordTwins CocHighlightText
		--: }}}
		--: RRethy/vim-illuminate{{{
		--: highlight! link illuminatedWord CocHighlightText
		--: }}}
		--: itchyny/vim-cursorword{{{
		--: highlight! link CursorWord0 CocHighlightText
		--: highlight! link CursorWord1 CocHighlightText
		--: }}}
		--: Yggdroot/indentLine{{{
		--: let g:indentLine_color_gui = s:palette.grey[0]
		--: let g:indentLine_color_term = s:palette.grey[1]
		--: }}}
		--: nathanaelkane/vim-indent-guides{{{
		--: if get(g:, "indent_guides_auto_colors", 1) == 0
		--:   call s:HL("IndentGuidesOdd", s:palette.bg0, s:palette.bg1)
		--:   call s:HL("IndentGuidesEven", s:palette.bg0, s:palette.bg2)
		--: endif
		--: }}}
		--: kshenoy/vim-signature {{{
		--: if s:configuration.transparent_background
		--:   call s:HL("SignatureMarkText", s:palette.blue, s:palette.none)
		--:   call s:HL("SignatureMarkerText", s:palette.red, s:palette.none)
		--: else
		--:   call s:HL("SignatureMarkText", s:palette.blue, s:palette.bg1)
		--:   call s:HL("SignatureMarkerText", s:palette.red, s:palette.bg1)
		--: endif
		--: }}}
		--: mhinz/vim-startify{{{
		--: highlight! link StartifyBracket Grey
		--: highlight! link StartifyFile Green
		--: highlight! link StartifyNumber Orange
		--: highlight! link StartifyPath Grey
		--: highlight! link StartifySlash Grey
		--: highlight! link StartifySection Blue
		--: highlight! link StartifyHeader Red
		--: highlight! link StartifySpecial Grey
		--: }}}
		--: ap/vim-buftabline{{{
		--: highlight! link BufTabLineCurrent TabLineSel
		--: highlight! link BufTabLineActive TabLine
		--: highlight! link BufTabLineHidden TabLineFill
		--: highlight! link BufTabLineFill TabLineFill
		--: }}}
		--: liuchengxu/vim-which-key{{{
		--: highlight! link WhichKey Red
		--: highlight! link WhichKeySeperator Green
		--: highlight! link WhichKeyGroup Orange
		--: highlight! link WhichKeyDesc Blue
		--: }}}
		--: skywind3000/quickmenu.vim{{{
		--: highlight! link QuickmenuOption Green
		--: highlight! link QuickmenuNumber Orange
		--: highlight! link QuickmenuBracket Grey
		--: highlight! link QuickmenuHelp Blue
		--: highlight! link QuickmenuSpecial Grey
		--: highlight! link QuickmenuHeader Purple
		--: }}}
		--: unblevable/quick-scope {{{
		--: call s:HL("QuickScopePrimary", s:palette.green, s:palette.none, "underline")
		--: call s:HL("QuickScopeSecondary", s:palette.blue, s:palette.none, "underline")
		--: }}}
		--: APZelos/blamer.nvim {{{
		--: highlight! link Blamer Grey
		--: }}}
		--: cohama/agit.vim {{{
		--: highlight! link agitTree Grey
		--: highlight! link agitDate Green
		--: highlight! link agitRemote Red
		--: highlight! link agitHead Blue
		--: highlight! link agitRef Orange
		--: highlight! link agitTag Blue
		--: highlight! link agitStatFile Blue
		--: highlight! link agitStatRemoved Red
		--: highlight! link agitStatAdded Green
		--: highlight! link agitStatMessage Orange
		--: highlight! link agitDiffRemove diffRemoved
		--: highlight! link agitDiffAdd diffAdded
		--: highlight! link agitDiffHeader Blue
		--: highlight! link agitAuthor Yellow
		--: }}}
		--: }}}
		--: }}}
	}
end

return M
