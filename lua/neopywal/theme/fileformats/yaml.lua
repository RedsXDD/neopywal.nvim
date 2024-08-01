local M = {}

function M.get()
    return {
        yamlKey = { link = "Function" },
        yamlConstant = { link = "Constant" },
        yamlString = { link = "String" },
    }
end

return M
