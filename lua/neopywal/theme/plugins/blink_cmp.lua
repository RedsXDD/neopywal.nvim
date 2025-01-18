local M = {}

function M.get()
    local kinds = require("neopywal.utils.kinds").get("BlinkCmpKind%s")
    return vim.tbl_deep_extend("force", kinds, {
        BlinkCmpLabel = { fg = C.foreground },
        BlinkCmpLabelDeprecated = { fg = C.color8, styles = { "strikethrough" } },
        BlinkCmpLabelMatch = { fg = C.special }, -- (Currently unused) Label of the completion item when it matches the query
        BlinkCmpKind = { fg = C.foreground },
        BlinkCmpSource = { fg = C.color2 },
        BlinkCmpGhostText = { fg = C.comment },
    })
end

return M
