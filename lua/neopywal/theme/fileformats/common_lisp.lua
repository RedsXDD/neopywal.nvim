local M = {}

function M.get()
    return {
        -- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP:
        lispAtomMark = { link = "Special" },
        lispKey = { link = "Function" },
        lispFunc = { link = "Function" },
    }
end

return M
