-- vim:fileencoding=utf-8:foldmethod=marker

local M = {}

function M.get()
    -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
    return {
        --: Misc {{{
        ["@error"] = { link = "Error" },
        ["@annotation"] = { link = "PreProc" },
        ["@none"] = {},
        --: }}}
        --: Identifiers {{{
        ["@variable"] = { link = "Variable" }, -- Any variable name that does not have another highlight.
        ["@variable.builtin"] = { link = "Statement" }, -- Variable names that are defined by the languages, like this or self.
        ["@variable.member"] = { fg = C.color2 }, -- For fields.
        ["@variable.parameter"] = { link = "Identifier" }, -- For parameters of a function.
        ["@variable.parameter.builtin"] = { link = "@variable.parameter" }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
        ["@constant"] = { link = "Constant" }, -- For constants
        ["@constant.builtin"] = { link = "Special" }, -- For constant that are built in the language: nil in Lua.
        ["@constant.macro"] = { link = "Macro" }, -- For constants that are defined by macros: NULL in C.
        ["@module"] = { link = "Include" }, -- For identifiers referring to modules and namespaces.
        ["@module.builtin"] = { fg = C.color1 }, -- Variable names that are defined by the languages, like `this` or `self`.
        ["@label"] = { link = "Label" }, -- For labels: label: in C and :label: in Lua.
        --: }}}
        --: Literals {{{
        ["@string"] = { link = "String" }, -- For strings.
        ["@string.documentation"] = { fg = U.blend(C.color1, C.color3, 0.5) }, -- For strings documenting code (e.g. Python docstrings).
        ["@string.regexp"] = { link = "Type" }, -- For regexes.
        ["@string.escape"] = { fg = C.color5 }, -- For escape characters within a string.
        ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
        ["@string.special.path"] = { link = "Special" }, -- filenames
        ["@string.special.symbol"] = { fg = C.color4 }, -- symbols or atoms
        ["@string.special.url"] = { link = "URLlink" }, -- urls, links and emails
        ["@character"] = { link = "Character" }, -- character literals
        ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)
        ["@boolean"] = { link = "Boolean" }, -- For booleans.
        ["@number"] = { link = "Number" }, -- For all numbers
        ["@number.float"] = { link = "Float" }, -- For floats.
        --: }}}
        --: Types {{{
        ["@type"] = { link = "Type" }, -- For types.
        ["@type.builtin"] = { link = "@type" }, -- For builtin types.
        ["@type.definition"] = { link = "Typedef" },
        ["@type.qualifier"] = { link = "@keyword.modifier" },
        ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
        ["@property"] = { link = "Function" }, -- Same as TSField.
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
        ["@keyword.function"] = { link = "Define" }, -- For keywords used to define a function.
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
        ["@punctuation.bracket"] = { link = "Special" }, -- For brackets and parenthesis.
        ["@punctuation.special"] = { link = "SpecialChar" }, -- For special punctuation that does not fall in the categories before (e.g. `{}` in string interpolation).
        --: }}}
        --: Comment {{{
        ["@comment"] = { link = "Comment" },
        ["@comment.documentation"] = { link = "Comment" }, -- For comments documenting code
        ["@comment.error"] = { bg = C.error, fg = C.background, styles = { "bold", "italic" } },
        ["@comment.warning"] = { bg = C.warn, fg = C.background, styles = { "bold", "italic" } },
        ["@comment.hint"] = { bg = C.hint, fg = C.background, styles = { "bold", "italic" } },
        ["@comment.todo"] = { link = "Todo" },
        ["@comment.note"] = { bg = C.info, fg = C.background, styles = { "bold", "italic" } },
        --: }}}
        --: Diff {{{
        ["@diff.plus"] = { link = "DiffAdd" }, -- added text (for diff files)
        ["@diff.minus"] = { link = "DiffDelete" }, -- deleted text (for diff files)
        ["@diff.delta"] = { link = "DiffChange" }, -- deleted text (for diff files)
        ["@string.special.path.diff"] = { fg = C.foreground },
        --: }}}
        --: Tags {{{
        ["@tag"] = { link = "Label" }, -- Tags like html tag names.
        ["@tag.attribute"] = { link = "Type" }, -- Tags like html tag names.
        ["@tag.delimiter"] = { link = "Delimiter" }, -- Tag delimiter like < > /
        --: }}}
        --: Language specific {{{
        --: Bash {{{
        ["@function.builtin.bash"] = { styles = { "italic" } },
        --: }}}
        --: JS & derivative {{{
        ["@keyword.export"] = { fg = C.color6 },
        --: }}}
        --: Markdown {{{
        ["@markup"] = { fg = C.foreground }, -- For strings considerated text in a markup language.
        ["@markup.strong"] = { link = "Bold" }, -- bold text
        ["@markup.italic"] = { link = "Italic" }, -- italic text
        ["@markup.strikethrough"] = { link = "Strikethrough" }, -- strikethrough text
        ["@markup.underline"] = { link = "Underlined" }, -- underlined text
        ["@markup.heading"] = { link = "Title" }, -- titles like: # Example
        ["@markup.math"] = { link = "Special" }, -- math environments (e.g. `$ ... $` in LaTeX)
        ["@markup.quote"] = { link = "Identifier" }, -- block quotes
        ["@markup.environment"] = { link = "Macro" }, -- text environments of markup languages
        ["@markup.environment.name"] = { link = "Type" }, -- text indicating the type of an environment
        ["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
        ["@markup.link.url"] = { link = "URLlink" }, -- urls, links and emails
        ["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
        ["@markup.link.label.symbol"] = { link = "Identifier" },
        ["@markup.raw"] = { link = "String" }, -- used for inline code in markdown and for doc in python (""")
        ["@markup.list"] = { link = "Special" },
        ["@markup.list.checked"] = { fg = C.color2 }, -- todo notes
        ["@markup.list.unchecked"] = { fg = C.color4 }, -- todo notes
        ["@markup.heading.1.markdown"] = { link = "rainbow1" },
        ["@markup.heading.2.markdown"] = { link = "rainbow2" },
        ["@markup.heading.3.markdown"] = { link = "rainbow3" },
        ["@markup.heading.4.markdown"] = { link = "rainbow4" },
        ["@markup.heading.5.markdown"] = { link = "rainbow5" },
        ["@markup.heading.6.markdown"] = { link = "rainbow6" },
        --: }}}
        --: Java {{{
        ["@constant.java"] = { fg = C.color6 },
        --: }}}
        --: CSS {{{
        ["@property.css"] = { fg = C.color5 },
        ["@property.id.css"] = { fg = C.color4 },
        ["@property.class.css"] = { fg = C.color3 },
        ["@type.css"] = { fg = C.color5 },
        ["@type.tag.css"] = { fg = C.color5 },
        ["@string.plain.css"] = { fg = U.blend(C.color1, C.color3, 0.5) },
        ["@number.css"] = { fg = U.blend(C.color1, C.color3, 0.5) },
        --: }}}
        --: Toml {{{
        ["@property.toml"] = { fg = C.color4 }, -- Differentiates between string and properties
        --: }}}
        --: Json {{{
        ["@label.json"] = { fg = C.color4 }, -- For labels: label: in C and :label: in Lua.
        --: }}}
        --: Lua {{{
        ["@constructor.lua"] = { link = "Special" }, -- For constructor calls and definitions: = { } in Lua.
        ["@keyword.function.lua"] = { link = "Function" }, -- For function definitions in Lua.
        --: }}}
        --: Typescript {{{
        ["@property.typescript"] = { fg = C.color5 },
        ["@constructor.typescript"] = { fg = C.color5 },
        --: }}}
        --: TSX (Typescript React) {{{
        ["@constructor.tsx"] = { link = "@constructor" },
        ["@tag.attribute.tsx"] = { link = "Type" },
        ["@tag.tsx"] = { link = "Tag" },
        ["@tag.delimiter.tsx"] = { link = "Delimiter" },
        --: }}}
        --: Yaml {{{
        ["@variable.member.yaml"] = { link = "Variable" }, -- For fields.
        --: }}}
        --: Ruby {{{
        ["@string.special.symbol.ruby"] = { link = "Variable" },
        --: }}}
        --: PHP {{{
        ["@function.method.php"] = { link = "Function" },
        ["@function.method.call.php"] = { link = "Function" },
        --: }}}
        --: C/CPP {{{
        ["@lsp.typemod.type.defaultLibrary.c"] = { link = "@type.builtin.c" },
        ["@lsp.typemod.type.defaultLibrary.cpp"] = { link = "@type.builtin.c" },
        ["@property.cpp"] = { fg = C.foreground },
        --: }}}
        --: Gitcommit {{{
        ["@comment.warning.gitcommit"] = { fg = C.color3 },
        --: }}}
        --: }}}
        --: LSP Semantic Tokens {{{
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
        ["@lsp.type.interface"] = { fg = C.color4 },
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
        ["@lsp.type.unresolvedReference"] = { link = "Error", styles = { "undercurl" } },
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
        ["@lsp.typemod.type.defaultLibrary"] = { fg = C.color4 },
        ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = C.color4 },
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
