local M = {}

function M.get()
    local kinds = require("neopywal.utils.kinds").get("TroubleIcon%s")
    return vim.tbl_deep_extend("force", kinds, {
        TroubleSource = { fg = C.comment },
        TroubleIndent = { fg = C.comment },
        TroubleIndentFoldClosed = { link = "TroubleIndent" },
        TroubleCount = { fg = C.color6, bold = true },
        TroubleIconDirectory = { link = "TroubleFilename" },
        TroubleCode = { fg = C.warn, bold = true },
        TroubleNormal = { bg = O.transparent_background and C.none or C.dim_bg },
        TroubleText = { fg = C.color2 },
        TroubleNormalNC = { link = "NormalNC" },
    })
end

return M
