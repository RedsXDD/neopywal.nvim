local M = {}

function M.get()
    local kinds = require("neopywal.utils.kinds").get("Aerial%sIcon")
    return vim.tbl_deep_extend("force", kinds, {
        AerialLine = { fg = C.color4 },
        AerialGuide = { fg = C.comment },
    })
end

return M
