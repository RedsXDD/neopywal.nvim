local M = {}

function M.get()
    return {
        -- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX:
        texStatement = { link = "Statement" },
        texOnlyMath = { link = "Operator" },
        texDefName = { link = "TypeDef" },
        texNewCmd = { link = "Identifier" },
        texCmdName = { link = "Variable" },
        texBeginEnd = { link = "Delimiter" },
        texBeginEndName = { link = "Type" },
        texDocType = { link = "Type" },
        texDocTypeArgs = { link = "Identifier" },
        texInputFile = { link = "Include" },
    }
end

return M
