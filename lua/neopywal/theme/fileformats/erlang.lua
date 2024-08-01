local M = {}

function M.get()
    return {
        -- builtin: https://github.com/vim-erlang/vim-erlang-runtime:
        erlangAtom = { link = "Special" },
        erlangVariable = { link = "Variable" },
        erlangLocalFuncRef = { link = "Function" },
        erlangLocalFuncCall = { link = "Function" },
        erlangGlobalFuncRef = { link = "Function" },
        erlangGlobalFuncCall = { link = "Function" },
        erlangAttribute = { link = "Type" },
        erlangPipe = { link = "Operator" },
    }
end

return M
