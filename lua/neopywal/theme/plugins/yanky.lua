local M = {}

function M.get()
    return {
        YankyPut = { bg = U.blend(C.ok, C.background, 0.2), fg = C.ok },
        YankyYanked = { bg = U.blend(C.warn, C.background, 0.2), fg = C.warn },
    }
end

return M
