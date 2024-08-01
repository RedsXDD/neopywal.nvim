local M = {}

function M.get()
    return {
        -- builtin: https://github.com/vim-ruby/vim-ruby:
        rubyKeywordAsMethod = { link = "Keyword" },
        rubyInterpolation = { link = "Special" },
        rubyInterpolationDelimiter = { link = "Special" },
        rubyStringDelimiter = { link = "Delimiter" },
        rubyBlockParameterList = { link = "Statement" },
        rubyDefine = { link = "Define" },
        rubyModuleName = { link = "String" },
        rubyAccess = { link = "Exception" },
        rubyMacro = { link = "Macro" },
        rubySymbol = { link = "Variable" },
    }
end

return M
