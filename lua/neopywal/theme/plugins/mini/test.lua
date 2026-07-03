local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        MiniTestEmphasis = { styles = { "bold" } },
        MiniTestFail = { fg = C.error, styles = { "bold" } },
        MiniTestPass = { fg = C.ok, styles = { "bold" } },
    }
end

return M
