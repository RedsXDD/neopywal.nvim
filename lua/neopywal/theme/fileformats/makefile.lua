local M = {}

function M.get()
    return {
        makeIdent = { link = "Variable" },
        makeSpecTarget = { link = "Special" },
        makeTarget = { link = "Function" },
        makeCommands = { link = "Identifier" },
    }
end

return M
