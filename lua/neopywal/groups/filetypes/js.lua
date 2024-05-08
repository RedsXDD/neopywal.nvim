local M = {}

M.get = function(colors)
	return {
		-- JavaScript:
		-- builtin: http://www.fleiner.com/vim/syntax/javascript.vim
		javaScriptNull       = { fg = colors.color11, italic = true },
		javaScriptIdentifier = { fg = colors.color4, italic = true },
		javaScriptParens     = { fg = colors.foreground },
		javaScriptBraces     = { fg = colors.foreground },
		javaScriptNumber     = { fg = colors.color5 },
		javaScriptLabel      = { fg = colors.color1 },
		javaScriptGlobal     = { fg = colors.color4, italic = true },
		javaScriptMessage    = { fg = colors.color4, italic = true },

		-- vim-javascript: https://github.com/pangloss/vim-javascript
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

		-- yajs: https://github.com/othree/yajs.vim
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
	}
end

return M
