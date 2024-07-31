local M = {}

function M.get()
    return {
        IlluminatedWordText = { bg = U.darken(C.dim_bg, 5), styles = O.plugins.illuminate.style or {} },
        IlluminatedWordRead = { bg = U.darken(C.dim_bg, 5), styles = O.plugins.illuminate.style or {} },
        IlluminatedWordWrite = {
            bg = U.darken(C.dim_bg, 5),
            styles = vim.tbl_deep_extend(
                "keep",
                O.plugins.illuminate.lsp and { "standout" } or {},
                O.plugins.illuminate.style or {}
            ),
        },
    }
end

return M
