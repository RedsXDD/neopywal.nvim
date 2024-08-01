local M = {}

function M.get()
    return {
        -- builtin: https://notabug.org/jorgesumle/vim-html-syntax:
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
    }
end

return M
