local M = {}

function M.get()
    return {
        -- vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty:
        jsxTagName = { link = "Tag" },
        jsxOpenPunct = { link = "Identifier" },
        jsxClosePunct = { link = "Delimiter" },
        jsxEscapeJs = { link = "Special" },
        jsxAttrib = { link = "Type" },
    }
end

return M
