local M = {}

function M.get()
    return {
        OperatorSandwichAdd = { fg = C.diff_added },
        OperatorSandwichChange = { fg = C.diff_changed },
        OperatorSandwichDelete = { fg = C.diff_removed },
        OperatorSandwichBuns = { fg = C.warn },
    }
end

return M
