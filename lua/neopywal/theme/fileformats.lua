-- vim:fileencoding=utf-8:foldmethod=marker

local M = {}
local O = require("neopywal").options.fileformats

local function apply_fileformat(option, highlights)
	if type(O[option]) ~= "boolean" then
		return {}
	end

	return O[option] and highlights or {}
end

M.get = function(colors)
	return vim.tbl_deep_extend("force", {},
		--: Markdown: {{{
		apply_fileformat("markdown", {
			--: builtin: {{{
			markdownH1 = { bg = colors.background, fg = colors.color1, bold = true },
			markdownH2 = { bg = colors.background, fg = colors.color11, bold = true },
			markdownH3 = { bg = colors.background, fg = colors.color3, bold = true },
			markdownH4 = { bg = colors.background, fg = colors.color2, bold = true },
			markdownH5 = { bg = colors.background, fg = colors.color4, bold = true },
			markdownH6 = { bg = colors.background, fg = colors.color5, bold = true },
			markdownUrl = { bg = colors.background, fg = colors.color4, underline = true },
			markdownItalic = { bg = colors.background, fg = colors.foreground, italic = true },
			markdownBold = { bg = colors.background, fg = colors.foreground, bold = true },
			markdownItalicDelimiter = { bg = colors.background, fg = colors.color8, italic = true },
			markdownCode = { fg = colors.color2 },
			markdownCodeBlock = { fg = colors.color2 },
			markdownCodeDelimiter = { fg = colors.color2 },
			markdownBlockquote = { fg = colors.color8 },
			markdownListMarker = { fg = colors.color1 },
			markdownOrderedListMarker = { fg = colors.color1 },
			markdownRule = { fg = colors.color5 },
			markdownHeadingRule = { fg = colors.color8 },
			markdownUrlDelimiter = { fg = colors.color8 },
			markdownLinkDelimiter = { fg = colors.color8 },
			markdownLinkTextDelimiter = { fg = colors.color8 },
			markdownHeadingDelimiter = { fg = colors.color8 },
			markdownLinkText = { fg = colors.color1 },
			markdownUrlTitleDelimiter = { fg = colors.color2 },
			markdownIdDeclaration = { link = "markdownLinkText" },
			markdownBoldDelimiter = { fg = colors.color8 },
			markdownId = { fg = colors.color3 },
			--: }}}
			--: vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
			mkdURL = { bg = colors.background, fg = colors.color4, underline = true },
			mkdInlineURL = { bg = colors.background, fg = colors.color4, underline = true },
			mkdItalic = { bg = colors.background, fg = colors.color8, italic = true },
			mkdCodeDelimiter = { fg = colors.color2 },
			mkdBold = { fg = colors.color8 },
			mkdLink = { fg = colors.color1 },
			mkdHeading = { fg = colors.color8 },
			mkdListItem = { fg = colors.color1 },
			mkdRule = { fg = colors.color5 },
			mkdDelimiter = { fg = colors.color8 },
			mkdId = { fg = colors.color3 },
			--: }}}
		}),
		--: }}}
		--: ReStructuredText: {{{
		apply_fileformat("restructuredtext", {
			--: builtin: https://github.com/marshallward/vim-restructuredtext{{{
			rstStandaloneHyperlink = { bg = colors.background, fg = colors.color5, underline = true },
			rstEmphasis = { bg = colors.background, fg = colors.foreground, italic = true },
			rstStrongEmphasis = { bg = colors.background, fg = colors.foreground, bold = true },
			rstHyperlinkTarget = { bg = colors.background, fg = colors.color4, underline = true },
			rstSubstitutionReference = { fg = colors.color4 },
			rstInterpretedTextOrHyperlinkReference = { fg = colors.color2 },
			rstTableLines = { fg = colors.color8 },
			rstInlineLiteral = { fg = colors.color2 },
			rstLiteralBlock = { fg = colors.color2 },
			rstQuotedLiteralBlock = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: LaTex: {{{
		apply_fileformat("latex", {
			--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
			texStatement = { fg = colors.color4, italic = true },
			texOnlyMath = { fg = colors.color8 },
			texDefName = { fg = colors.color3 },
			texNewCmd = { fg = colors.color11 },
			texCmdName = { fg = colors.color4 },
			texBeginEnd = { fg = colors.color1 },
			texBeginEndName = { fg = colors.color2 },
			texDocType = { fg = colors.color1, italic = true },
			texDocTypeArgs = { fg = colors.color11 },
			texInputFile = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: Html: {{{
		apply_fileformat("html", {
			--: builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
			htmlH1 = { bg = colors.background, fg = colors.color1, bold = true },
			htmlH2 = { bg = colors.background, fg = colors.color11, bold = true },
			htmlH3 = { bg = colors.background, fg = colors.color3, bold = true },
			htmlH4 = { bg = colors.background, fg = colors.color2, bold = true },
			htmlH5 = { bg = colors.background, fg = colors.color4, bold = true },
			htmlH6 = { bg = colors.background, fg = colors.color5, bold = true },
			htmlLink = { bg = colors.background, fg = colors.foreground, underline = true },
			htmlBold = { bg = colors.background, fg = colors.foreground, bold = true },
			htmlBoldUnderline = { bg = colors.background, fg = colors.foreground, bold = true, underline = true },
			htmlBoldItalic = { bg = colors.background, fg = colors.foreground, bold = true, italic = true },
			htmlBoldUnderlineItalic = {
				bg = colors.background,
				fg = colors.foreground,
				bold = true,
				underline = true,
				italic = true,
			},
			htmlUnderline = { bg = colors.background, fg = colors.foreground, underline = true },
			htmlUnderlineItalic = { bg = colors.background, fg = colors.foreground, underline = true, italic = true },
			htmlItalic = { bg = colors.background, fg = colors.foreground, italic = true },
			htmlTag = { fg = colors.color2 },
			htmlEndTag = { fg = colors.color4 },
			htmlTagN = { fg = colors.color1, italic = true },
			htmlTagName = { fg = colors.color1, italic = true },
			htmlArg = { fg = colors.color4 },
			htmlScriptTag = { fg = colors.color5 },
			htmlSpecialTagName = { fg = colors.color1, italic = true },
			htmlString = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: Xml: {{{
		apply_fileformat("xml", {
			--: builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
			xmlTag = { fg = colors.color2 },
			xmlEndTag = { fg = colors.color4 },
			xmlTagName = { fg = colors.color1, italic = true },
			xmlEqual = { fg = colors.color11 },
			xmlAttrib = { fg = colors.color4 },
			xmlEntity = { fg = colors.color1 },
			xmlEntityPunct = { fg = colors.color1 },
			xmlDocTypeDecl = { fg = colors.color8 },
			xmlDocTypeKeyword = { fg = colors.color1, italic = true },
			xmlCdataStart = { fg = colors.color8 },
			xmlCdataCdata = { fg = colors.color5 },
			xmlString = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: CSS: {{{
		apply_fileformat("css", {
			--: builtin: https://github.com/JulesWang/css.vim{{{
			cssStringQ = { fg = colors.color2 },
			cssStringQQ = { fg = colors.color2 },
			cssAttrComma = { fg = colors.color8 },
			cssBraces = { fg = colors.color8 },
			cssTagName = { fg = colors.color5 },
			cssClassNameDot = { fg = colors.color11 },
			cssClassName = { fg = colors.color1 },
			cssFunctionName = { fg = colors.color11 },
			cssAttr = { fg = colors.color2 },
			cssCommonAttr = { fg = colors.color2 },
			cssProp = { fg = colors.color4 },
			cssPseudoClassId = { fg = colors.color3 },
			cssPseudoClassFn = { fg = colors.color2 },
			cssPseudoClass = { fg = colors.color3 },
			cssImportant = { fg = colors.color1 },
			cssSelectorOp = { fg = colors.color11 },
			cssSelectorOp2 = { fg = colors.color11 },
			cssColor = { fg = colors.color2 },
			cssUnitDecorators = { fg = colors.color11 },
			cssValueLength = { fg = colors.color2 },
			cssValueInteger = { fg = colors.color2 },
			cssValueNumber = { fg = colors.color2 },
			cssValueAngle = { fg = colors.color2 },
			cssValueTime = { fg = colors.color2 },
			cssValueFrequency = { fg = colors.color2 },
			cssVendor = { fg = colors.color8 },
			cssNoise = { fg = colors.color8 },
			--: }}}
		}),
		--: }}}
		--: SASS: {{{
		apply_fileformat("sass", {
			--: scss-syntax: https://github.com/cakebaker/scss-syntax.vim{{{
			scssMixinName = { fg = colors.color11 },
			scssSelectorChar = { fg = colors.color11 },
			scssSelectorName = { fg = colors.color1 },
			scssInterpolationDelimiter = { fg = colors.color3 },
			scssVariableValue = { fg = colors.color2 },
			scssNull = { fg = colors.color5 },
			scssBoolean = { fg = colors.color5 },
			scssVariableAssignment = { fg = colors.color8 },
			scssAttribute = { fg = colors.color2 },
			scssFunctionName = { fg = colors.color11 },
			scssVariable = { fg = colors.foreground },
			scssAmpersand = { fg = colors.color5 },
			--: }}}
		}),
		--: }}}
		--: LESS: {{{
		apply_fileformat("less", {
			--: vim-less: https://github.com/groenewege/vim-less{{{
			lessMixinChar = { fg = colors.color8 },
			lessClass = { fg = colors.color1 },
			lessFunction = { fg = colors.color11 },
			--: }}}
		}),
		--: }}}
		--: JavaScript: {{{
		apply_fileformat("javascript", {
			--: builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
			javaScriptNull = { fg = colors.color11, italic = true },
			javaScriptIdentifier = { fg = colors.color4, italic = true },
			javaScriptParens = { fg = colors.foreground },
			javaScriptBraces = { fg = colors.foreground },
			javaScriptNumber = { fg = colors.color5 },
			javaScriptLabel = { fg = colors.color1 },
			javaScriptGlobal = { fg = colors.color4, italic = true },
			javaScriptMessage = { fg = colors.color4, italic = true },
			--: }}}
			--: vim-javascript: https://github.com/pangloss/vim-javascript{{{
			jsNoise = { fg = colors.foreground },
			Noise = { fg = colors.foreground },
			jsParens = { fg = colors.foreground },
			jsBrackets = { fg = colors.foreground },
			jsObjectBraces = { fg = colors.foreground },
			jsThis = { fg = colors.color4, italic = true },
			jsUndefined = { fg = colors.color11, italic = true },
			jsNull = { fg = colors.color11, italic = true },
			jsNan = { fg = colors.color11, italic = true },
			jsSuper = { fg = colors.color11, italic = true },
			jsPrototype = { fg = colors.color11, italic = true },
			jsFunction = { fg = colors.color1 },
			jsGlobalNodeObjects = { fg = colors.color4, italic = true },
			jsGlobalObjects = { fg = colors.color4, italic = true },
			jsArrowFunction = { fg = colors.color1 },
			jsArrowFuncArgs = { fg = colors.foreground },
			jsFuncArgs = { fg = colors.foreground },
			jsObjectProp = { fg = colors.foreground },
			jsVariableDef = { fg = colors.foreground },
			jsObjectKey = { fg = colors.foreground },
			jsParen = { fg = colors.foreground },
			jsParenIfElse = { fg = colors.foreground },
			jsParenRepeat = { fg = colors.foreground },
			jsParenSwitch = { fg = colors.foreground },
			jsParenCatch = { fg = colors.foreground },
			jsBracket = { fg = colors.foreground },
			jsObjectValue = { fg = colors.foreground },
			jsDestructuringBlock = { fg = colors.foreground },
			jsBlockLabel = { fg = colors.color5 },
			jsFunctionKey = { fg = colors.color2 },
			jsClassDefinition = { fg = colors.color4, italic = true },
			jsDot = { fg = colors.color11 },
			jsSpreadExpression = { fg = colors.color5 },
			jsSpreadOperator = { fg = colors.color2 },
			jsModuleKeyword = { fg = colors.color4, italic = true },
			jsTemplateExpression = { fg = colors.color5 },
			jsTemplateBraces = { fg = colors.color5 },
			jsClassMethodType = { fg = colors.color4, italic = true },
			jsExceptions = { fg = colors.color4, italic = true },
			--: }}}
			--: yajs: https://github.com/othree/yajs.vim{{{
			javascriptOpSymbol = { fg = colors.color1 },
			javascriptOpSymbols = { fg = colors.color1 },
			javascriptIdentifierName = { fg = colors.foreground },
			javascriptVariable = { fg = colors.color4, italic = true },
			javascriptObjectLabel = { fg = colors.foreground },
			javascriptPropertyNameString = { fg = colors.foreground },
			javascriptFuncArg = { fg = colors.foreground },
			javascriptObjectLiteral = { fg = colors.color2 },
			javascriptIdentifier = { fg = colors.color11, italic = true },
			javascriptArrowFunc = { fg = colors.color1 },
			javascriptTemplate = { fg = colors.color5 },
			javascriptTemplateSubstitution = { fg = colors.color5 },
			javascriptTemplateSB = { fg = colors.color5 },
			javascriptNodeGlobal = { fg = colors.color4, italic = true },
			javascriptDocTags = { fg = colors.color1, italic = true },
			javascriptDocNotation = { fg = colors.color4 },
			javascriptClassSuper = { fg = colors.color11, italic = true },
			javascriptClassName = { fg = colors.color4, italic = true },
			javascriptClassSuperName = { fg = colors.color4, italic = true },
			javascriptOperator = { fg = colors.color1 },
			javascriptBrackets = { fg = colors.foreground },
			javascriptBraces = { fg = colors.foreground },
			javascriptLabel = { fg = colors.color5 },
			javascriptEndColons = { fg = colors.color8 },
			javascriptObjectLabelColon = { fg = colors.color8 },
			javascriptDotNotation = { fg = colors.color11 },
			javascriptGlobalArrayDot = { fg = colors.color11 },
			javascriptGlobalBigIntDot = { fg = colors.color11 },
			javascriptGlobalDateDot = { fg = colors.color11 },
			javascriptGlobalJSONDot = { fg = colors.color11 },
			javascriptGlobalMathDot = { fg = colors.color11 },
			javascriptGlobalNumberDot = { fg = colors.color11 },
			javascriptGlobalObjectDot = { fg = colors.color11 },
			javascriptGlobalPromiseDot = { fg = colors.color11 },
			javascriptGlobalRegExpDot = { fg = colors.color11 },
			javascriptGlobalStringDot = { fg = colors.color11 },
			javascriptGlobalSymbolDot = { fg = colors.color11 },
			javascriptGlobalURLDot = { fg = colors.color11 },
			javascriptMethod = { fg = colors.color2 },
			javascriptMethodName = { fg = colors.color2 },
			javascriptObjectMethodName = { fg = colors.color2 },
			javascriptGlobalMethod = { fg = colors.color2 },
			javascriptDOMStorageMethod = { fg = colors.color2 },
			javascriptFileMethod = { fg = colors.color2 },
			javascriptFileReaderMethod = { fg = colors.color2 },
			javascriptFileListMethod = { fg = colors.color2 },
			javascriptBlobMethod = { fg = colors.color2 },
			javascriptURLStaticMethod = { fg = colors.color2 },
			javascriptNumberStaticMethod = { fg = colors.color2 },
			javascriptNumberMethod = { fg = colors.color2 },
			javascriptDOMNodeMethod = { fg = colors.color2 },
			javascriptES6BigIntStaticMethod = { fg = colors.color2 },
			javascriptBOMWindowMethod = { fg = colors.color2 },
			javascriptHeadersMethod = { fg = colors.color2 },
			javascriptRequestMethod = { fg = colors.color2 },
			javascriptResponseMethod = { fg = colors.color2 },
			javascriptES6SetMethod = { fg = colors.color2 },
			javascriptReflectMethod = { fg = colors.color2 },
			javascriptPaymentMethod = { fg = colors.color2 },
			javascriptPaymentResponseMethod = { fg = colors.color2 },
			javascriptTypedArrayStaticMethod = { fg = colors.color2 },
			javascriptGeolocationMethod = { fg = colors.color2 },
			javascriptES6MapMethod = { fg = colors.color2 },
			javascriptServiceWorkerMethod = { fg = colors.color2 },
			javascriptCacheMethod = { fg = colors.color2 },
			javascriptFunctionMethod = { fg = colors.color2 },
			javascriptXHRMethod = { fg = colors.color2 },
			javascriptBOMNavigatorMethod = { fg = colors.color2 },
			javascriptDOMEventTargetMethod = { fg = colors.color2 },
			javascriptDOMEventMethod = { fg = colors.color2 },
			javascriptIntlMethod = { fg = colors.color2 },
			javascriptDOMDocMethod = { fg = colors.color2 },
			javascriptStringStaticMethod = { fg = colors.color2 },
			javascriptStringMethod = { fg = colors.color2 },
			javascriptSymbolStaticMethod = { fg = colors.color2 },
			javascriptRegExpMethod = { fg = colors.color2 },
			javascriptObjectStaticMethod = { fg = colors.color2 },
			javascriptObjectMethod = { fg = colors.color2 },
			javascriptBOMLocationMethod = { fg = colors.color2 },
			javascriptJSONStaticMethod = { fg = colors.color2 },
			javascriptGeneratorMethod = { fg = colors.color2 },
			javascriptEncodingMethod = { fg = colors.color2 },
			javascriptPromiseStaticMethod = { fg = colors.color2 },
			javascriptPromiseMethod = { fg = colors.color2 },
			javascriptBOMHistoryMethod = { fg = colors.color2 },
			javascriptDOMFormMethod = { fg = colors.color2 },
			javascriptClipboardMethod = { fg = colors.color2 },
			javascriptBroadcastMethod = { fg = colors.color2 },
			javascriptDateStaticMethod = { fg = colors.color2 },
			javascriptDateMethod = { fg = colors.color2 },
			javascriptConsoleMethod = { fg = colors.color2 },
			javascriptArrayStaticMethod = { fg = colors.color2 },
			javascriptArrayMethod = { fg = colors.color2 },
			javascriptMathStaticMethod = { fg = colors.color2 },
			javascriptSubtleCryptoMethod = { fg = colors.color2 },
			javascriptCryptoMethod = { fg = colors.color2 },
			javascriptProp = { fg = colors.foreground },
			javascriptBOMWindowProp = { fg = colors.foreground },
			javascriptDOMStorageProp = { fg = colors.foreground },
			javascriptFileReaderProp = { fg = colors.foreground },
			javascriptURLUtilsProp = { fg = colors.foreground },
			javascriptNumberStaticProp = { fg = colors.foreground },
			javascriptDOMNodeProp = { fg = colors.foreground },
			javascriptRequestProp = { fg = colors.foreground },
			javascriptResponseProp = { fg = colors.foreground },
			javascriptES6SetProp = { fg = colors.foreground },
			javascriptPaymentProp = { fg = colors.foreground },
			javascriptPaymentResponseProp = { fg = colors.foreground },
			javascriptPaymentAddressProp = { fg = colors.foreground },
			javascriptPaymentShippingOptionProp = { fg = colors.foreground },
			javascriptTypedArrayStaticProp = { fg = colors.foreground },
			javascriptServiceWorkerProp = { fg = colors.foreground },
			javascriptES6MapProp = { fg = colors.foreground },
			javascriptRegExpStaticProp = { fg = colors.foreground },
			javascriptRegExpProp = { fg = colors.foreground },
			javascriptXHRProp = { fg = colors.foreground },
			javascriptBOMNavigatorProp = { fg = colors.color2 },
			javascriptDOMEventProp = { fg = colors.foreground },
			javascriptBOMNetworkProp = { fg = colors.foreground },
			javascriptDOMDocProp = { fg = colors.foreground },
			javascriptSymbolStaticProp = { fg = colors.foreground },
			javascriptSymbolProp = { fg = colors.foreground },
			javascriptBOMLocationProp = { fg = colors.foreground },
			javascriptEncodingProp = { fg = colors.foreground },
			javascriptCryptoProp = { fg = colors.foreground },
			javascriptBOMHistoryProp = { fg = colors.foreground },
			javascriptDOMFormProp = { fg = colors.foreground },
			javascriptDataViewProp = { fg = colors.foreground },
			javascriptBroadcastProp = { fg = colors.foreground },
			javascriptMathStaticProp = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: JavaScript React: {{{
		apply_fileformat("javascript_react", {
			--: vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
			jsxTagName = { fg = colors.color1, italic = true },
			jsxOpenPunct = { fg = colors.color2 },
			jsxClosePunct = { fg = colors.color4 },
			jsxEscapeJs = { fg = colors.color5 },
			jsxAttrib = { fg = colors.color4 },
			--: }}}
		}),
		--: }}}
		--: TypeScript: {{{
		apply_fileformat("typescript", {
			--: vim-typescript: https://github.com/leafgarland/typescript-vim{{{
			typescriptStorageClass = { fg = colors.color1 },
			typescriptEndColons = { fg = colors.foreground },
			typescriptSource = { fg = colors.color4, italic = true },
			typescriptMessage = { fg = colors.color2 },
			typescriptGlobalObjects = { fg = colors.color4, italic = true },
			typescriptInterpolation = { fg = colors.color5 },
			typescriptInterpolationDelimiter = { fg = colors.color5 },
			typescriptBraces = { fg = colors.foreground },
			typescriptParens = { fg = colors.foreground },
			--: }}}
			--: yats: https:github.com/HerringtonDarkholme/yats.vim{{{
			typescriptMethodAccessor = { fg = colors.color1 },
			typescriptVariable = { fg = colors.color1 },
			typescriptVariableDeclaration = { fg = colors.foreground },
			typescriptTypeReference = { fg = colors.color4, italic = true },
			typescriptEnumKeyword = { fg = colors.color1 },
			typescriptEnum = { fg = colors.color4, italic = true },
			typescriptIdentifierName = { fg = colors.foreground },
			typescriptProp = { fg = colors.foreground },
			typescriptCall = { fg = colors.foreground },
			typescriptInterfaceName = { fg = colors.color4, italic = true },
			typescriptMember = { fg = colors.foreground },
			typescriptMemberOptionality = { fg = colors.color1 },
			typescriptObjectLabel = { fg = colors.foreground },
			typescriptDefaultParam = { fg = colors.foreground },
			typescriptArrowFunc = { fg = colors.color1 },
			typescriptAbstract = { fg = colors.color1 },
			typescriptObjectColon = { fg = colors.color8 },
			typescriptTypeAnnotation = { fg = colors.color8 },
			typescriptAssign = { fg = colors.color1 },
			typescriptBinaryOp = { fg = colors.color1 },
			typescriptUnaryOp = { fg = colors.color1 },
			typescriptFuncComma = { fg = colors.foreground },
			typescriptClassName = { fg = colors.color4, italic = true },
			typescriptClassHeritage = { fg = colors.color4, italic = true },
			typescriptInterfaceHeritage = { fg = colors.color4, italic = true },
			typescriptIdentifier = { fg = colors.color11, italic = true },
			typescriptGlobal = { fg = colors.color4, italic = true },
			typescriptOperator = { fg = colors.color1 },
			typescriptNodeGlobal = { fg = colors.color4, italic = true },
			typescriptExport = { fg = colors.color1 },
			typescriptImport = { fg = colors.color1 },
			typescriptTypeParameter = { fg = colors.color4, italic = true },
			typescriptReadonlyModifier = { fg = colors.color1 },
			typescriptAccessibilityModifier = { fg = colors.color1 },
			typescriptAmbientDeclaration = { fg = colors.color1 },
			typescriptTemplateSubstitution = { fg = colors.color5 },
			typescriptTemplateSB = { fg = colors.color5 },
			typescriptExceptions = { fg = colors.color1 },
			typescriptCastKeyword = { fg = colors.color1 },
			typescriptOptionalMark = { fg = colors.color1 },
			typescriptNull = { fg = colors.color11, italic = true },
			typescriptMappedIn = { fg = colors.color1 },
			typescriptFuncTypeArrow = { fg = colors.color1 },
			typescriptTernaryOp = { fg = colors.color1 },
			typescriptParenExp = { fg = colors.foreground },
			typescriptIndexExpr = { fg = colors.foreground },
			typescriptDotNotation = { fg = colors.color11 },
			typescriptGlobalNumberDot = { fg = colors.color11 },
			typescriptGlobalStringDot = { fg = colors.color11 },
			typescriptGlobalArrayDot = { fg = colors.color11 },
			typescriptGlobalObjectDot = { fg = colors.color11 },
			typescriptGlobalSymbolDot = { fg = colors.color11 },
			typescriptGlobalMathDot = { fg = colors.color11 },
			typescriptGlobalDateDot = { fg = colors.color11 },
			typescriptGlobalJSONDot = { fg = colors.color11 },
			typescriptGlobalRegExpDot = { fg = colors.color11 },
			typescriptGlobalPromiseDot = { fg = colors.color11 },
			typescriptGlobalURLDot = { fg = colors.color11 },
			typescriptGlobalMethod = { fg = colors.color2 },
			typescriptDOMStorageMethod = { fg = colors.color2 },
			typescriptFileMethod = { fg = colors.color2 },
			typescriptFileReaderMethod = { fg = colors.color2 },
			typescriptFileListMethod = { fg = colors.color2 },
			typescriptBlobMethod = { fg = colors.color2 },
			typescriptURLStaticMethod = { fg = colors.color2 },
			typescriptNumberStaticMethod = { fg = colors.color2 },
			typescriptNumberMethod = { fg = colors.color2 },
			typescriptDOMNodeMethod = { fg = colors.color2 },
			typescriptPaymentMethod = { fg = colors.color2 },
			typescriptPaymentResponseMethod = { fg = colors.color2 },
			typescriptHeadersMethod = { fg = colors.color2 },
			typescriptRequestMethod = { fg = colors.color2 },
			typescriptResponseMethod = { fg = colors.color2 },
			typescriptES6SetMethod = { fg = colors.color2 },
			typescriptReflectMethod = { fg = colors.color2 },
			typescriptBOMWindowMethod = { fg = colors.color2 },
			typescriptGeolocationMethod = { fg = colors.color2 },
			typescriptServiceWorkerMethod = { fg = colors.color2 },
			typescriptCacheMethod = { fg = colors.color2 },
			typescriptES6MapMethod = { fg = colors.color2 },
			typescriptFunctionMethod = { fg = colors.color2 },
			typescriptRegExpMethod = { fg = colors.color2 },
			typescriptXHRMethod = { fg = colors.color2 },
			typescriptBOMNavigatorMethod = { fg = colors.color2 },
			typescriptIntlMethod = { fg = colors.color2 },
			typescriptDOMEventTargetMethod = { fg = colors.color2 },
			typescriptDOMEventMethod = { fg = colors.color2 },
			typescriptDOMDocMethod = { fg = colors.color2 },
			typescriptStringStaticMethod = { fg = colors.color2 },
			typescriptStringMethod = { fg = colors.color2 },
			typescriptSymbolStaticMethod = { fg = colors.color2 },
			typescriptObjectStaticMethod = { fg = colors.color2 },
			typescriptObjectMethod = { fg = colors.color2 },
			typescriptJSONStaticMethod = { fg = colors.color2 },
			typescriptEncodingMethod = { fg = colors.color2 },
			typescriptBOMLocationMethod = { fg = colors.color2 },
			typescriptPromiseStaticMethod = { fg = colors.color2 },
			typescriptPromiseMethod = { fg = colors.color2 },
			typescriptSubtleCryptoMethod = { fg = colors.color2 },
			typescriptCryptoMethod = { fg = colors.color2 },
			typescriptBOMHistoryMethod = { fg = colors.color2 },
			typescriptDOMFormMethod = { fg = colors.color2 },
			typescriptConsoleMethod = { fg = colors.color2 },
			typescriptDateStaticMethod = { fg = colors.color2 },
			typescriptDateMethod = { fg = colors.color2 },
			typescriptArrayStaticMethod = { fg = colors.color2 },
			typescriptArrayMethod = { fg = colors.color2 },
			typescriptMathStaticMethod = { fg = colors.color2 },
			typescriptStringProperty = { fg = colors.foreground },
			typescriptDOMStorageProp = { fg = colors.foreground },
			typescriptFileReaderProp = { fg = colors.foreground },
			typescriptURLUtilsProp = { fg = colors.foreground },
			typescriptNumberStaticProp = { fg = colors.foreground },
			typescriptDOMNodeProp = { fg = colors.foreground },
			typescriptBOMWindowProp = { fg = colors.foreground },
			typescriptRequestProp = { fg = colors.foreground },
			typescriptResponseProp = { fg = colors.foreground },
			typescriptPaymentProp = { fg = colors.foreground },
			typescriptPaymentResponseProp = { fg = colors.foreground },
			typescriptPaymentAddressProp = { fg = colors.foreground },
			typescriptPaymentShippingOptionProp = { fg = colors.foreground },
			typescriptES6SetProp = { fg = colors.foreground },
			typescriptServiceWorkerProp = { fg = colors.foreground },
			typescriptES6MapProp = { fg = colors.foreground },
			typescriptRegExpStaticProp = { fg = colors.foreground },
			typescriptRegExpProp = { fg = colors.foreground },
			typescriptBOMNavigatorProp = { fg = colors.color2 },
			typescriptXHRProp = { fg = colors.foreground },
			typescriptDOMEventProp = { fg = colors.foreground },
			typescriptDOMDocProp = { fg = colors.foreground },
			typescriptBOMNetworkProp = { fg = colors.foreground },
			typescriptSymbolStaticProp = { fg = colors.foreground },
			typescriptEncodingProp = { fg = colors.foreground },
			typescriptBOMLocationProp = { fg = colors.foreground },
			typescriptCryptoProp = { fg = colors.foreground },
			typescriptDOMFormProp = { fg = colors.foreground },
			typescriptBOMHistoryProp = { fg = colors.foreground },
			typescriptMathStaticProp = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: Dart: {{{
		apply_fileformat("dart", {
			--: dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
			dartCoreClasses = { fg = colors.color4, italic = true },
			dartTypeName = { fg = colors.color4, italic = true },
			dartInterpolation = { fg = colors.color5 },
			dartTypeDef = { fg = colors.color1 },
			dartClassDecl = { fg = colors.color1 },
			dartLibrary = { fg = colors.color1 },
			dartMetadata = { fg = colors.color11, italic = true },
			--: }}}
		}),
		--: }}}
		--: C/C++: {{{
		apply_fileformat("c_cpp", {
			--: vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
			cLabel = { fg = colors.color1 },
			cppSTLnamespace = { fg = colors.color4, italic = true },
			cppSTLtype = { fg = colors.color4, italic = true },
			cppAccess = { fg = colors.color1 },
			cppStructure = { fg = colors.color1 },
			cppSTLios = { fg = colors.color4, italic = true },
			cppSTLiterator = { fg = colors.color4, italic = true },
			cppSTLexception = { fg = colors.color1 },
			--: }}}
			--: vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
			cppSTLVariable = { fg = colors.color4, italic = true },
			--: }}}
			--: chromatica: https://github.com/arakashic/chromatica.nvim{{{
			Member = { fg = colors.color11, italic = true },
			-- Variable            = { fg = colors.foreground },
			Namespace = { fg = colors.color4, italic = true },
			EnumConstant = { fg = colors.color11, italic = true },
			chromaticaException = { fg = colors.color1 },
			chromaticaCast = { fg = colors.color1 },
			OperatorOverload = { fg = colors.color1 },
			AccessQual = { fg = colors.color1 },
			Linkage = { fg = colors.color1 },
			AutoType = { fg = colors.color4, italic = true },
			--: }}}
			--: vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight{{{
			LspCxxHlSkippedRegion = { fg = colors.color8 },
			LspCxxHlSkippedRegionBeginEnd = { fg = colors.color1 },
			LspCxxHlGroupEnumConstant = { fg = colors.color11, italic = true },
			LspCxxHlGroupNamespace = { fg = colors.color4, italic = true },
			LspCxxHlGroupMemberVariable = { fg = colors.color11, italic = true },
			--: }}}
		}),
		--: }}}
		--: ObjectiveC: {{{
		apply_fileformat("objectivec", {
			--: builtin: {{{
			objcModuleImport = { fg = colors.color1 },
			objcException = { fg = colors.color1 },
			objcProtocolList = { fg = colors.foreground },
			objcDirective = { fg = colors.color1 },
			objcPropertyAttribute = { fg = colors.color5 },
			objcHiddenArgument = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: C#: {{{
		apply_fileformat("c_sharp", {
			--: builtin: https://github.com/nickspoons/vim-cs{{{
			csUnspecifiedStatement = { fg = colors.color1 },
			csStorage = { fg = colors.color1 },
			csClass = { fg = colors.color1 },
			csNewType = { fg = colors.color4, italic = true },
			csContextualStatement = { fg = colors.color1 },
			csInterpolationDelimiter = { fg = colors.color5 },
			csInterpolation = { fg = colors.color5 },
			csEndColon = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: Python: {{{
		apply_fileformat("python", {
			--: builtin: {{{
			pythonBuiltin = { fg = colors.color4, italic = true },
			pythonExceptions = { fg = colors.color1 },
			pythonDecoratorName = { fg = colors.color11, italic = true },
			--: }}}
			--: python-syntax: https://github.com/vim-python/python-syntax{{{
			pythonExClass = { fg = colors.color4, italic = true },
			pythonBuiltinType = { fg = colors.color4, italic = true },
			pythonBuiltinObj = { fg = colors.color11, italic = true },
			pythonDottedName = { fg = colors.color11, italic = true },
			pythonBuiltinFunc = { fg = colors.color2 },
			pythonFunction = { fg = colors.color2 },
			pythonDecorator = { fg = colors.color11, italic = true },
			pythonInclude = { link = "Inclue" },
			pythonImport = { link = "PreProc" },
			pythonOperator = { fg = colors.color1 },
			pythonConditional = { fg = colors.color1 },
			pythonRepeat = { fg = colors.color1 },
			pythonException = { fg = colors.color1 },
			pythonNone = { fg = colors.color11, italic = true },
			pythonCoding = { fg = colors.color8 },
			pythonDot = { fg = colors.color8 },
			--: }}}
			--: semshi: https://github.com/numirias/semshi{{{
			semshiUnresolved = { bg = colors.background, fg = colors.color11, undercurl = true },
			semshiImported = { fg = colors.color4, italic = true },
			semshiParameter = { fg = colors.color11, italic = true },
			semshiParameterUnused = { fg = colors.color8 },
			semshiSelf = { fg = colors.color4, italic = true },
			semshiGlobal = { fg = colors.color2 },
			semshiBuiltin = { fg = colors.color2 },
			semshiAttribute = { fg = colors.color11, italic = true },
			semshiLocal = { fg = colors.color1 },
			semshiFree = { fg = colors.color1 },
			semshiSelected = { link = "CocHighlightText" },
			semshiErrorSign = { link = "ALEErrorSign" },
			semshiErrorChar = { link = "ALEErrorSign" },
			--: }}}
		}),
		--: }}}
		--: Lua: {{{
		apply_fileformat("lua", {
			--: builtin: {{{
			luaFunc = { fg = colors.color2 },
			luaFunction = { fg = colors.color1 },
			luaTable = { fg = colors.color4 },
			luaIn = { fg = colors.color1 },
			--: }}}
			--: vim-lua: https://github.com/tbastos/vim-lua{{{
			luaFuncCall = { fg = colors.color2 },
			luaLocal = { fg = colors.color1 },
			luaSpecialValue = { fg = colors.color2 },
			luaBraces = { fg = colors.foreground },
			luaBuiltIn = { fg = colors.color4, italic = true },
			luaNoise = { fg = colors.color8 },
			luaLabel = { fg = colors.color5 },
			luaFuncTable = { fg = colors.color4, italic = true },
			luaFuncArgName = { fg = colors.foreground },
			luaEllipsis = { fg = colors.color1 },
			luaDocTag = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: Java: {{{
		apply_fileformat("java", {
			--: builtin: {{{
			javaClassDecl = { fg = colors.color1 },
			javaMethodDecl = { fg = colors.color1 },
			javaVarArg = { fg = colors.foreground },
			javaAnnotation = { fg = colors.color5 },
			javaUserLabel = { fg = colors.color5 },
			javaTypedef = { fg = colors.color11, italic = true },
			javaParen = { fg = colors.foreground },
			javaParen1 = { fg = colors.foreground },
			javaParen2 = { fg = colors.foreground },
			javaParen3 = { fg = colors.foreground },
			javaParen4 = { fg = colors.foreground },
			javaParen5 = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: Kotlin: {{{
		apply_fileformat("kotlin", {
			--: kotlin-vim: https://github.com/udalov/kotlin-vim{{{
			ktSimpleInterpolation = { fg = colors.color5 },
			ktComplexInterpolation = { fg = colors.color5 },
			ktComplexInterpolationBrace = { fg = colors.color5 },
			ktStructure = { fg = colors.color1 },
			ktKeyword = { fg = colors.color11, italic = true },
			--: }}}
		}),
		--: }}}
		--: Scala: {{{
		apply_fileformat("scala", {
			--: builtin: https://github.com/derekwyatt/vim-scala{{{
			scalaNameDefinition = { fg = colors.foreground },
			scalaInterpolationBoundary = { fg = colors.color5 },
			scalaInterpolation = { fg = colors.color5 },
			scalaTypeOperator = { fg = colors.color1 },
			scalaOperator = { fg = colors.color1 },
			scalaKeywordModifier = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Go: {{{
		apply_fileformat("go", {
			--: builtin: https://github.com/google/vim-ft-go{{{
			goDirective = { fg = colors.color1 },
			goConstants = { fg = colors.color11, italic = true },
			goDeclType = { fg = colors.color1 },
			--: }}}
			--: polyglot: {{{
			goPackage = { fg = colors.color1 },
			goImport = { fg = colors.color1 },
			goBuiltins = { fg = colors.color2 },
			goPredefinedIdentifiers = { fg = colors.color11, italic = true },
			goVar = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Rust: {{{
		apply_fileformat("rust", {
			--: builtin: https://github.com/rust-lang/rust.vim{{{
			rustStructure = { fg = colors.color1 },
			rustIdentifier = { fg = colors.color11, italic = true },
			rustModPath = { fg = colors.color4, italic = true },
			rustModPathSep = { fg = colors.color8 },
			rustSelf = { fg = colors.color11, italic = true },
			rustSuper = { fg = colors.color11, italic = true },
			rustDeriveTrait = { fg = colors.color5 },
			rustEnumVariant = { fg = colors.color5 },
			rustMacroVariable = { fg = colors.color11, italic = true },
			rustAssert = { fg = colors.color2 },
			rustPanic = { fg = colors.color2 },
			rustPubScopeCrate = { fg = colors.color4, italic = true },
			rustAttribute = { fg = colors.color5 },
			--: }}}
		}),
		--: }}}
		--: Swift: {{{
		apply_fileformat("swift", {
			--: swift.vim: https://github.com/keith/swift.vim{{{
			swiftInterpolatedWrapper = { fg = colors.color5 },
			swiftInterpolatedString = { fg = colors.color5 },
			swiftProperty = { fg = colors.foreground },
			swiftTypeDeclaration = { fg = colors.color1 },
			swiftClosureArgument = { fg = colors.color11, italic = true },
			swiftStructure = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: PHP: {{{
		apply_fileformat("php", {
			--: builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
			phpVarSelector = { fg = colors.foreground },
			phpIdentifier = { fg = colors.foreground },
			phpDefine = { fg = colors.color2 },
			phpStructure = { fg = colors.color1 },
			phpSpecialFunction = { fg = colors.color2 },
			phpInterpSimpleCurly = { fg = colors.color5 },
			phpComparison = { fg = colors.color1 },
			phpMethodsVar = { fg = colors.foreground },
			phpInterpVarname = { fg = colors.foreground },
			phpMemberSelector = { fg = colors.color1 },
			phpLabel = { fg = colors.color1 },
			--: }}}
			--: php.vim: https://github.com/StanAngeloff/php.vim{{{
			phpParent = { fg = colors.foreground },
			phpNowDoc = { fg = colors.color3 },
			phpFunction = { fg = colors.color2 },
			phpMethod = { fg = colors.color2 },
			phpClass = { fg = colors.color4, italic = true },
			phpSuperglobals = { fg = colors.color4, italic = true },
			phpNullValue = { fg = colors.color11, italic = true },
			--: }}}
		}),
		--: }}}
		--: Ruby: {{{
		apply_fileformat("ruby", {
			--: builtin: https://github.com/vim-ruby/vim-ruby{{{
			rubyKeywordAsMethod = { fg = colors.color2 },
			rubyInterpolation = { fg = colors.color5 },
			rubyInterpolationDelimiter = { fg = colors.color5 },
			rubyStringDelimiter = { fg = colors.color3 },
			rubyBlockParameterList = { fg = colors.foreground },
			rubyDefine = { fg = colors.color1 },
			rubyModuleName = { fg = colors.color1 },
			rubyAccess = { fg = colors.color1 },
			rubyMacro = { fg = colors.color1 },
			rubySymbol = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: Haskell: {{{
		apply_fileformat("haskell", {
			--: haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
			haskellBrackets = { fg = colors.foreground },
			haskellIdentifier = { fg = colors.color11, italic = true },
			haskellDecl = { fg = colors.color1 },
			haskellType = { fg = colors.color4, italic = true },
			haskellDeclKeyword = { fg = colors.color1 },
			haskellWhere = { fg = colors.color1 },
			haskellDeriving = { fg = colors.color1 },
			haskellForeignKeywords = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Perl: {{{
		apply_fileformat("perl", {
			--: builtin: https://github.com/vim-perl/vim-perl{{{
			perlStatementPackage = { fg = colors.color1 },
			perlStatementInclude = { fg = colors.color1 },
			perlStatementStorage = { fg = colors.color1 },
			perlStatementList = { fg = colors.color1 },
			perlMatchStartEnd = { fg = colors.color1 },
			perlVarSimpleMemberName = { fg = colors.color2 },
			perlVarSimpleMember = { fg = colors.foreground },
			perlMethod = { fg = colors.color2 },
			podVerbatimLine = { fg = colors.color2 },
			podCmdText = { fg = colors.color3 },
			perlVarPlain = { fg = colors.foreground },
			perlVarPlain2 = { fg = colors.foreground },
			--: }}}
		}),
		--: }}}
		--: OCaml: {{{
		apply_fileformat("ocaml", {
			--: builtin: https://github.com/rgrinberg/vim-ocaml{{{
			ocamlArrow = { fg = colors.color1 },
			ocamlEqual = { fg = colors.color1 },
			ocamlOperator = { fg = colors.color1 },
			ocamlKeyChar = { fg = colors.color1 },
			ocamlModPath = { fg = colors.color2 },
			ocamlFullMod = { fg = colors.color2 },
			ocamlModule = { fg = colors.color4, italic = true },
			ocamlConstructor = { fg = colors.color11 },
			ocamlModParam = { fg = colors.foreground },
			ocamlModParam1 = { fg = colors.foreground },
			ocamlAnyVar = { fg = colors.color6 },
			ocamlPpxEncl = { fg = colors.color1 },
			ocamlPpxIdentifier = { fg = colors.foreground },
			ocamlSigEncl = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Erlang: {{{
		apply_fileformat("erlang", {
			--: builtin: https://github.com/vim-erlang/vim-erlang-runtime{{{
			erlangAtom = { fg = colors.foreground },
			erlangVariable = { fg = colors.foreground },
			erlangLocalFuncRef = { fg = colors.color2 },
			erlangLocalFuncCall = { fg = colors.color2 },
			erlangGlobalFuncRef = { fg = colors.color2 },
			erlangGlobalFuncCall = { fg = colors.color2 },
			erlangAttribute = { fg = colors.color4, italic = true },
			erlangPipe = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Elixir: {{{
		apply_fileformat("elixir", {
			--: vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
			elixirStringDelimiter = { fg = colors.color3 },
			elixirKeyword = { fg = colors.color1 },
			elixirInterpolation = { fg = colors.color5 },
			elixirInterpolationDelimiter = { fg = colors.color5 },
			elixirSelf = { fg = colors.color4, italic = true },
			elixirPseudoVariable = { fg = colors.color11, italic = true },
			elixirModuleDefine = { fg = colors.color1 },
			elixirBlockDefinition = { fg = colors.color1 },
			elixirDefine = { fg = colors.color1 },
			elixirPrivateDefine = { fg = colors.color1 },
			elixirGuard = { fg = colors.color1 },
			elixirPrivateGuard = { fg = colors.color1 },
			elixirProtocolDefine = { fg = colors.color1 },
			elixirImplDefine = { fg = colors.color1 },
			elixirRecordDefine = { fg = colors.color1 },
			elixirPrivateRecordDefine = { fg = colors.color1 },
			elixirMacroDefine = { fg = colors.color1 },
			elixirPrivateMacroDefine = { fg = colors.color1 },
			elixirDelegateDefine = { fg = colors.color1 },
			elixirOverridableDefine = { fg = colors.color1 },
			elixirExceptionDefine = { fg = colors.color1 },
			elixirCallbackDefine = { fg = colors.color1 },
			elixirStructDefine = { fg = colors.color1 },
			elixirExUnitMacro = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Common Lisp: {{{
		apply_fileformat("common_lisp", {
			--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
			lispAtomMark = { fg = colors.color5 },
			lispKey = { fg = colors.color11 },
			lispFunc = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: Clojure: {{{
		apply_fileformat("clojure", {
			--: builtin: https://github.com/guns/vim-clojure-static{{{
			clojureMacro = { fg = colors.color1 },
			clojureFunc = { fg = colors.color2 },
			clojureConstant = { fg = colors.color11, italic = true },
			clojureSpecial = { fg = colors.color1 },
			clojureDefine = { fg = colors.color1 },
			clojureKeyword = { fg = colors.color4 },
			clojureVariable = { fg = colors.foreground },
			clojureMeta = { fg = colors.color5 },
			clojureDeref = { fg = colors.color5 },
			--: }}}
		}),
		--: }}}
		--: Matlab: {{{
		apply_fileformat("matlab", {
			--: builtin: {{{
			matlabSemicolon = { fg = colors.foreground },
			matlabFunction = { fg = colors.color1, italic = true },
			matlabImplicit = { fg = colors.color2 },
			matlabDelimiter = { fg = colors.foreground },
			matlabOperator = { fg = colors.color2 },
			matlabArithmeticOperator = { fg = colors.color1 },
			matlabRelationalOperator = { fg = colors.color1 },
			matlabLogicalOperator = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Shell: {{{
		apply_fileformat("shell", {
			--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
			shRange = { fg = colors.foreground },
			shOption = { fg = colors.color5 },
			shQuote = { fg = colors.color3 },
			shVariable = { fg = colors.color4, italic = true },
			shDerefSimple = { fg = colors.color4, italic = true },
			shDerefVar = { fg = colors.color4, italic = true },
			shDerefSpecial = { fg = colors.color4, italic = true },
			shDerefOff = { fg = colors.color4, italic = true },
			shVarAssign = { fg = colors.color1 },
			shFunctionOne = { fg = colors.color2 },
			shFunctionKey = { fg = colors.color1 },
			--: }}}
		}),
		--: }}}
		--: Zsh: {{{
		apply_fileformat("zsh", {
			--: builtin: https://github.com/chrisbra/vim-zsh{{{
			zshOption = { fg = colors.color4, italic = true },
			zshSubst = { fg = colors.color11 },
			zshFunction = { fg = colors.color2 },
			--: }}}
		}),
		--: }}}
		--: PowerShell: {{{
		apply_fileformat("powershell", {
			--: vim-ps1: https://github.com/PProvost/vim-ps1{{{
			ps1FunctionInvocation = { fg = colors.color2 },
			ps1FunctionDeclaration = { fg = colors.color2 },
			ps1InterpolationDelimiter = { fg = colors.color5 },
			ps1BuiltIn = { fg = colors.color4, italic = true },
			--: }}}
		}),
		--: }}}
		--: VimL: {{{
		apply_fileformat("viml", {
			vimLet = { fg = colors.color1 },
			vimFunction = { fg = colors.color2 },
			vimIsCommand = { fg = colors.foreground },
			vimUserFunc = { fg = colors.color2 },
			vimFuncName = { fg = colors.color2 },
			vimMap = { fg = colors.color4, italic = true },
			vimNotation = { fg = colors.color5 },
			vimMapLhs = { fg = colors.color2 },
			vimMapRhs = { fg = colors.color2 },
			vimSetEqual = { fg = colors.color4, italic = true },
			vimSetSep = { fg = colors.foreground },
			vimOption = { fg = colors.color4, italic = true },
			vimUserAttrbKey = { fg = colors.color4, italic = true },
			vimUserAttrb = { fg = colors.color2 },
			vimAutoCmdSfxList = { fg = colors.color11 },
			vimSynType = { fg = colors.color11 },
			vimHiBang = { fg = colors.color11 },
			vimSet = { fg = colors.color4, italic = true },
		}),
		--: }}}
		--: Makefile: {{{
		apply_fileformat("makefile", {
			makeIdent = { fg = colors.color5 },
			makeSpecTarget = { fg = colors.color4, italic = true },
			makeTarget = { fg = colors.color11 },
			makeCommands = { fg = colors.color1 },
		}),
		--: }}}
		--: CMake: {{{
		apply_fileformat("cmake", {
			cmakeCommand = { fg = colors.color1 },
			cmakeKWconfigure_package_config_file = { fg = colors.color4, italic = true },
			cmakeKWwrite_basic_package_version_file = { fg = colors.color4, italic = true },
			cmakeKWExternalProject = { fg = colors.color2 },
			cmakeKWadd_compile_definitions = { fg = colors.color2 },
			cmakeKWadd_compile_options = { fg = colors.color2 },
			cmakeKWadd_custom_command = { fg = colors.color2 },
			cmakeKWadd_custom_target = { fg = colors.color2 },
			cmakeKWadd_definitions = { fg = colors.color2 },
			cmakeKWadd_dependencies = { fg = colors.color2 },
			cmakeKWadd_executable = { fg = colors.color2 },
			cmakeKWadd_library = { fg = colors.color2 },
			cmakeKWadd_link_options = { fg = colors.color2 },
			cmakeKWadd_subdirectory = { fg = colors.color2 },
			cmakeKWadd_test = { fg = colors.color2 },
			cmakeKWbuild_command = { fg = colors.color2 },
			cmakeKWcmake_host_system_information = { fg = colors.color2 },
			cmakeKWcmake_minimum_required = { fg = colors.color2 },
			cmakeKWcmake_parse_arguments = { fg = colors.color2 },
			cmakeKWcmake_policy = { fg = colors.color2 },
			cmakeKWconfigure_file = { fg = colors.color2 },
			cmakeKWcreate_test_sourcelist = { fg = colors.color2 },
			cmakeKWctest_build = { fg = colors.color2 },
			cmakeKWctest_configure = { fg = colors.color2 },
			cmakeKWctest_coverage = { fg = colors.color2 },
			cmakeKWctest_memcheck = { fg = colors.color2 },
			cmakeKWctest_run_script = { fg = colors.color2 },
			cmakeKWctest_start = { fg = colors.color2 },
			cmakeKWctest_submit = { fg = colors.color2 },
			cmakeKWctest_test = { fg = colors.color2 },
			cmakeKWctest_update = { fg = colors.color2 },
			cmakeKWctest_upload = { fg = colors.color2 },
			cmakeKWdefine_property = { fg = colors.color2 },
			cmakeKWdoxygen_add_docs = { fg = colors.color2 },
			cmakeKWenable_language = { fg = colors.color2 },
			cmakeKWenable_testing = { fg = colors.color2 },
			cmakeKWexec_program = { fg = colors.color2 },
			cmakeKWexecute_process = { fg = colors.color2 },
			cmakeKWexport = { fg = colors.color2 },
			cmakeKWexport_library_dependencies = { fg = colors.color2 },
			cmakeKWfile = { fg = colors.color2 },
			cmakeKWfind_file = { fg = colors.color2 },
			cmakeKWfind_library = { fg = colors.color2 },
			cmakeKWfind_package = { fg = colors.color2 },
			cmakeKWfind_path = { fg = colors.color2 },
			cmakeKWfind_program = { fg = colors.color2 },
			cmakeKWfltk_wrap_ui = { fg = colors.color2 },
			cmakeKWforeach = { fg = colors.color2 },
			cmakeKWfunction = { fg = colors.color2 },
			cmakeKWget_cmake_property = { fg = colors.color2 },
			cmakeKWget_directory_property = { fg = colors.color2 },
			cmakeKWget_filename_component = { fg = colors.color2 },
			cmakeKWget_property = { fg = colors.color2 },
			cmakeKWget_source_file_property = { fg = colors.color2 },
			cmakeKWget_target_property = { fg = colors.color2 },
			cmakeKWget_test_property = { fg = colors.color2 },
			cmakeKWif = { fg = colors.colors2 },
			cmakeKWinclude = { fg = colors.colors2 },
			cmakeKWinclude_directories = { fg = colors.colors2 },
			cmakeKWinclude_external_msproject = { fg = colors.colors2 },
			cmakeKWinclude_guard = { fg = colors.colors2 },
			cmakeKWinstall = { fg = colors.colors2 },
			cmakeKWinstall_files = { fg = colors.colors2 },
			cmakeKWinstall_programs = { fg = colors.colors2 },
			cmakeKWinstall_targets = { fg = colors.colors2 },
			cmakeKWlink_directories = { fg = colors.colors2 },
			cmakeKWlist = { fg = colors.colors2 },
			cmakeKWload_cache = { fg = colors.colors2 },
			cmakeKWload_command = { fg = colors.colors2 },
			cmakeKWmacro = { fg = colors.colors2 },
			cmakeKWmark_as_advanced = { fg = colors.colors2 },
			cmakeKWmath = { fg = colors.colors2 },
			cmakeKWmessage = { fg = colors.colors2 },
			cmakeKWoption = { fg = colors.colors2 },
			cmakeKWproject = { fg = colors.colors2 },
			cmakeKWqt_wrap_cpp = { fg = colors.colors2 },
			cmakeKWqt_wrap_ui = { fg = colors.colors2 },
			cmakeKWremove = { fg = colors.colors2 },
			cmakeKWseparate_arguments = { fg = colors.colors2 },
			cmakeKWset = { fg = colors.colors2 },
			cmakeKWset_directory_properties = { fg = colors.colors2 },
			cmakeKWset_property = { fg = colors.colors2 },
			cmakeKWset_source_files_properties = { fg = colors.colors2 },
			cmakeKWset_target_properties = { fg = colors.colors2 },
			cmakeKWset_tests_properties = { fg = colors.colors2 },
			cmakeKWsource_group = { fg = colors.colors2 },
			cmakeKWstring = { fg = colors.colors2 },
			cmakeKWsubdirs = { fg = colors.colors2 },
			cmakeKWtarget_compile_definitions = { fg = colors.colors2 },
			cmakeKWtarget_compile_features = { fg = colors.colors2 },
			cmakeKWtarget_compile_options = { fg = colors.colors2 },
			cmakeKWtarget_include_directories = { fg = colors.colors2 },
			cmakeKWtarget_link_directories = { fg = colors.colors2 },
			cmakeKWtarget_link_libraries = { fg = colors.colors2 },
			cmakeKWtarget_link_options = { fg = colors.colors2 },
			cmakeKWtarget_precompile_headers = { fg = colors.colors2 },
			cmakeKWtarget_sources = { fg = colors.colors2 },
			cmakeKWtry_compile = { fg = colors.colors2 },
			cmakeKWtry_run = { fg = colors.colors2 },
			cmakeKWunset = { fg = colors.colors2 },
			cmakeKWuse_mangled_mesa = { fg = colors.colors2 },
			cmakeKWvariable_requires = { fg = colors.colors2 },
			cmakeKWvariable_watch = { fg = colors.colors2 },
			cmakeKWwrite_file = { fg = colors.colors2 },
		}),
		--: }}}
		--: Json: {{{
		apply_fileformat("json", {
			jsonKeyword = { fg = colors.color1 },
			jsonString = { fg = colors.color2 },
			jsonBoolean = { fg = colors.color4 },
			jsonNoise = { fg = colors.color8 },
			jsonQuote = { fg = colors.color8 },
			jsonBraces = { fg = colors.foreground },
		}),
		--: }}}
		--: Yaml: {{{
		apply_fileformat("yaml", {
			yamlKey = { fg = colors.color1 },
			yamlConstant = { fg = colors.color4, italic = true },
			yamlString = { fg = colors.color2 },
		}),
		--: }}}
		--: Toml: {{{
		apply_fileformat("toml", {
			tomlTable = { bg = colors.background, fg = colors.color5, bold = true },
			tomlKey = { fg = colors.color1 },
			tomlBoolean = { fg = colors.color4 },
			tomlString = { fg = colors.color2 },
			tomlTableArray = { link = "tomlTable" },
		}),
		--: }}}
		--: Diff: {{{
		apply_fileformat("diff", {
			diffAdded = { fg = colors.color2 },
			diffRemoved = { fg = colors.color1 },
			diffChanged = { fg = colors.color4 },
			diffOldFile = { fg = colors.color3 },
			diffNewFile = { fg = colors.color11 },
			diffFile = { fg = colors.color5 },
			diffLine = { fg = colors.color8 },
			diffIndexLine = { fg = colors.color5 },
		}),
		--: }}}
		--: Git Commit: {{{
		apply_fileformat("git_commit", {
			gitcommitSummary = { fg = colors.color1 },
			gitcommitUntracked = { fg = colors.color8 },
			gitcommitDiscarded = { fg = colors.color8 },
			gitcommitSelected = { fg = colors.color8 },
			gitcommitUnmerged = { fg = colors.color8 },
			gitcommitOnBranch = { fg = colors.color8 },
			gitcommitArrow = { fg = colors.color8 },
			gitcommitFile = { fg = colors.color2 },
		}),
		--: }}}
		--: INI: {{{
		apply_fileformat("ini", {
			dosiniHeader = { fg = colors.color1, bold = true },
			dosiniLabel = { fg = colors.color4 },
			dosiniValue = { fg = colors.color2 },
			dosiniNumber = { fg = colors.color2 },
		}),
		--: }}}
		--: Help: {{{
		apply_fileformat("help", {
			helpNote = { fg = colors.color5, bold = true },
			helpHeadline = { fg = colors.color1, bold = true },
			helpHeader = { fg = colors.color11, bold = true },
			helpURL = { fg = colors.color2, underline = true },
			helpHyperTextEntry = { fg = colors.color4, bold = true },
			helpHyperTextJump = { fg = colors.color4 },
			helpCommand = { fg = colors.color3 },
			helpExample = { fg = colors.color2 },
			helpSpecial = { fg = colors.color5 },
			helpSectionDelim = { fg = colors.color8 },
		}),
		--: }}}
	{})
end

return M
