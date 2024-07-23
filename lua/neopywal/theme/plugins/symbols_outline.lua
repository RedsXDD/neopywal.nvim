local M = {}

function M.get()
    return {
        -- https://github.com/simrat39/symbols-outline.nvim
        FocusedSymbol = { fg = C.color4 },

        -- https://github.com/hedyhli/outline.nvim
        OutlineCurrent = { link = "FocusedSymbol" },
        OutlineGuides = { fg = C.comment },
        OutlineFoldMarker = { fg = C.foreground },
    }
end

return M
