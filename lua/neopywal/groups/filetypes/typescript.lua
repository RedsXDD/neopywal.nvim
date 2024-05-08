local M = {}

M.get = function(colors)
	return {
		-- TypeScript:
		-- vim-typescript: https://github.com/leafgarland/typescript-vim
		typescriptStorageClass           = { fg = colors.color1 },
		typescriptEndColons              = { fg = colors.foreground },
		typescriptSource                 = { fg = colors.color4, italic = true },
		typescriptMessage                = { fg = colors.color2 },
		typescriptGlobalObjects          = { fg = colors.color4, italic = true },
		typescriptInterpolation          = { fg = colors.color5 },
		typescriptInterpolationDelimiter = { fg = colors.color5 },
		typescriptBraces                 = { fg = colors.foreground },
		typescriptParens                 = { fg = colors.foreground },

		-- yats: https:github.com/HerringtonDarkholme/yats.vim
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
	}
end

return M
