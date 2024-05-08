local M = {}

M.get = function(colors)
	return {
		-- nvim-treesitter/nvim-treesitter
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
	}
end

return M
