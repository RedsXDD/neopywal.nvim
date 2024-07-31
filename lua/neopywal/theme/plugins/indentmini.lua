local M = {}

function M.get()
    local scope_color = O.plugins.indentmini.scope_color
    if type(scope_color) == "function" then scope_color = scope_color(C) end
    scope_color = require("neopywal.utils.hex").validate(scope_color, C.comment)

    local current_scope_color = O.plugins.indentmini.current_scope_color
    if type(current_scope_color) == "function" then current_scope_color = current_scope_color(C) end
    current_scope_color = require("neopywal.utils.hex").validate(current_scope_color, C.color4)

    return {
        IndentLine = { fg = scope_color, nocombine = true },
        IndentLineCurrent = { fg = current_scope_color, nocombine = true },
    }
end

return M
