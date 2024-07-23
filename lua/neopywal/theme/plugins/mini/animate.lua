local M = {}

function M.get()
    return {
        MiniAnimateCursor = { styles = { "reverse", "nocombine" } },
        MiniAnimateNormalFloat = { link = "NormalFloat" },
    }
end

return M
