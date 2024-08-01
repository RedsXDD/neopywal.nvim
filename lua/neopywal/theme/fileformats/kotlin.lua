local M = {}

function M.get()
    return {
        -- kotlin-vim: https://github.com/udalov/kotlin-vim:
        ktSimpleInterpolation = { link = "Special" },
        ktComplexInterpolation = { link = "Special" },
        ktComplexInterpolationBrace = { link = "SpecialChar" },
        ktStructure = { link = "Structure" },
        ktKeyword = { link = "Keyword" },
    }
end

return M
