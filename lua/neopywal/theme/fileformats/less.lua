local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        -- vim-less: https://github.com/groenewege/vim-less:
        lessMixinChar = { link = "Normal" },
        lessClass = { link = "Identifier" },
        lessFunction = { link = "Function" },
    }
end

return M
