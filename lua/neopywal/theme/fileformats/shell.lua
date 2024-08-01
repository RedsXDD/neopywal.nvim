local M = {}

function M.get()
    return {
        -- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH:
        shRange = { fg = C.foreground },
        shOption = { link = "Special" },
        shQuote = { link = "String" },
        shVariable = { link = "Variable" },
        shDerefSimple = { link = "Variable" },
        shDerefVar = { link = "Variable" },
        shDerefSpecial = { link = "Special" },
        shDerefOff = { link = "Type" },
        shVarAssign = { link = "Statement" },
        shFunctionOne = { link = "Function" },
        shFunctionKey = { link = "Identifier" },
    }
end

return M
