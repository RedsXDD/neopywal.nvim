-- vim:fileencoding=utf-8:foldmethod=marker

local M = {}
local U = require("neopywal.util")

M.get = function(colors)
	-- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
	return {
			--: Misc {{{
			["@error"] = { link = "Error" },
			["@annotation"] = { link = "PreProc" },
			["@none"] = {},
			--: }}}
			--: Identifiers {{{
			["@variable"] = { link = "Variable" }, -- Any variable name that does not have another highlight.
			["@variable.builtin"] = { fg = colors.color1 }, -- Variable names that are defined by the languages, like this or self.
			["@variable.member"] = { fg = colors.color2 }, -- For fields.
			["@variable.parameter"] = { link = "Identifier" }, -- For parameters of a function.
			["@variable.parameter.builtin"] = { link = "@variable.parameter" }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
			["@constant"] = { link = "Constant" }, -- For constants
			["@constant.builtin"] = { link = "Special" }, -- For constant that are built in the language: nil in Lua.
			["@constant.macro"] = { link = "Macro" }, -- For constants that are defined by macros: NULL in C.
			["@module"] = { link = "Include" }, -- For identifiers referring to modules and namespaces.
			["@module.builtin"] = { fg = colors.color1 }, -- Variable names that are defined by the languages, like `this` or `self`.
			["@label"] = { link = "Label" }, -- For labels: label: in C and :label: in Lua.
			--: }}}
			--: Literals {{{
			["@string"] = { link = "String" }, -- For strings.
			["@string.documentation"] = { fg = colors.color11 }, -- For strings documenting code (e.g. Python docstrings).
			["@string.regexp"] = { fg = colors.color6 }, -- For regexes.
			["@string.escape"] = { fg = colors.color5 }, -- For escape characters within a string.
			["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
			["@string.special.path"] = { link = "Special" }, -- filenames
			["@string.special.symbol"] = { fg = colors.color4 }, -- symbols or atoms
			["@string.special.url"] = { fg = colors.color4, italic = true, underline = true }, -- urls, links and emails
			["@character"] = { link = "Character" }, -- character literals
			["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)
			["@boolean"] = { link = "Boolean" }, -- For booleans.
			["@number"] = { link = "Number" }, -- For all numbers
			["@number.float"] = { link = "Float" }, -- For floats.
			--: }}}
			--: Types {{{
			["@type"] = { link = "Type" }, -- For types.
			["@type.builtin"] = { fg = colors.color4, italic = true }, -- For builtin types.
			["@type.definition"] = { link = "Typedef" },
			["@type.qualifier"] = { link = "@keyword.modifier" },
			["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
			["@property"] = { fg = colors.color2 }, -- Same as TSField.
			--: }}}
			--: Functions {{{
			["@function"] = { link = "Function" }, -- For function (calls and definitions).
			["@function.builtin"] = { link = "Special" }, -- For builtin functions: table.insert in Lua.
			["@function.call"] = { link = "Function" }, -- function calls
			["@function.macro"] = { link = "Macro" }, -- For macro defined functions (calls and definitions): each macro_rules in Rust.
			["@function.method"] = { link = "Function" }, -- For method definitions.
			["@function.method.call"] = { link = "Function" }, -- For method calls.
			["@constructor"] = { link = "Special" }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
			["@operator"] = { link = "Operator" }, -- For any operator: +, but also -> and * in C.
			--: }}}
			--: Keywords {{{
			["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
			["@keyword.modifier"] = { link = "Keyword" }, -- For keywords modifying other constructs (e.g. `const`, `static`, `public`)
			["@keyword.type"] = { link = "Keyword" }, -- For keywords describing composite types (e.g. `struct`, `enum`)
			["@keyword.coroutine"] = { link = "Keyword" }, -- For keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
			["@keyword.function"] = { link = "Function" }, -- For keywords used to define a function.
			["@keyword.operator"] = { link = "Operator" }, -- For new keyword operator
			["@keyword.import"] = { link = "Include" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
			["@keyword.repeat"] = { link = "Repeat" }, -- For keywords related to loops.
			["@keyword.return"] = { link = "Keyword" }, -- For returns.
			["@keyword.debug"] = { link = "Debug" }, -- For keywords related to debugging
			["@keyword.exception"] = { link = "Exception" }, -- For exception related keywords.
			["@keyword.conditional"] = { link = "Conditional" }, -- For keywords related to conditionnals.
			["@keyword.conditional.ternary"] = { link = "Operator" }, -- For ternary operators (e.g. `?` / `:`)
			["@keyword.directive"] = { link = "PreProc" }, -- various preprocessor directives & shebangs
			["@keyword.directive.define"] = { link = "Define" }, -- preprocessor definition directives
			["@keyword.storage"] = { link = "StorageClass" },
			--: }}}
			--: Punctuation {{{
			["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters (e.g. `;` / `.` / `,`).
			["@punctuation.bracket"] = { fg = colors.foreground }, -- For brackets and parenthesis.
			["@punctuation.special"] = { link = "SpecialChar" }, -- For special punctuation that does not fall in the categories before (e.g. `{}` in string interpolation).
			--: }}}
			--: Comment {{{
			["@comment"] = { link = "Comment" },
			["@comment.documentation"] = { link = "Comment" }, -- For comments documenting code
			["@comment.error"] = { link = "Err" },
			["@comment.warning"] = { link = "Warn" },
			["@comment.hint"] = { link = "Hint" },
			["@comment.todo"] = { link = "Todo" },
			["@comment.note"] = { link = "Note" },
			--: }}}
			--: Markup {{{
			["@markup"] = { fg = colors.foreground }, -- For strings considerated text in a markup language.
			["@markup.strong"] = { link = "Bold" }, -- bold text
			["@markup.italic"] = { link = "Italic" }, -- italic text
			["@markup.strikethrough"] = { link = "Strikethrough" }, -- strikethrough text
			["@markup.underline"] = { link = "Underlined" }, -- underlined text
			["@markup.heading"] = { link = "Title" }, -- titles like: # Example
			["@markup.math"] = { link = "Special" }, -- math environments (e.g. `$ ... $` in LaTeX)
			["@markup.quote"] = { fg = U.lighten(colors.color1, 20), bold = true }, -- block quotes
			["@markup.environment"] = { link = "Macro" }, -- text environments of markup languages
			["@markup.environment.name"] = { link = "Type" }, -- text indicating the type of an environment
			["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
			["@markup.link.url"] = { fg = colors.color4, italic = true, underline = true }, -- urls, links and emails
			["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
			["@markup.link.label.symbol"] = { link = "Identifier" },
			["@markup.raw"] = { link = "String" }, -- used for inline code in markdown and for doc in python (""")
			["@markup.list"] = { link = "Special" },
			["@markup.list.checked"] = { fg = colors.color2 }, -- todo notes
			["@markup.list.unchecked"] = { fg = colors.color4 }, -- todo notes
			--: }}}
			--: Diff {{{
			["@diff.plus"] = { link = "DiffAdd" }, -- added text (for diff files)
			["@diff.minus"] = { link = "DiffDelete" }, -- deleted text (for diff files)
			["@diff.delta"] = { link = "DiffChange" }, -- deleted text (for diff files)
			--: }}}
			--: Tags {{{
			["@tag"] = { link = "Label" }, -- Tags like html tag names.
			["@tag.attribute"] = { fg = colors.color6, italic = true }, -- Tags like html tag names.
			["@tag.delimiter"] = { fg = colors.color6 }, -- Tag delimiter like < > /
			--: }}}
			--: Language specific {{{
			--: Bash {{{
			["@function.builtin.bash"] = { italic = true },
			--: }}}
			--: JS & derivative {{{
			["@keyword.export"] = { fg = colors.color6 },
			--: }}}
			--: Markdown {{{
			["@markup.heading.1.markdown"] = { fg = colors.color1 },
			["@markup.heading.2.markdown"] = { fg = colors.color11 },
			["@markup.heading.3.markdown"] = { fg = colors.color3 },
			["@markup.heading.4.markdown"] = { fg = colors.color2 },
			["@markup.heading.5.markdown"] = { fg = colors.color4 },
			["@markup.heading.6.markdown"] = { fg = colors.color5 },
			--: }}}
			--: Java {{{
			["@constant.java"] = { fg = colors.color6 },
			--: }}}
			--: CSS {{{
			["@property.css"] = { fg = colors.color5 },
			["@property.id.css"] = { fg = colors.color4 },
			["@property.class.css"] = { fg = colors.color3 },
			["@type.css"] = { fg = colors.color5 },
			["@type.tag.css"] = { fg = colors.color5 },
			["@string.plain.css"] = { fg = colors.color11 },
			["@number.css"] = { fg = colors.color11 },
			--: }}}
			--: Toml {{{
			["@property.toml"] = { fg = colors.color4 }, -- Differentiates between string and properties
			--: }}}
			--: Json {{{
			["@label.json"] = { fg = colors.color4 }, -- For labels: label: in C and :label: in Lua.
			--: }}}
			--: Lua {{{
			["@constructor.lua"] = { fg = colors.color5 }, -- For constructor calls and definitions: = { } in Lua.
			--: }}}
			--: Typescript {{{
			["@property.typescript"] = { fg = colors.color5 },
			["@constructor.typescript"] = { fg = colors.color5 },
			--: }}}
			--: TSX (Typescript React) {{{
			["@constructor.tsx"] = { fg = colors.color5 },
			["@tag.attribute.tsx"] = { fg = colors.color6, italic = true },
			["@tag.tsx"] = { fg = colors.color1 },
			["@tag.delimiter.tsx"] = { fg = colors.color4 },
			--: }}}
			--: Yaml {{{
			["@variable.member.yaml"] = { fg = colors.color4 }, -- For fields.
			--: }}}
			--: Ruby {{{
			["@string.special.symbol.ruby"] = { fg = colors.color4 },
			--: }}}
			--: PHP {{{
			["@function.method.php"] = { link = "Function" },
			["@function.method.call.php"] = { link = "Function" },
			--: }}}
			--: C/CPP {{{
			["@type.builtin.c"] = { fg = colors.color3 },
			["@property.cpp"] = { fg = colors.foreground },
			["@type.builtin.cpp"] = { fg = colors.color3 },
			--: }}}
			--: Gitcommit {{{
			["@comment.warning.gitcommit"] = { fg = colors.color3 },
			--: }}}
			--: }}}
			--: LSP Semantic Token Groups {{{
			["@lsp.type.boolean"] = { link = "@boolean" },
			["@lsp.type.builtinType"] = { link = "@type.builtin" },
			["@lsp.type.comment"] = { link = "@comment" },
			["@lsp.type.decorator"] = { link = "@attribute" },
			["@lsp.type.deriveHelper"] = { link = "@attribute" },
			["@lsp.type.enum"] = { link = "@type" },
			["@lsp.type.enumMember"] = { link = "@constant" },
			["@lsp.type.escapeSequence"] = { link = "@string.escape" },
			["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
			["@lsp.type.generic"] = { link = "@variable" },
			["@lsp.type.interface"] = { fg = colors.color4 },
			["@lsp.type.keyword"] = { link = "@keyword" },
			["@lsp.type.lifetime"] = { link = "@keyword.storage" },
			["@lsp.type.namespace"] = { link = "@module" },
			["@lsp.type.number"] = { link = "@number" },
			["@lsp.type.operator"] = { link = "@operator" },
			["@lsp.type.parameter"] = { link = "@variable.parameter" },
			["@lsp.type.property"] = { link = "@property" },
			["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
			["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
			["@lsp.type.string"] = { link = "@string" },
			["@lsp.type.typeAlias"] = { link = "@type.definition" },
			["@lsp.type.unresolvedReference"] = { link = "Error", undercurl = true },
			["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
			["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
			["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
			["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
			["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
			["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
			["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
			["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
			["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
			["@lsp.typemod.operator.injected"] = { link = "@operator" },
			["@lsp.typemod.string.injected"] = { link = "@string" },
			["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
			["@lsp.typemod.type.defaultLibrary"] = { fg = colors.color4 },
			["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = colors.color4 },
			["@lsp.typemod.variable.callable"] = { link = "@function" },
			["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
			["@lsp.typemod.variable.injected"] = { link = "@variable" },
			["@lsp.typemod.variable.static"] = { link = "@constant" },
			-- NOTE: maybe add these with distinct highlights?
			-- ["@lsp.typemod.variable.globalScope"] (global variables)
			--: }}}
			--: Legacy highlights {{{
			["@parameter"] = { link = "@variable.parameter" },
			["@field"] = { link = "@variable.member" },
			["@namespace"] = { link = "@module" },
			["@namespace.builtin"] = { link = "@variable.builtin" },
			["@float"] = { link = "@number.float" },
			["@symbol"] = { link = "@string.special.symbol" },
			["@string.regex"] = { link = "@string.regexp" },

			["@text"] = { link = "@markup" },
			["@text.strong"] = { link = "@markup.strong" },
			["@text.emphasis"] = { link = "@markup.italic" },
			["@text.underline"] = { link = "@markup.underline" },
			["@text.strike"] = { link = "@markup.strikethrough" },
			["@text.uri"] = { link = "@markup.link.url" },
			["@text.math"] = { link = "@markup.math" },
			["@text.environment"] = { link = "@markup.environment" },
			["@text.environment.name"] = { link = "@markup.environment.name" },
			["@text.title"] = { link = "@markup.heading" },
			["@text.literal"] = { link = "@markup.raw" },
			["@text.reference"] = { link = "@markup.link" },
			["@text.todo.checked"] = { link = "@markup.list.checked" },
			["@text.todo.unchecked"] = { link = "@markup.list.unchecked" },

			-- @text.todo is now for todo comments, not todo notes like in markdown
			["@text.todo"] = { link = "@comment.todo" },
			["@text.warning"] = { link = "@comment.warning" },
			["@text.note"] = { link = "@comment.note" },
			["@text.danger"] = { link = "@comment.error" },

			["@method"] = { link = "@function.method" },
			["@method.call"] = { link = "@function.method.call" },

			["@text.diff.add"] = { link = "@diff.plus" },
			["@text.diff.delete"] = { link = "@diff.minus" },

			["@define"] = { link = "@keyword.directive.define" },
			["@preproc"] = { link = "@keyword.directive" },
			["@storageclass"] = { link = "@keyword.storage" },
			["@conditional"] = { link = "@keyword.conditional" },
			["@exception"] = { link = "@keyword.exception" },
			["@include"] = { link = "@keyword.import" },
			["@repeat"] = { link = "@keyword.repeat" },
			["@symbol.ruby"] = { link = "@string.special.symbol.ruby" },

			["@text.title.1.markdown"] = { link = "@markup.heading.1.markdown" },
			["@text.title.2.markdown"] = { link = "@markup.heading.2.markdown" },
			["@text.title.3.markdown"] = { link = "@markup.heading.3.markdown" },
			["@text.title.4.markdown"] = { link = "@markup.heading.4.markdown" },
			["@text.title.5.markdown"] = { link = "@markup.heading.5.markdown" },
			["@text.title.6.markdown"] = { link = "@markup.heading.6.markdown" },

			["@method.php"] = { link = "@function.method.php" },
			["@method.call.php"] = { link = "@function.method.call.php" },
			--: }}}
		}
end

return M
