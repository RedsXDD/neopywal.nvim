local M = {}

function M.get()
    return {
        -- haskell-vim: https://github.com/neovimhaskell/haskell-vim:
        haskellBrackets = { link = "SpecialChar" },
        haskellIdentifier = { link = "Identifier" },
        haskellDecl = { link = "Define" },
        haskellType = { link = "Type" },
        haskellDeclKeyword = { link = "Keyword" },
        haskellWhere = { link = "Conditional" },
        haskellDeriving = { link = "Conditional" },
        haskellForeignKeywords = { link = "Keyword" },
    }
end

return M
