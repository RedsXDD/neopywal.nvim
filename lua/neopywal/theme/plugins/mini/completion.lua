local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        MiniCompletionActiveParameter = {
            styles = O.plugins.mini.completion.parameter_style or {},
        },
    }
end

return M
