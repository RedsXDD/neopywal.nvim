local M = {}

function M.get()
    return {
        -- builtin: https://github.com/vim-perl/vim-perl:
        perlStatementPackage = { link = "Include" },
        perlStatementInclude = { link = "Include" },
        perlStatementStorage = { link = "StorageClass" },
        perlStatementList = { link = "Statement" },
        perlMatchStartEnd = { link = "Delimiter" },
        perlVarSimpleMemberName = { link = "Identifier" },
        perlVarSimpleMember = { link = "Identifier" },
        perlMethod = { link = "Function" },
        podVerbatimLine = { link = "Function" },
        podCmdText = { link = "String" },
        perlVarPlain = { link = "Variable" },
        perlVarPlain2 = { link = "Variable" },
    }
end

return M
