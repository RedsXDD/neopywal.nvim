local M = {}

function M.get()
    return {
        IlluminatedWordText = {
            bg = U.blend(C.foreground, C.background, 0.2),
            styles = O.plugins.illuminate.style or {},
        },
        IlluminatedWordRead = {
            bg = U.blend(C.foreground, C.background, 0.2),
            styles = O.plugins.illuminate.style or {},
        },
        IlluminatedWordWrite = {
            bg = U.blend(C.foreground, C.background, 0.2),
            styles = vim.tbl_deep_extend(
                "keep",
                O.plugins.illuminate.lsp and { "standout" } or {},
                O.plugins.illuminate.style or {}
            ),
        },
    }
end

return M
