local M = {}

function M.reset()
    for name, _ in pairs(package.loaded) do
        if name:match("^neopywal.") and not name:match("^neopywal.lib.") then package.loaded[name] = nil end
    end
end

return M
