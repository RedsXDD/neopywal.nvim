local M = {}

function M.get()
    return {
        -- builtin: https://github.com/marshallward/vim-restructuredtext:
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
    }
end

return M
