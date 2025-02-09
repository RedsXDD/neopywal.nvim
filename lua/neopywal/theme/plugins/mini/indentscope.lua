local M = {}

function M.get()
    local scope_color = O.plugins.mini.indentscope.scope_color
    if type(scope_color) == "function" then scope_color = scope_color(C) end
    scope_color = require("neopywal.utils.color").validate(scope_color, C.comment)

    return {
        MiniIndentscopeSymbol = { fg = scope_color },
        MiniIndentscopePrefix = { styles = { "nocombine" } }, -- Make it invisible
    }
end

return M
