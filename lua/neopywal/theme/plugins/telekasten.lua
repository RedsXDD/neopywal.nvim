local M = {}

function M.get()
    return {
        tkLink = { fg = C.color4 }, -- Links to "@text.uri" => "URLlink".
        tkAliasedLink = { fg = C.color8 },
        tkBrackets = { fg = C.special }, --  Links to "@punctuation.bracket" => "Special".
        tkHighlight = { bg = U.blend(C.warn, C.background, 0.2), fg = C.warn },
        tkTag = { fg = C.tag },
    }
end

return M
