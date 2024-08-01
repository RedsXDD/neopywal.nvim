local M = {}

function M.get()
    return {
        -- builtin:
        luaFunc = { link = "Function" },
        luaFunction = { link = "Function" },
        luaTable = { link = "Special" },
        luaIn = { link = "Include" },

        -- vim-lua: https://github.com/tbastos/vim-lua:
        luaFuncCall = { link = "Function" },
        luaLocal = { link = "Statement" },
        luaSpecialValue = { link = "Special" },
        luaBraces = { link = "SpecialChar" },
        luaBuiltIn = { link = "Special" },
        luaNoise = { link = "Normal" },
        luaLabel = { link = "Label" },
        luaFuncTable = { link = "Special" },
        luaFuncArgName = { link = "Identifier" },
        luaEllipsis = { link = "Keyword" },
        luaDocTag = { link = "Tag" },
    }
end

return M
