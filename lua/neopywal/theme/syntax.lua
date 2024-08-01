local M = {}

function M.get()
    -- These groups are not listed as default vim groups, but they are defacto standard group names for syntax highlighting.
    return {
        -- Variable types:
        Variable = { fg = C.variable, styles = O.styles.variables or {} }, -- (preferred) any variable.
        Constant = { fg = C.constant, styles = { "italic" } }, -- (preferred) any constant
        String = { fg = C.string, styles = O.styles.strings or {} }, -- a string constant: "this is a string"
        Character = { fg = C.character }, -- a character constant: 'c', '\n'
        Number = { fg = C.number, styles = O.styles.numbers or {} }, -- a number constant: 234, 0xff
        Boolean = { fg = C.boolean, styles = O.styles.booleans or {} }, -- a boolean constant: TRUE, FALSE
        Float = { fg = C.float }, -- a floating point constant: 2.3e10
        Identifier = { fg = C.identifier, styles = O.styles.variables or {} }, -- (preferred) any variable name
        Function = { fg = C.func, styles = O.styles.functions or {} }, -- function name (also: methods for classes)

        -- Statements:
        Statement = { fg = C.statement }, -- (preferred) any statement
        Conditional = { fg = C.conditional, styles = O.styles.conditionals or {} }, -- if, then, else, endif, switch, etc.
        Repeat = { fg = C.loop, styles = O.styles.loops or {} }, -- for, do, while, etc.
        Label = { link = "Statement" }, -- case, default, etc.
        Exception = { fg = C.exception, styles = O.styles.keywords or {} }, -- try, catch, throw
        Operator = { fg = C.operator, styles = O.styles.operators or {} }, -- "sizeof", "+", "*", etc.
        Keyword = { fg = C.keyword, styles = O.styles.keywords or {} }, -- any other keyword
        Debug = { fg = C.debug }, -- debugging statements.

        -- Preprocessors:
        PreProc = { fg = C.preproc }, -- (preferred) generic Preprocessor
        Include = { fg = C.include, styles = O.styles.includes or {} }, -- preprocessor #include
        Define = { link = "PreProc" }, -- preprocessor #define
        Macro = { link = "PreProc" }, -- same as Define
        PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

        -- Type definitions:
        Type = { fg = C.type, styles = O.styles.types or {} }, -- (preferred) int, long, char, etc.
        Structure = { link = "Type" }, -- struct, union, enum, etc.
        StorageClass = { link = "Type" }, -- static, register, volatile, etc.
        Typedef = { link = "Type" }, -- A typedef

        -- Special:
        Special = { fg = C.special }, -- (preferred) any special symbol
        SecialChar = { fg = C.specialchar }, -- special character in a constant
        Tag = { fg = C.tag }, -- you can use CTRL-] on this
        Delimiter = { fg = C.delimiter }, -- character that needs attention
        SpecialComment = { fg = C.specialcomment, styles = { "italic" } }, -- special things inside a comment

        -- Text styles:
        Underlined = { styles = { "underline" } }, -- (preferred) text that stands out, HTML links
        Bold = { styles = { "bold" } }, -- (preferred) any bold text
        Italic = { styles = { "italic" } }, -- (preferred) any italic text
        Strikethrough = { styles = { "strikethrough" } }, -- (preferred) any strikethrough text

        -- Misc:
        Ignore = { fg = C.color8 }, -- (preferred) left blank, hidden |hl-Ignore|
        Error = { fg = C.error }, -- (preferred) any erroneous construct
        Todo = { fg = C.color4, styles = { "bold", "italic" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        URLlink = { fg = C.color4, styles = { "italic", "underline" } }, -- (preferred) urls, links and emails

        -- Rainbow
        rainbow1 = { fg = require("neopywal.utils.rainbow").get()[1] },
        rainbow2 = { fg = require("neopywal.utils.rainbow").get()[2] },
        rainbow3 = { fg = require("neopywal.utils.rainbow").get()[3] },
        rainbow4 = { fg = require("neopywal.utils.rainbow").get()[4] },
        rainbow5 = { fg = require("neopywal.utils.rainbow").get()[5] },
        rainbow6 = { fg = require("neopywal.utils.rainbow").get()[6] },

        -- Diagnostics:
        DiagnosticOk = { fg = C.ok, styles = O.plugins.lsp.virtual_text.ok or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
        DiagnosticError = { fg = C.error, styles = O.plugins.lsp.virtual_text.errors or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
        DiagnosticWarn = { fg = C.warn, styles = O.plugins.lsp.virtual_text.warnings or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
        DiagnosticInfo = { fg = C.info, styles = O.plugins.lsp.virtual_text.information or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
        DiagnosticHint = { fg = C.hint, styles = O.plugins.lsp.virtual_text.hints or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
        DiagnosticUnnecessary = { fg = C.unnecessary, styles = O.plugins.lsp.virtual_text.unnecessary or {} }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default.
    }
end

return M
