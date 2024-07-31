local M = {}

function M.get()
    local color = O.plugins.window_picker.color
    if type(color) == "function" then color = color(C) end
    color = require("neopywal.utils.hex").validate(color, C.color4)

    return {
        WindowPickerStatusLine = { fg = color, styles = { "bold", "italic" } },
        WindowPickerStatusLineNC = { fg = color, styles = { "bold", "italic" } },
        WindowPickerWinBar = { fg = color, styles = { "bold", "italic" } },
        WindowPickerWinBarNC = { fg = color, styles = { "bold", "italic" } },
    }
end

return M
