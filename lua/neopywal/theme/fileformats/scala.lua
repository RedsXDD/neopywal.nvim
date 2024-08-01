local M = {}

function M.get()
    return {
        -- builtin: https://github.com/derekwyatt/vim-scala:
        scalaNameDefinition = { link = "Define" },
        scalaInterpolationBoundary = { link = "Special" },
        scalaInterpolation = { link = "Special" },
        scalaTypeOperator = { link = "Operator" },
        scalaOperator = { link = "Operator" },
        scalaKeywordModifier = { link = "Keyword" },
    }
end

return M
