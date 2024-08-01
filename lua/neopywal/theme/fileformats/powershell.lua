local M = {}

function M.get()
    return {
        -- vim-ps1: https://github.com/PProvost/vim-ps1:
        ps1FunctionInvocation = { link = "Function" },
        ps1FunctionDeclaration = { link = "Function" },
        ps1InterpolationDelimiter = { link = "Special" },
        ps1BuiltIn = { link = "Type" },
    }
end

return M
