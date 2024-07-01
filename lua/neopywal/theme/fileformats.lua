-- vim:fileencoding=utf-8:foldmethod=marker

local M = {}

--: Markdown {{{
function M.markdown()
	return {
		--: builtin {{{
		markdownH1 = { link = "rainbow1" },
		markdownH2 = { link = "rainbow2" },
		markdownH3 = { link = "rainbow3" },
		markdownH4 = { link = "rainbow4" },
		markdownH5 = { link = "rainbow5" },
		markdownH6 = { link = "rainbow6" },
		markdownUrl = { link = "URLlink" },
		markdownItalic = { link = "Italic" },
		markdownBold = { link = "Bold" },
		markdownItalicDelimiter = { link = "Delimiter" },
		markdownCode = { link = "Function" },
		markdownCodeBlock = { link = "Function" },
		markdownCodeDelimiter = { link = "Delimiter" },
		markdownBlockquote = { link = "Normal" },
		markdownListMarker = { link = "SpecialChar" },
		markdownOrderedListMarker = { link = "SpecialChar" },
		markdownRule = { link = "PreProc" },
		markdownHeadingRule = { link = "Normal" },
		markdownUrlDelimiter = { link = "Delimiter" },
		markdownLinkDelimiter = { link = "Delimiter" },
		markdownLinkTextDelimiter = { link = "Delimiter" },
		markdownHeadingDelimiter = { link = "Delimiter" },
		markdownLinkText = { link = "Include" },
		markdownUrlTitleDelimiter = { link = "Delimiter" },
		markdownIdDeclaration = { link = "markdownLinkText" },
		markdownBoldDelimiter = { link = "Delimiter" },
		markdownId = { link = "Identifier" },
		--: }}}
		--: vim-markdown: https://github.com/gabrielelana/vim-markdown {{{
		mkdURL = { link = "markdownUrl" },
		mkdInlineURL = { link = "markdownUrl" },
		mkdItalic = { link = "Italic" },
		mkdCodeDelimiter = { link = "Delimiter" },
		mkdBold = { link = "Bold" },
		mkdLink = { link = "Include" },
		mkdHeading = { link = "markdownHeadingRule" },
		mkdListItem = { link = "markdownListMarker" },
		mkdRule = { link = "markdownRule" },
		mkdDelimiter = { link = "Delimiter" },
		mkdId = { link = "Identifier" },
		--: }}}
	}
end
--: }}}
--: ReStructuredText {{{
function M.restructuredtext()
	return {
		--: builtin: https://github.com/marshallward/vim-restructuredtext {{{
		rstStandaloneHyperlink = { link = "URLlink" },
		rstEmphasis = { styles = { "italic" } },
		rstStrongEmphasis = { styles = { "bold", "italic" } },
		rstHyperlinkTarget = { link = "URLlink" },
		rstSubstitutionReference = { link = "Type" },
		rstInterpretedTextOrHyperlinkReference = { link = "String" },
		rstTableLines = { link = "Special" },
		rstInlineLiteral = { link = "Constant" },
		rstLiteralBlock = { link = "String" },
		rstQuotedLiteralBlock = { link = "String" },
		--: }}}
	}
end
--: }}}
--: LaTex {{{
function M.latex()
	return {
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX {{{
		texStatement = { link = "Statement" },
		texOnlyMath = { link = "Operator" },
		texDefName = { link = "TypeDef" },
		texNewCmd = { link = "Identifier" },
		texCmdName = { link = "Variable" },
		texBeginEnd = { link = "Delimiter" },
		texBeginEndName = { link = "Type" },
		texDocType = { link = "Type" },
		texDocTypeArgs = { link = "Identifier" },
		texInputFile = { link = "Include" },
		--: }}}
	}
end
--: }}}
--: Html {{{
function M.html()
	return {
		--: builtin: https://notabug.org/jorgesumle/vim-html-syntax {{{
		htmlH1 = { link = "rainbow1" },
		htmlH2 = { link = "rainbow2" },
		htmlH3 = { link = "rainbow3" },
		htmlH4 = { link = "rainbow4" },
		htmlH5 = { link = "rainbow5" },
		htmlH6 = { link = "rainbow6" },
		htmlLink = { link = "URLlink" },
		htmlBold = { link = "Bold" },
		htmlBoldUnderline = { styles = { "bold", "underline" } },
		htmlBoldItalic = { styles = { "bold", "italic" } },
		htmlBoldUnderlineItalic = { styles = { "bold", "italic", "underline" } },
		htmlUnderline = { link = "Underlined" },
		htmlUnderlineItalic = { styles = { "italic", "underline" } },
		htmlItalic = { styles = { "italic" } },
		htmlTag = { link = "Delimiter" },
		htmlEndTag = { link = "Delimiter" },
		htmlTagN = { link = "Tag" },
		htmlTagName = { link = "Label" },
		htmlArg = { link = "Type" },
		htmlScriptTag = { link = "SpecialChar" },
		htmlSpecialTagName = { link = "Special" },
		htmlString = { link = "String" },
		--: }}}
	}
end
--: }}}
--: Xml {{{
function M.xml()
	return {
		--: builtin: https://github.com/chrisbra/vim-xml-ftplugin {{{
		xmlTag = { link = "Delimiter" },
		xmlEndTag = { link = "Delimiter" },
		xmlTagName = { link = "Label" },
		xmlEqual = { link = "Statement" },
		xmlAttrib = { link = "Type" },
		xmlEntity = { link = "Identifier" },
		xmlEntityPunct = { link = "Identifier" },
		xmlDocTypeDecl = { link = "Type" },
		xmlDocTypeKeyword = { link = "Keyword" },
		xmlCdataStart = { link = "Normal" },
		xmlCdataCdata = { link = "PreProc" },
		xmlString = { link = "String" },
		--: }}}
	}
end
--: }}}
--: CSS {{{
function M.css()
	return {
		--: builtin: https://github.com/JulesWang/css.vim {{{
		cssStringQ = { link = "String" },
		cssStringQQ = { link = "cssStringQ" },
		cssAttrComma = { link = "Normal" },
		cssBraces = { link = "SpecialChar" },
		cssTagName = { link = "Tag" },
		cssClassNameDot = { link = "Delimiter" },
		cssClassName = { link = "Constant" },
		cssFunctionName = { link = "Function" },
		cssAttr = { link = "Type" },
		cssCommonAttr = { link = "Type" },
		cssProp = { link = "Statement" },
		cssPseudoClassId = { link = "Identifier" },
		cssPseudoClassFn = { link = "Function" },
		cssPseudoClass = { link = "String" },
		cssImportant = { link = "Statement" },
		cssSelectorOp = { link = "Identifier" },
		cssSelectorOp2 = { link = "Identifier" },
		cssColor = { link = "Special" },
		cssUnitDecorators = { link = "Identifier" },
		cssValueLength = { link = "Number" },
		cssValueInteger = { link = "Constant" },
		cssValueNumber = { link = "Number" },
		cssValueAngle = { link = "Float" },
		cssValueTime = { link = "Float" },
		cssValueFrequency = { link = "Float" },
		cssVendor = { link = "Normal" },
		cssNoise = { link = "Normal" },
		--: }}}
	}
end
--: }}}
--: SASS {{{
function M.sass()
	return {
		--: scss-syntax: https://github.com/cakebaker/scss-syntax.vim {{{
		scssMixinName = { link = "Identifier" },
		scssSelectorChar = { link = "Identifier" },
		scssSelectorName = { link = "Constant" },
		scssInterpolationDelimiter = { link = "Special" },
		scssVariableValue = { link = "Identifier" },
		scssNull = { link = "Constant" },
		scssBoolean = { link = "Boolean" },
		scssVariableAssignment = { link = "Variable" },
		scssAttribute = { link = "Type" },
		scssFunctionName = { link = "Function" },
		scssVariable = { link = "Variable" },
		scssAmpersand = { link = "Operator" },
		--: }}}
	}
end
--: }}}
--: LESS {{{
function M.less()
	return {
		--: vim-less: https://github.com/groenewege/vim-less {{{
		lessMixinChar = { link = "Normal" },
		lessClass = { link = "Identifier" },
		lessFunction = { link = "Function" },
		--: }}}
	}
end
--: }}}
--: JavaScript {{{
function M.javascript()
	return {
		--: builtin: http://www.fleiner.com/vim/syntax/javascript.vim {{{
		javaScriptNull = { link = "Constant" },
		javaScriptIdentifier = { link = "Identifier" },
		javaScriptParens = { link = "SpecialChar" },
		javaScriptBraces = { link = "SpecialChar" },
		javaScriptNumber = { link = "Number" },
		javaScriptLabel = { link = "Label" },
		javaScriptGlobal = { link = "Type" },
		javaScriptMessage = { link = "javaScriptGlobal" },
		--: }}}
		--: vim-javascript: https://github.com/pangloss/vim-javascript {{{
		jsNoise = { link = "Normal" },
		Noise = { link = "Normal" },
		jsParens = { link = "SpecialChar" },
		jsBrackets = { link = "SpecialChar" },
		jsObjectBraces = { link = "SpecialChar" },
		jsThis = { link = "Statement" },
		jsUndefined = { link = "Error" },
		jsNull = { link = "Constant" },
		jsNan = { link = "Constant" },
		jsSuper = { link = "Identifier" },
		jsPrototype = { link = "Identifier" },
		jsFunction = { link = "Function" },
		jsGlobalNodeObjects = { link = "javaScriptGlobal" },
		jsGlobalObjects = { link = "javaScriptGlobal" },
		jsArrowFunction = { link = "Function" },
		jsArrowFuncArgs = { link = "Identifier" },
		jsFuncArgs = { link = "Identifier" },
		jsObjectProp = { link = "PreProc" },
		jsVariableDef = { link = "Variable" },
		jsObjectKey = { link = "Normal" },
		jsParen = { link = "SpecialChar" },
		jsParenIfElse = { link = "Conditional" },
		jsParenRepeat = { link = "Repeat" },
		jsParenSwitch = { link = "Conditional" },
		jsParenCatch = { link = "Exception" },
		jsBracket = { link = "SpecialChar" },
		jsObjectValue = { link = "jsObjectKey" },
		jsDestructuringBlock = { link = "String" },
		jsBlockLabel = { link = "Label" },
		jsFunctionKey = { link = "Function" },
		jsClassDefinition = { link = "Define" },
		jsDot = { link = "Delimiter" },
		jsSpreadOperator = { link = "Operator" },
		jsModuleKeyword = { link = "Keyword" },
		jsTemplateBraces = { link = "SpecialChar" },
		jsTemplateExpression = { link = "jsTemplateBraces" },
		jsSpreadExpression = { link = "jsTemplateExpression" },
		jsClassMethodType = { link = "Type" },
		jsExceptions = { link = "Exception" },
		--: }}}
		--: yajs: https://github.com/othree/yajs.vim {{{
		javascriptOpSymbol = { link = "Function" },
		javascriptOpSymbols = { link = "Function" },
		javascriptIdentifierName = { link = "Identifier" },
		javascriptVariable = { link = "Variable" },
		javascriptObjectLabel = { link = "Label" },
		javascriptPropertyNameString = { link = "PreProc" },
		javascriptFuncArg = { link = "Identifier" },
		javascriptObjectLiteral = { link = "Function" },
		javascriptIdentifier = { link = "Identifier" },
		javascriptArrowFunc = { link = "Function" },
		javascriptTemplate = { link = "Type" },
		javascriptTemplateSubstitution = { link = "javascriptTemplate" },
		javascriptTemplateSB = { link = "javascriptTemplateSubstitution" },
		javascriptNodeGlobal = { link = "javaScriptGlobal" },
		javascriptDocTags = { link = "Tag" },
		javascriptDocNotation = { link = "String" },
		javascriptClassSuper = { link = "Identifier" },
		javascriptClassName = { link = "Type" },
		javascriptClassSuperName = { link = "Type" },
		javascriptOperator = { link = "Operator" },
		javascriptBrackets = { link = "SpecialChar" },
		javascriptBraces = { link = "SpecialChar" },
		javascriptLabel = { link = "Label" },
		javascriptEndColons = { link = "Delimiter" },
		javascriptObjectLabelColon = { link = "Delimiter" },
		javascriptDotNotation = { link = "Identifier" },
		javascriptGlobalArrayDot = { link = "Identifier" },
		javascriptGlobalBigIntDot = { link = "Identifier" },
		javascriptGlobalDateDot = { link = "Identifier" },
		javascriptGlobalJSONDot = { link = "Identifier" },
		javascriptGlobalMathDot = { link = "Identifier" },
		javascriptGlobalNumberDot = { link = "Identifier" },
		javascriptGlobalObjectDot = { link = "Identifier" },
		javascriptGlobalPromiseDot = { link = "Identifier" },
		javascriptGlobalRegExpDot = { link = "Identifier" },
		javascriptGlobalStringDot = { link = "Identifier" },
		javascriptGlobalSymbolDot = { link = "Identifier" },
		javascriptGlobalURLDot = { link = "Identifier" },
		javascriptMethod = { link = "Function" },
		javascriptMethodName = { link = "Function" },
		javascriptObjectMethodName = { link = "Function" },
		javascriptGlobalMethod = { link = "Function" },
		javascriptDOMStorageMethod = { link = "Function" },
		javascriptFileMethod = { link = "Function" },
		javascriptFileReaderMethod = { link = "Function" },
		javascriptFileListMethod = { link = "Function" },
		javascriptBlobMethod = { link = "Function" },
		javascriptURLStaticMethod = { link = "Function" },
		javascriptNumberStaticMethod = { link = "Function" },
		javascriptNumberMethod = { link = "Function" },
		javascriptDOMNodeMethod = { link = "Function" },
		javascriptES6BigIntStaticMethod = { link = "Function" },
		javascriptBOMWindowMethod = { link = "Function" },
		javascriptHeadersMethod = { link = "Function" },
		javascriptRequestMethod = { link = "Function" },
		javascriptResponseMethod = { link = "Function" },
		javascriptES6SetMethod = { link = "Function" },
		javascriptReflectMethod = { link = "Function" },
		javascriptPaymentMethod = { link = "Function" },
		javascriptPaymentResponseMethod = { link = "Function" },
		javascriptTypedArrayStaticMethod = { link = "Function" },
		javascriptGeolocationMethod = { link = "Function" },
		javascriptES6MapMethod = { link = "Function" },
		javascriptServiceWorkerMethod = { link = "Function" },
		javascriptCacheMethod = { link = "Function" },
		javascriptFunctionMethod = { link = "Function" },
		javascriptXHRMethod = { link = "Function" },
		javascriptBOMNavigatorMethod = { link = "Function" },
		javascriptDOMEventTargetMethod = { link = "Function" },
		javascriptDOMEventMethod = { link = "Function" },
		javascriptIntlMethod = { link = "Function" },
		javascriptDOMDocMethod = { link = "Function" },
		javascriptStringStaticMethod = { link = "String" },
		javascriptStringMethod = { link = "String" },
		javascriptSymbolStaticMethod = { link = "Function" },
		javascriptRegExpMethod = { link = "Function" },
		javascriptObjectStaticMethod = { link = "Function" },
		javascriptObjectMethod = { link = "Function" },
		javascriptBOMLocationMethod = { link = "Function" },
		javascriptJSONStaticMethod = { link = "Function" },
		javascriptGeneratorMethod = { link = "Function" },
		javascriptEncodingMethod = { link = "Function" },
		javascriptPromiseStaticMethod = { link = "Function" },
		javascriptPromiseMethod = { link = "Function" },
		javascriptBOMHistoryMethod = { link = "Function" },
		javascriptDOMFormMethod = { link = "Function" },
		javascriptClipboardMethod = { link = "Function" },
		javascriptBroadcastMethod = { link = "Function" },
		javascriptDateStaticMethod = { link = "Function" },
		javascriptDateMethod = { link = "Function" },
		javascriptConsoleMethod = { link = "Function" },
		javascriptArrayStaticMethod = { link = "Function" },
		javascriptArrayMethod = { link = "Function" },
		javascriptMathStaticMethod = { link = "Function" },
		javascriptSubtleCryptoMethod = { link = "Function" },
		javascriptCryptoMethod = { link = "Function" },
		javascriptProp = { link = "PreProc" },
		javascriptBOMWindowProp = { link = "PreProc" },
		javascriptDOMStorageProp = { link = "PreProc" },
		javascriptFileReaderProp = { link = "PreProc" },
		javascriptURLUtilsProp = { link = "PreProc" },
		javascriptNumberStaticProp = { link = "PreProc" },
		javascriptDOMNodeProp = { link = "PreProc" },
		javascriptRequestProp = { link = "PreProc" },
		javascriptResponseProp = { link = "PreProc" },
		javascriptES6SetProp = { link = "PreProc" },
		javascriptPaymentProp = { link = "PreProc" },
		javascriptPaymentResponseProp = { link = "PreProc" },
		javascriptPaymentAddressProp = { link = "PreProc" },
		javascriptPaymentShippingOptionProp = { link = "PreProc" },
		javascriptTypedArrayStaticProp = { link = "PreProc" },
		javascriptServiceWorkerProp = { link = "PreProc" },
		javascriptES6MapProp = { link = "PreProc" },
		javascriptRegExpStaticProp = { link = "PreProc" },
		javascriptRegExpProp = { link = "PreProc" },
		javascriptXHRProp = { link = "PreProc" },
		javascriptBOMNavigatorProp = { link = "Function" },
		javascriptDOMEventProp = { link = "PreProc" },
		javascriptBOMNetworkProp = { link = "PreProc" },
		javascriptDOMDocProp = { link = "PreProc" },
		javascriptSymbolStaticProp = { link = "PreProc" },
		javascriptSymbolProp = { link = "PreProc" },
		javascriptBOMLocationProp = { link = "PreProc" },
		javascriptEncodingProp = { link = "PreProc" },
		javascriptCryptoProp = { link = "PreProc" },
		javascriptBOMHistoryProp = { link = "PreProc" },
		javascriptDOMFormProp = { link = "PreProc" },
		javascriptDataViewProp = { link = "PreProc" },
		javascriptBroadcastProp = { link = "PreProc" },
		javascriptMathStaticProp = { link = "PreProc" },
		--: }}}
	}
end
--: }}}
--: JavaScript React {{{
function M.javascript_react()
	return {
		--: vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty {{{
		jsxTagName = { link = "Tag" },
		jsxOpenPunct = { link = "Identifier" },
		jsxClosePunct = { link = "Delimiter" },
		jsxEscapeJs = { link = "Special" },
		jsxAttrib = { link = "Type" },
		--: }}}
	}
end
--: }}}
--: TypeScript {{{
function M.typescript()
	return {
		--: vim-typescript: https://github.com/leafgarland/typescript-vim {{{
		typescriptStorageClass = { link = "StorageClass" },
		typescriptEndColons = { link = "Delimiter" },
		typescriptSource = { link = "Type" },
		typescriptMessage = { link = "Type" },
		typescriptGlobalObjects = { link = "Type" },
		typescriptInterpolation = { link = "Special" },
		typescriptInterpolationDelimiter = { link = "Special" },
		typescriptBraces = { link = "SpecialChar" },
		typescriptParens = { link = "SpecialChar" },
		--: }}}
		--: yats: https:github.com/HerringtonDarkholme/yats.vim {{{
		typescriptMethodAccessor = { link = "Function" },
		typescriptVariable = { link = "Variable" },
		typescriptVariableDeclaration = { link = "Define" },
		typescriptTypeReference = { link = "Type" },
		typescriptEnumKeyword = { link = "Keyword" },
		typescriptEnum = { link = "Constant" },
		typescriptIdentifierName = { link = "Identifier" },
		typescriptProp = { link = "PreProc" },
		typescriptCall = { link = "Function" },
		typescriptInterfaceName = { link = "Type" },
		typescriptMember = { link = "Type" },
		typescriptMemberOptionality = { link = "Type" },
		typescriptObjectLabel = { link = "Label" },
		typescriptDefaultParam = { link = "Identifier" },
		typescriptArrowFunc = { link = "Function" },
		typescriptAbstract = { link = "Special" },
		typescriptObjectColon = { link = "Delimiter" },
		typescriptTypeAnnotation = { link = "Type" },
		typescriptAssign = { link = "Define" },
		typescriptBinaryOp = { link = "Operator" },
		typescriptUnaryOp = { link = "Operator" },
		typescriptFuncComma = { link = "Delimiter" },
		typescriptClassName = { link = "Type" },
		typescriptClassHeritage = { link = "Type" },
		typescriptInterfaceHeritage = { link = "Type" },
		typescriptIdentifier = { link = "Identifier" },
		typescriptGlobal = { link = "Type" },
		typescriptOperator = { link = "Operator" },
		typescriptNodeGlobal = { link = "typescriptGlobal" },
		typescriptExport = { link = "Operator" },
		typescriptImport = { link = "Include" },
		typescriptTypeParameter = { link = "Type" },
		typescriptReadonlyModifier = { link = "Exception" },
		typescriptAccessibilityModifier = { link = "Debug" },
		typescriptAmbientDeclaration = { link = "Define" },
		typescriptTemplateSubstitution = { link = "Type" },
		typescriptTemplateSB = { link = "typescriptTemplateSubstitution" },
		typescriptExceptions = { link = "Exception" },
		typescriptCastKeyword = { link = "Keyword" },
		typescriptOptionalMark = { link = "Exception" },
		typescriptNull = { link = "Constant" },
		typescriptMappedIn = { link = "Define" },
		typescriptFuncTypeArrow = { link = "Function" },
		typescriptTernaryOp = { link = "Define" },
		typescriptParenExp = { link = "Statement" },
		typescriptIndexExpr = { link = "Statement" },
		typescriptDotNotation = { link = "Identifier" },
		typescriptGlobalNumberDot = { link = "Identifier" },
		typescriptGlobalStringDot = { link = "Identifier" },
		typescriptGlobalArrayDot = { link = "Identifier" },
		typescriptGlobalObjectDot = { link = "Identifier" },
		typescriptGlobalSymbolDot = { link = "Identifier" },
		typescriptGlobalMathDot = { link = "Identifier" },
		typescriptGlobalDateDot = { link = "Identifier" },
		typescriptGlobalJSONDot = { link = "Identifier" },
		typescriptGlobalRegExpDot = { link = "Identifier" },
		typescriptGlobalPromiseDot = { link = "Identifier" },
		typescriptGlobalURLDot = { link = "Identifier" },
		typescriptGlobalMethod = { link = "Function" },
		typescriptDOMStorageMethod = { link = "Function" },
		typescriptFileMethod = { link = "Function" },
		typescriptFileReaderMethod = { link = "Function" },
		typescriptFileListMethod = { link = "Function" },
		typescriptBlobMethod = { link = "Function" },
		typescriptURLStaticMethod = { link = "Function" },
		typescriptNumberStaticMethod = { link = "Function" },
		typescriptNumberMethod = { link = "Function" },
		typescriptDOMNodeMethod = { link = "Function" },
		typescriptPaymentMethod = { link = "Function" },
		typescriptPaymentResponseMethod = { link = "Function" },
		typescriptHeadersMethod = { link = "Function" },
		typescriptRequestMethod = { link = "Function" },
		typescriptResponseMethod = { link = "Function" },
		typescriptES6SetMethod = { link = "Function" },
		typescriptReflectMethod = { link = "Function" },
		typescriptBOMWindowMethod = { link = "Function" },
		typescriptGeolocationMethod = { link = "Function" },
		typescriptServiceWorkerMethod = { link = "Function" },
		typescriptCacheMethod = { link = "Function" },
		typescriptES6MapMethod = { link = "Function" },
		typescriptFunctionMethod = { link = "Function" },
		typescriptRegExpMethod = { link = "Function" },
		typescriptXHRMethod = { link = "Function" },
		typescriptBOMNavigatorMethod = { link = "Function" },
		typescriptIntlMethod = { link = "Function" },
		typescriptDOMEventTargetMethod = { link = "Function" },
		typescriptDOMEventMethod = { link = "Function" },
		typescriptDOMDocMethod = { link = "Function" },
		typescriptStringStaticMethod = { link = "String" },
		typescriptStringMethod = { link = "String" },
		typescriptSymbolStaticMethod = { link = "Function" },
		typescriptObjectStaticMethod = { link = "Function" },
		typescriptObjectMethod = { link = "Function" },
		typescriptJSONStaticMethod = { link = "Function" },
		typescriptEncodingMethod = { link = "Function" },
		typescriptBOMLocationMethod = { link = "Function" },
		typescriptPromiseStaticMethod = { link = "Function" },
		typescriptPromiseMethod = { link = "Function" },
		typescriptSubtleCryptoMethod = { link = "Function" },
		typescriptCryptoMethod = { link = "Function" },
		typescriptBOMHistoryMethod = { link = "Function" },
		typescriptDOMFormMethod = { link = "Function" },
		typescriptConsoleMethod = { link = "Function" },
		typescriptDateStaticMethod = { link = "Function" },
		typescriptDateMethod = { link = "Function" },
		typescriptArrayStaticMethod = { link = "Function" },
		typescriptArrayMethod = { link = "Function" },
		typescriptMathStaticMethod = { link = "Function" },
		typescriptStringProperty = { link = "PreProc" },
		typescriptDOMStorageProp = { link = "PreProc" },
		typescriptFileReaderProp = { link = "PreProc" },
		typescriptURLUtilsProp = { link = "PreProc" },
		typescriptNumberStaticProp = { link = "PreProc" },
		typescriptDOMNodeProp = { link = "PreProc" },
		typescriptBOMWindowProp = { link = "PreProc" },
		typescriptRequestProp = { link = "PreProc" },
		typescriptResponseProp = { link = "PreProc" },
		typescriptPaymentProp = { link = "PreProc" },
		typescriptPaymentResponseProp = { link = "PreProc" },
		typescriptPaymentAddressProp = { link = "PreProc" },
		typescriptPaymentShippingOptionProp = { link = "PreProc" },
		typescriptES6SetProp = { link = "PreProc" },
		typescriptServiceWorkerProp = { link = "PreProc" },
		typescriptES6MapProp = { link = "PreProc" },
		typescriptRegExpStaticProp = { link = "PreProc" },
		typescriptRegExpProp = { link = "PreProc" },
		typescriptBOMNavigatorProp = { link = "Function" },
		typescriptXHRProp = { link = "PreProc" },
		typescriptDOMEventProp = { link = "PreProc" },
		typescriptDOMDocProp = { link = "PreProc" },
		typescriptBOMNetworkProp = { link = "PreProc" },
		typescriptSymbolStaticProp = { link = "PreProc" },
		typescriptEncodingProp = { link = "PreProc" },
		typescriptBOMLocationProp = { link = "PreProc" },
		typescriptCryptoProp = { link = "PreProc" },
		typescriptDOMFormProp = { link = "PreProc" },
		typescriptBOMHistoryProp = { link = "PreProc" },
		typescriptMathStaticProp = { link = "PreProc" },
		--: }}}
	}
end
--: }}}
--: Dart {{{
function M.dart()
	return {
		--: dart-lang: https://github.com/dart-lang/dart-vim-plugin {{{
		dartCoreClasses = { link = "Type" },
		dartTypeName = { link = "Type" },
		dartInterpolation = { link = "Special" },
		dartTypeDef = { link = "Typedef" },
		dartClassDecl = { link = "Define" },
		dartLibrary = { link = "PreProc" },
		dartMetadata = { link = "Identifier" },
		--: }}}
	}
end
--: }}}
--: C/C++ {{{
function M.c_cpp()
	return {
		--: vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight {{{
		cLabel = { link = "Label" },
		cppSTLnamespace = { link = "Include" },
		cppSTLtype = { link = "Type" },
		cppAccess = { link = "Function" },
		cppStructure = { link = "Structure" },
		cppSTLios = { link = "Type" },
		cppSTLiterator = { link = "Type" },
		cppSTLexception = { link = "Exception" },
		--: }}}
		--: vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern {{{
		cppSTLVariable = { link = "Variable" },
		--: }}}
		--: chromatica: https://github.com/arakashic/chromatica.nvim {{{
		Member = { link = "Type" },
		Namespace = { link = "Include" },
		EnumConstant = { link = "Constant" },
		chromaticaException = { link = "Exception" },
		chromaticaCast = { link = "Function" },
		OperatorOverload = { link = "Error" },
		AccessQual = { link = "Function" },
		Linkage = { link = "Operator" },
		AutoType = { link = "Type" },
		--: }}}
		--: vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight {{{
		LspCxxHlSkippedRegion = { link = "Special" },
		LspCxxHlSkippedRegionBeginEnd = { link = "Delimiter" },
		LspCxxHlGroupEnumConstant = { link = "Constant" },
		LspCxxHlGroupNamespace = { link = "Include" },
		LspCxxHlGroupMemberVariable = { link = "Variable" },
		--: }}}
	}
end
--: }}}
--: ObjectiveC {{{
function M.objectivec()
	return {
		--: builtin {{{
		objcModuleImport = { link = "Include" },
		objcException = { link = "Exception" },
		objcProtocolList = { link = "Statement" },
		objcDirective = { link = "PreProc" },
		objcPropertyAttribute = { link = "Type" },
		objcHiddenArgument = { link = "Identifier" },
		--: }}}
	}
end
--: }}}
--: C# {{{
function M.c_sharp()
	return {
		--: builtin: https://github.com/nickspoons/vim-cs {{{
		csUnspecifiedStatement = { link = "Statement" },
		csStorage = { link = "StorageClass" },
		csClass = { link = "Type" },
		csNewType = { link = "Type" },
		csContextualStatement = { link = "Statement" },
		csInterpolationDelimiter = { link = "Special" },
		csInterpolation = { link = "Special" },
		csEndColon = { link = "Delimiter" },
		--: }}}
	}
end
--: }}}
--: Python {{{
function M.python()
	return {
		--: builtin {{{
		pythonBuiltin = { link = "Special" },
		pythonExceptions = { link = "Exception" },
		pythonDecoratorName = { link = "Identifier" },
		--: }}}
		--: python-syntax: https://github.com/vim-python/python-syntax {{{
		pythonExClass = { link = "Include" },
		pythonBuiltinType = { link = "Type" },
		pythonBuiltinObj = { link = "Identifier" },
		pythonDottedName = { link = "Identifier" },
		pythonBuiltinFunc = { link = "Function" },
		pythonFunction = { link = "Function" },
		pythonDecorator = { link = "Identifier" },
		pythonInclude = { link = "Inclue" },
		pythonImport = { link = "PreProc" },
		pythonOperator = { link = "Operator" },
		pythonConditional = { link = "Conditional" },
		pythonRepeat = { link = "Repeat" },
		pythonException = { link = "Exception" },
		pythonNone = { link = "Constant" },
		pythonCoding = { link = "Normal" },
		pythonDot = { link = "Identifier" },
		--: }}}
		--: semshi: https://github.com/numirias/semshi {{{
		semshiUnresolved = { link = "Identifier" },
		semshiImported = { link = "Include" },
		semshiParameter = { link = "Identifier" },
		semshiParameterUnused = { link = "Error" },
		semshiSelf = { link = "Statement" },
		semshiGlobal = { link = "Type" },
		semshiBuiltin = { link = "Special" },
		semshiAttribute = { link = "Type" },
		semshiLocal = { link = "Statement" },
		semshiFree = { link = "Statement" },
		semshiSelected = { link = "CocHighlightText" },
		semshiErrorSign = { link = "Error" },
		semshiErrorChar = { link = "Error" },
		--: }}}
	}
end
--: }}}
--: Lua {{{
function M.lua()
	return {
		--: builtin {{{
		luaFunc = { link = "Function" },
		luaFunction = { link = "Function" },
		luaTable = { link = "Special" },
		luaIn = { link = "Include" },
		--: }}}
		--: vim-lua: https://github.com/tbastos/vim-lua {{{
		luaFuncCall = { link = "Function" },
		luaLocal = { link = "Statement" },
		luaSpecialValue = { link = "Special" },
		luaBraces = { link = "SpecialChar" },
		luaBuiltIn = { link = "Special" },
		luaNoise = { link = "Normal" },
		luaLabel = { link = "Label" },
		luaFuncTable = { link = "Special" },
		luaFuncArgName = { link = "Identifier" },
		luaEllipsis = { link = "Keyword" },
		luaDocTag = { link = "Tag" },
		--: }}}
	}
end
--: }}}
--: Java {{{
function M.java()
	return {
		--: builtin {{{
		javaClassDecl = { link = "Define" },
		javaMethodDecl = { link = "Define" },
		javaVarArg = { link = "Identifier" },
		javaAnnotation = { link = "String" },
		javaUserLabel = { link = "Label" },
		javaTypedef = { link = "Typedef" },
		javaParen = { link = "SpecialChar" },
		javaParen1 = { link = "SpecialChar" },
		javaParen2 = { link = "SpecialChar" },
		javaParen3 = { link = "SpecialChar" },
		javaParen4 = { link = "SpecialChar" },
		javaParen5 = { link = "SpecialChar" },
		--: }}}
	}
end
--: }}}
--: Kotlin {{{
function M.kotlin()
	return {
		--: kotlin-vim: https://github.com/udalov/kotlin-vim {{{
		ktSimpleInterpolation = { link = "Special" },
		ktComplexInterpolation = { link = "Special" },
		ktComplexInterpolationBrace = { link = "SpecialChar" },
		ktStructure = { link = "Structure" },
		ktKeyword = { link = "Keyword" },
		--: }}}
	}
end
--: }}}
--: Scala {{{
function M.scala()
	return {
		--: builtin: https://github.com/derekwyatt/vim-scala {{{
		scalaNameDefinition = { link = "Define" },
		scalaInterpolationBoundary = { link = "Special" },
		scalaInterpolation = { link = "Special" },
		scalaTypeOperator = { link = "Operator" },
		scalaOperator = { link = "Operator" },
		scalaKeywordModifier = { link = "Keyword" },
		--: }}}
	}
end
--: }}}
--: Go {{{
function M.go()
	return {
		--: builtin: https://github.com/google/vim-ft-go {{{
		goDirective = { link = "PreProc" },
		goConstants = { link = "Constant" },
		goDeclType = { link = "Type" },
		--: }}}
		--: polyglot {{{
		goPackage = { link = "String" },
		goImport = { link = "Include" },
		goBuiltins = { link = "Identifier" },
		goPredefinedIdentifiers = { link = "Identifier" },
		goVar = { link = "Variable" },
		--: }}}
	}
end
--: }}}
--: Rust {{{
function M.rust()
	return {
		--: builtin: https://github.com/rust-lang/rust.vim {{{
		rustStructure = { link = "Structure" },
		rustIdentifier = { link = "Identifier" },
		rustModPath = { link = "Directory" },
		rustModPathSep = { link = "Delimiter" },
		rustSelf = { link = "Identifier" },
		rustSuper = { link = "Identifier" },
		rustDeriveTrait = { link = "SpecialChar" },
		rustEnumVariant = { link = "Constant" },
		rustMacroVariable = { link = "Macro" },
		rustAssert = { link = "Function" },
		rustPanic = { link = "Error" },
		rustPubScopeCrate = { link = "PreProc" },
		rustAttribute = { link = "Type" },
		--: }}}
	}
end
--: }}}
--: Swift {{{
function M.swift()
	return {
		--: swift.vim: https://github.com/keith/swift.vim {{{
		swiftInterpolatedWrapper = { link = "Special" },
		swiftInterpolatedString = { link = "String" },
		swiftProperty = { link = "PreProc" },
		swiftTypeDeclaration = { link = "Type" },
		swiftClosureArgument = { link = "Identifier" },
		swiftStructure = { link = "Structure" },
		--: }}}
	}
end
--: }}}
--: PHP {{{
function M.php()
	return {
		--: builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD {{{
		phpVarSelector = { link = "Define" },
		phpIdentifier = { link = "Identifier" },
		phpDefine = { link = "Define" },
		phpStructure = { link = "Structure" },
		phpSpecialFunction = { link = "Function" },
		phpInterpSimpleCurly = { link = "Special" },
		phpComparison = { link = "Conditional" },
		phpMethodsVar = { link = "Variable" },
		phpInterpVarname = { link = "Special" },
		phpMemberSelector = { link = "Identifier" },
		phpLabel = { link = "Label" },
		--: }}}
		--: php.vim: https://github.com/StanAngeloff/php.vim {{{
		phpParent = { link = "Directory" },
		phpNowDoc = { link = "String" },
		phpFunction = { link = "Function" },
		phpMethod = { link = "Function" },
		phpClass = { link = "Type" },
		phpSuperglobals = { link = "Type" },
		phpNullValue = { link = "Constant" },
		--: }}}
	}
end
--: }}}
--: Ruby {{{
function M.ruby()
	return {
		--: builtin: https://github.com/vim-ruby/vim-ruby {{{
		rubyKeywordAsMethod = { link = "Keyword" },
		rubyInterpolation = { link = "Special" },
		rubyInterpolationDelimiter = { link = "Special" },
		rubyStringDelimiter = { link = "Delimiter" },
		rubyBlockParameterList = { link = "Statement" },
		rubyDefine = { link = "Define" },
		rubyModuleName = { link = "String" },
		rubyAccess = { link = "Exception" },
		rubyMacro = { link = "Macro" },
		rubySymbol = { link = "Variable" },
		--: }}}
	}
end
--: }}}
--: Haskell {{{
function M.haskell()
	return {
		--: haskell-vim: https://github.com/neovimhaskell/haskell-vim {{{
		haskellBrackets = { link = "SpecialChar" },
		haskellIdentifier = { link = "Identifier" },
		haskellDecl = { link = "Define" },
		haskellType = { link = "Type" },
		haskellDeclKeyword = { link = "Keyword" },
		haskellWhere = { link = "Conditional" },
		haskellDeriving = { link = "Conditional" },
		haskellForeignKeywords = { link = "Keyword" },
		--: }}}
	}
end
--: }}}
--: Perl {{{
function M.perl()
	return {
		--: builtin: https://github.com/vim-perl/vim-perl {{{
		perlStatementPackage = { link = "Include" },
		perlStatementInclude = { link = "Include" },
		perlStatementStorage = { link = "StorageClass" },
		perlStatementList = { link = "Statement" },
		perlMatchStartEnd = { link = "Delimiter" },
		perlVarSimpleMemberName = { link = "Identifier" },
		perlVarSimpleMember = { link = "Identifier" },
		perlMethod = { link = "Function" },
		podVerbatimLine = { link = "Function" },
		podCmdText = { link = "String" },
		perlVarPlain = { link = "Variable" },
		perlVarPlain2 = { link = "Variable" },
		--: }}}
	}
end
--: }}}
--: OCaml {{{
function M.ocaml()
	return {
		--: builtin: https://github.com/rgrinberg/vim-ocaml {{{
		ocamlArrow = { link = "Function" },
		ocamlEqual = { link = "Statement" },
		ocamlOperator = { link = "Operator" },
		ocamlKeyChar = { link = "Keyword" },
		ocamlModPath = { link = "Directory" },
		ocamlFullMod = { link = "Include" },
		ocamlModule = { link = "String" },
		ocamlConstructor = { link = "Special" },
		ocamlModParam = { link = "Identifier" },
		ocamlModParam1 = { link = "Identifier" },
		ocamlAnyVar = { link = "Variable" },
		ocamlPpxEncl = { link = "Function" },
		ocamlPpxIdentifier = { link = "Identifier" },
		ocamlSigEncl = { link = "Function" },
		--: }}}
	}
end
--: }}}
--: Erlang {{{
function M.erlang()
	return {
		--: builtin: https://github.com/vim-erlang/vim-erlang-runtime {{{
		erlangAtom = { link = "Special" },
		erlangVariable = { link = "Variable" },
		erlangLocalFuncRef = { link = "Function" },
		erlangLocalFuncCall = { link = "Function" },
		erlangGlobalFuncRef = { link = "Function" },
		erlangGlobalFuncCall = { link = "Function" },
		erlangAttribute = { link = "Type" },
		erlangPipe = { link = "Operator" },
		--: }}}
	}
end
--: }}}
--: Elixir {{{
function M.elixir()
	return {
		--: vim-elixir: https://github.com/elixir-editors/vim-elixir {{{
		elixirStringDelimiter = { link = "Delimiter" },
		elixirKeyword = { link = "Keyword" },
		elixirInterpolation = { link = "Special" },
		elixirInterpolationDelimiter = { link = "Special" },
		elixirSelf = { link = "Statement" },
		elixirPseudoVariable = { link = "Identifier" },
		elixirModuleDefine = { link = "Define" },
		elixirBlockDefinition = { link = "Define" },
		elixirDefine = { link = "Define" },
		elixirPrivateDefine = { link = "Define" },
		elixirGuard = { link = "Define" },
		elixirPrivateGuard = { link = "Define" },
		elixirProtocolDefine = { link = "Define" },
		elixirImplDefine = { link = "Define" },
		elixirRecordDefine = { link = "Define" },
		elixirPrivateRecordDefine = { link = "Define" },
		elixirMacroDefine = { link = "Define" },
		elixirPrivateMacroDefine = { link = "Define" },
		elixirDelegateDefine = { link = "Define" },
		elixirOverridableDefine = { link = "Define" },
		elixirExceptionDefine = { link = "Define" },
		elixirCallbackDefine = { link = "Define" },
		elixirStructDefine = { link = "Define" },
		elixirExUnitMacro = { link = "Macro" },
		--: }}}
	}
end
--: }}}
--: Common Lisp {{{
function M.common_lisp()
	return {
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP {{{
		lispAtomMark = { link = "Special" },
		lispKey = { link = "Function" },
		lispFunc = { link = "Function" },
		--: }}}
	}
end
--: }}}
--: Clojure {{{
function M.clojure()
	return {
		--: builtin: https://github.com/guns/vim-clojure-static {{{
		clojureMacro = { link = "Macro" },
		clojureFunc = { link = "Function" },
		clojureConstant = { link = "Constant" },
		clojureSpecial = { link = "Special" },
		clojureDefine = { link = "Define" },
		clojureKeyword = { link = "Keyword" },
		clojureVariable = { link = "Variable" },
		clojureMeta = { link = "Special" },
		clojureDeref = { link = "Special" },
		--: }}}
	}
end
--: }}}
--: Matlab {{{
function M.matlab()
	return {
		--: builtin {{{
		matlabSemicolon = { link = "Delimiter" },
		matlabFunction = { link = "Function" },
		matlabImplicit = { link = "Statement" },
		matlabDelimiter = { link = "Delimiter" },
		matlabOperator = { link = "Operator" },
		matlabArithmeticOperator = { link = "Operator" },
		matlabRelationalOperator = { link = "Operator" },
		matlabLogicalOperator = { link = "Operator" },
		--: }}}
	}
end
--: }}}
--: Shell {{{
function M.shell()
	return {
		--: builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH {{{
		shRange = { fg = C.foreground },
		shOption = { link = "Special" },
		shQuote = { link = "String" },
		shVariable = { link = "Variable" },
		shDerefSimple = { link = "Variable" },
		shDerefVar = { link = "Variable" },
		shDerefSpecial = { link = "Special" },
		shDerefOff = { link = "Type" },
		shVarAssign = { link = "Statement" },
		shFunctionOne = { link = "Function" },
		shFunctionKey = { link = "Identifier" },
		--: }}}
	}
end
--: }}}
--: Zsh {{{
function M.zsh()
	return {
		--: builtin: https://github.com/chrisbra/vim-zsh {{{
		zshOption = { link = "Statement" },
		zshSubst = { link = "Variable" },
		zshFunction = { link = "Function" },
		zshOperator = { link = "Operator" },
		--: }}}
	}
end
--: }}}
--: PowerShell {{{
function M.powershell()
	return {
		--: vim-ps1: https://github.com/PProvost/vim-ps1 {{{
		ps1FunctionInvocation = { link = "Function" },
		ps1FunctionDeclaration = { link = "Function" },
		ps1InterpolationDelimiter = { link = "Special" },
		ps1BuiltIn = { link = "Type" },
		--: }}}
	}
end
--: }}}
--: VimL {{{
function M.viml()
	return {
		vimLet = { link = "Define" },
		vimFunction = { link = "Function" },
		vimIsCommand = { link = "Conditional" },
		vimUserFunc = { link = "Function" },
		vimFuncName = { link = "Function" },
		vimMap = { link = "Define" },
		vimNotation = { link = "Identifier" },
		vimMapLhs = { link = "Identifier" },
		vimMapRhs = { link = "Identifier" },
		vimSetEqual = { link = "Identifier" },
		vimSetSep = { link = "SpecialChar" },
		vimOption = { link = "Variable" },
		vimUserAttrbKey = { link = "Type" },
		vimUserAttrb = { link = "Identifier" },
		vimAutoCmdSfxList = { link = "Special" },
		vimSynType = { link = "Type" },
		vimHiBang = { link = "Identifier" },
		vimSet = { link = "Statement" },
	}
end
--: }}}
--: Makefile {{{
function M.makefile()
	return {
		makeIdent = { link = "Variable" },
		makeSpecTarget = { link = "Special" },
		makeTarget = { link = "Function" },
		makeCommands = { link = "Identifier" },
	}
end
--: }}}
--: CMake {{{
function M.cmake()
	return {
		cmakeCommand = { link = "Function" },
		cmakeKWconfigure_package_config_file = { link = "Type" },
		cmakeKWwrite_basic_package_version_file = { link = "Type" },
		cmakeKWExternalProject = { link = "Function" },
		cmakeKWadd_compile_definitions = { link = "Function" },
		cmakeKWadd_compile_options = { link = "Function" },
		cmakeKWadd_custom_command = { link = "Function" },
		cmakeKWadd_custom_target = { link = "Function" },
		cmakeKWadd_definitions = { link = "Function" },
		cmakeKWadd_dependencies = { link = "Function" },
		cmakeKWadd_executable = { link = "Function" },
		cmakeKWadd_library = { link = "Function" },
		cmakeKWadd_link_options = { link = "Function" },
		cmakeKWadd_subdirectory = { link = "Directory" },
		cmakeKWadd_test = { link = "Function" },
		cmakeKWbuild_command = { link = "Function" },
		cmakeKWcmake_host_system_information = { link = "Function" },
		cmakeKWcmake_minimum_required = { link = "Function" },
		cmakeKWcmake_parse_arguments = { link = "Function" },
		cmakeKWcmake_policy = { link = "Function" },
		cmakeKWconfigure_file = { link = "Function" },
		cmakeKWcreate_test_sourcelist = { link = "Function" },
		cmakeKWctest_build = { link = "Function" },
		cmakeKWctest_configure = { link = "Function" },
		cmakeKWctest_coverage = { link = "Function" },
		cmakeKWctest_memcheck = { link = "Function" },
		cmakeKWctest_run_script = { link = "Function" },
		cmakeKWctest_start = { link = "Function" },
		cmakeKWctest_submit = { link = "Function" },
		cmakeKWctest_test = { link = "Function" },
		cmakeKWctest_update = { link = "Function" },
		cmakeKWctest_upload = { link = "Function" },
		cmakeKWdefine_property = { link = "Function" },
		cmakeKWdoxygen_add_docs = { link = "Function" },
		cmakeKWenable_language = { link = "Function" },
		cmakeKWenable_testing = { link = "Function" },
		cmakeKWexec_program = { link = "Function" },
		cmakeKWexecute_process = { link = "Function" },
		cmakeKWexport = { link = "Function" },
		cmakeKWexport_library_dependencies = { link = "Function" },
		cmakeKWfile = { link = "Function" },
		cmakeKWfind_file = { link = "Function" },
		cmakeKWfind_library = { link = "Function" },
		cmakeKWfind_package = { link = "Function" },
		cmakeKWfind_path = { link = "Function" },
		cmakeKWfind_program = { link = "Function" },
		cmakeKWfltk_wrap_ui = { link = "Function" },
		cmakeKWforeach = { link = "Function" },
		cmakeKWfunction = { link = "Function" },
		cmakeKWget_cmake_property = { link = "Function" },
		cmakeKWget_directory_property = { link = "Directory" },
		cmakeKWget_filename_component = { link = "Function" },
		cmakeKWget_property = { link = "Function" },
		cmakeKWget_source_file_property = { link = "Function" },
		cmakeKWget_target_property = { link = "Function" },
		cmakeKWget_test_property = { link = "Function" },
		cmakeKWif = { link = "Function" },
		cmakeKWinclude = { link = "Function" },
		cmakeKWinclude_directories = { link = "Directory" },
		cmakeKWinclude_external_msproject = { link = "Function" },
		cmakeKWinclude_guard = { link = "Function" },
		cmakeKWinstall = { link = "Function" },
		cmakeKWinstall_files = { link = "Function" },
		cmakeKWinstall_programs = { link = "Function" },
		cmakeKWinstall_targets = { link = "Function" },
		cmakeKWlink_directories = { link = "Directory" },
		cmakeKWlist = { link = "Function" },
		cmakeKWload_cache = { link = "Function" },
		cmakeKWload_command = { link = "Function" },
		cmakeKWmacro = { link = "Macro" },
		cmakeKWmark_as_advanced = { link = "Function" },
		cmakeKWmath = { link = "Function" },
		cmakeKWmessage = { link = "Function" },
		cmakeKWoption = { link = "Function" },
		cmakeKWproject = { link = "Function" },
		cmakeKWqt_wrap_cpp = { link = "Function" },
		cmakeKWqt_wrap_ui = { link = "Function" },
		cmakeKWremove = { link = "Function" },
		cmakeKWseparate_arguments = { link = "Function" },
		cmakeKWset = { link = "Function" },
		cmakeKWset_directory_properties = { link = "Directory" },
		cmakeKWset_property = { link = "Function" },
		cmakeKWset_source_files_properties = { link = "Function" },
		cmakeKWset_target_properties = { link = "Function" },
		cmakeKWset_tests_properties = { link = "Function" },
		cmakeKWsource_group = { link = "Function" },
		cmakeKWstring = { link = "Function" },
		cmakeKWsubdirs = { link = "Function" },
		cmakeKWtarget_compile_definitions = { link = "Function" },
		cmakeKWtarget_compile_features = { link = "Function" },
		cmakeKWtarget_compile_options = { link = "Function" },
		cmakeKWtarget_include_directories = { link = "Directory" },
		cmakeKWtarget_link_directories = { link = "Directory" },
		cmakeKWtarget_link_libraries = { link = "Function" },
		cmakeKWtarget_link_options = { link = "Function" },
		cmakeKWtarget_precompile_headers = { link = "Function" },
		cmakeKWtarget_sources = { link = "Function" },
		cmakeKWtry_compile = { link = "Function" },
		cmakeKWtry_run = { link = "Function" },
		cmakeKWunset = { link = "Function" },
		cmakeKWuse_mangled_mesa = { link = "Function" },
		cmakeKWvariable_requires = { link = "Function" },
		cmakeKWvariable_watch = { link = "Function" },
		cmakeKWwrite_file = { link = "Function" },
	}
end
--: }}}
--: Json {{{
function M.json()
	return {
		jsonKeyword = { link = "Function" },
		jsonString = { link = "String" },
		jsonBoolean = { link = "Boolean" },
		jsonNoise = { link = "Normal" },
		jsonQuote = { link = "String" },
		jsonBraces = { link = "SpecialChar" },
	}
end
--: }}}
--: Yaml {{{
function M.yaml()
	return {
		yamlKey = { link = "Function" },
		yamlConstant = { link = "Constant" },
		yamlString = { link = "String" },
	}
end
--: }}}
--: Toml {{{
function M.toml()
	return {
		tomlTable = { link = "Special" },
		tomlKey = { link = "Function" },
		tomlBoolean = { link = "Boolean" },
		tomlString = { link = "String" },
		tomlTableArray = { link = "tomlTable" },
	}
end
--: }}}
--: Diff {{{
function M.diff()
	return {
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },
		diffChanged = { link = "DiffChange" },
		diffOldFile = { link = "Debug" },
		diffNewFile = { link = "Identifier" },
		diffFile = { link = "Directory" },
		diffLine = { link = "Comment" },
		diffIndexLine = { link = "Special" },
	}
end
--: }}}
--: Git Commit {{{
function M.git_commit()
	return {
		gitcommitSummary = { fg = C.color1 },
		gitcommitUntracked = { fg = C.color8 },
		gitcommitDiscarded = { fg = C.color8 },
		gitcommitSelected = { fg = C.color8 },
		gitcommitUnmerged = { fg = C.color8 },
		gitcommitOnBranch = { fg = C.color8 },
		gitcommitArrow = { fg = C.color8 },
		gitcommitFile = { fg = C.color2 },
	}
end
--: }}}
--: INI {{{
function M.ini()
	return {
		dosiniHeader = { link = "Function" },
		dosiniLabel = { link = "Label" },
		dosiniValue = { link = "Float" },
		dosiniNumber = { link = "Number" },
	}
end
--: }}}
--: Help {{{
function M.help()
	return {
		helpNote = { link = "String" },
		helpHeadline = { link = "Statement" },
		helpHeader = { link = "Statement" },
		helpURL = { link = "URLlink" },
		helpHyperTextEntry = { link = "URLlink" },
		helpHyperTextJump = { link = "Directory" },
		helpCommand = { link = "Function" },
		helpExample = { link = "Identifier" },
		helpSpecial = { link = "Special" },
		helpSectionDelim = { link = "Delimiter" },
	}
end
--: }}}

return M
