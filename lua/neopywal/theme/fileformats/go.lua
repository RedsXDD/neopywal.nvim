local M = {}

function M.get()
    return {
        -- builtin: https://github.com/google/vim-ft-go:
        goDirective = { link = "PreProc" },
        goConstants = { link = "Constant" },
        goDeclType = { link = "Type" },

        -- polyglot:
        goPackage = { link = "String" },
        goImport = { link = "Include" },
        goBuiltins = { link = "Identifier" },
        goPredefinedIdentifiers = { link = "Identifier" },
        goVar = { link = "Variable" },
    }
end

return M
