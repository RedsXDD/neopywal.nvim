local M = {}

function M.get()
    return {
        -- builtin:
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

        -- vim-markdown: https://github.com/gabrielelana/vim-markdown:
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
    }
end

return M
