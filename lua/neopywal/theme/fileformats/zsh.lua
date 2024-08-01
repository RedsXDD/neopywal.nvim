local M = {}

function M.get()
    return {
        -- builtin: https://github.com/chrisbra/vim-zsh:
        zshOption = { link = "Statement" },
        zshSubst = { link = "Variable" },
        zshFunction = { link = "Function" },
        zshOperator = { link = "Operator" },
    }
end

return M
