local M = {}

function M.get()
    return {
        -- builtin:
        matlabSemicolon = { link = "Delimiter" },
        matlabFunction = { link = "Function" },
        matlabImplicit = { link = "Statement" },
        matlabDelimiter = { link = "Delimiter" },
        matlabOperator = { link = "Operator" },
        matlabArithmeticOperator = { link = "Operator" },
        matlabRelationalOperator = { link = "Operator" },
        matlabLogicalOperator = { link = "Operator" },
    }
end

return M
