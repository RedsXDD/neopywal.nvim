local M = {}

function M.get()
    local kinds = require("neopywal.utils.kinds").get("Navbuddy%s")
    local cursorline_kinds = require("neopywal.utils.kinds").get(
        "NavbuddyCursorLine%s",
        { bg = C.background, styles = { "bold", "reverse" } }
    )
    return vim.tbl_deep_extend("force", kinds, cursorline_kinds, {
        NavbuddyCursorLine = { styles = { "bold", "reverse" } },
        NavbuddyCursor = { bg = C.background, blend = 100 },
        NavbuddyName = { link = "IncSearch" },
        NavbuddyScope = { link = "Visual" },
        NavbuddyFloatBorder = { link = "FloatBorder" },
        NavbuddyNormalFloat = { link = "NormalFloat" },
    })
end

return M
