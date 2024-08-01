local M = {}

function M.get()
    return {
        -- builtin:
        pythonBuiltin = { link = "Special" },
        pythonExceptions = { link = "Exception" },
        pythonDecoratorName = { link = "Identifier" },

        -- python-syntax: https://github.com/vim-python/python-syntax:
        pythonExClass = { link = "Include" },
        pythonBuiltinType = { link = "Type" },
        pythonBuiltinObj = { link = "Identifier" },
        pythonDottedName = { link = "Identifier" },
        pythonBuiltinFunc = { link = "Function" },
        pythonFunction = { link = "Function" },
        pythonDecorator = { link = "Identifier" },
        pythonInclude = { link = "Inclue" },
        pythonImport = { link = "PreProc" },
        pythonOperator = { link = "Operator" },
        pythonConditional = { link = "Conditional" },
        pythonRepeat = { link = "Repeat" },
        pythonException = { link = "Exception" },
        pythonNone = { link = "Constant" },
        pythonCoding = { link = "Normal" },
        pythonDot = { link = "Identifier" },

        -- semshi: https://github.com/numirias/semshi:
        semshiUnresolved = { link = "Identifier" },
        semshiImported = { link = "Include" },
        semshiParameter = { link = "Identifier" },
        semshiParameterUnused = { link = "Error" },
        semshiSelf = { link = "Statement" },
        semshiGlobal = { link = "Type" },
        semshiBuiltin = { link = "Special" },
        semshiAttribute = { link = "Type" },
        semshiLocal = { link = "Statement" },
        semshiFree = { link = "Statement" },
        semshiSelected = { link = "CocHighlightText" },
        semshiErrorSign = { link = "Error" },
        semshiErrorChar = { link = "Error" },
    }
end

return M
