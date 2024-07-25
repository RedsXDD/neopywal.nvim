local M = {}

function M.get()
    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

    local scope_color = O.plugins.mini.indentscope.scope_color
    if type(scope_color) == "function" then scope_color = scope_color(C) end

    scope_color = scope_color ~= "" and scope_color or C.comment
    scope_color = string.lower(scope_color)
    scope_color = string.find(scope_color, pattern) ~= nil and scope_color
        or C[scope_color] ~= nil and C[scope_color]
        or C.comment

    return {
        MiniIndentscopeSymbol = { fg = scope_color },
        MiniIndentscopePrefix = { styles = { "nocombine" } }, -- Make it invisible
    }
end

return M
