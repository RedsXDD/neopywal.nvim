local M = {}

function M.get()
    return {
        jsonKeyword = { link = "Function" },
        jsonString = { link = "String" },
        jsonBoolean = { link = "Boolean" },
        jsonNoise = { link = "Normal" },
        jsonQuote = { link = "String" },
        jsonBraces = { link = "SpecialChar" },
    }
end

return M
