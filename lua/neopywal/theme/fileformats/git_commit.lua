local M = {}

function M.get()
    return {
        gitcommitSummary = { fg = C.color1 },
        gitcommitUntracked = { fg = C.color8 },
        gitcommitDiscarded = { fg = C.color8 },
        gitcommitSelected = { fg = C.color8 },
        gitcommitUnmerged = { fg = C.color8 },
        gitcommitOnBranch = { fg = C.color8 },
        gitcommitArrow = { fg = C.color8 },
        gitcommitFile = { fg = C.color2 },
    }
end

return M
