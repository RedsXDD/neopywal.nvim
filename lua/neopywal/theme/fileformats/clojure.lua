local M = {}

function M.get()
    return {
        -- builtin: https://github.com/guns/vim-clojure-static:
        clojureMacro = { link = "Macro" },
        clojureFunc = { link = "Function" },
        clojureConstant = { link = "Constant" },
        clojureSpecial = { link = "Special" },
        clojureDefine = { link = "Define" },
        clojureKeyword = { link = "Keyword" },
        clojureVariable = { link = "Variable" },
        clojureMeta = { link = "Special" },
        clojureDeref = { link = "Special" },
    }
end

return M
