local M = {}

function M.get()
    local hl = {
        Headline = { bg = U.blend(C.color8, C.background, 0.2) },
        Dash = { fg = U.blend(C.color1, C.color3, 0.5) },
        Quote = { link = "Identifier" }, -- Links to "@markup.quote" => "Identifier".
        CodeBlock = { bg = U.blend(C.color8, C.background, 0.2) },
    }

    for i, color in ipairs(require("neopywal.utils.rainbow").get()) do
        hl["Headline" .. i] = { bg = color }
    end

    return hl
end

return M
