local M = {}

function M.get()
    return {
        dosiniHeader = { link = "Function" },
        dosiniLabel = { link = "Label" },
        dosiniValue = { link = "Float" },
        dosiniNumber = { link = "Number" },
    }
end

return M
