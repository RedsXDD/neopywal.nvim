local M = {}

function M.get()
    return {
        -- scss-syntax: https://github.com/cakebaker/scss-syntax.vim:
        scssMixinName = { link = "Identifier" },
        scssSelectorChar = { link = "Identifier" },
        scssSelectorName = { link = "Constant" },
        scssInterpolationDelimiter = { link = "Special" },
        scssVariableValue = { link = "Identifier" },
        scssNull = { link = "Constant" },
        scssBoolean = { link = "Boolean" },
        scssVariableAssignment = { link = "Variable" },
        scssAttribute = { link = "Type" },
        scssFunctionName = { link = "Function" },
        scssVariable = { link = "Variable" },
        scssAmpersand = { link = "Operator" },
    }
end

return M
