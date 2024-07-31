local M = {}

function M.get()
    local hl = {
        -- RenderMarkdownSign = { link = "SignColumn" },
        -- RenderMarkdownTableFill = { link = "Conceal" },
        RenderMarkdownBullet = { fg = C.color5 },
        RenderMarkdownCode = { bg = U.blend(C.color8, C.background, 0.2) },
        RenderMarkdownDash = { fg = U.blend(C.color1, C.color3, 0.5) },
        RenderMarkdownTableHead = { fg = C.color1 },
        RenderMarkdownTableRow = { fg = U.blend(C.color1, C.color3, 0.5) },
        RenderMarkdownCodeInline = { bg = U.blend(C.color8, C.background, 0.2) },
        RenderMarkdownSuccess = { fg = C.ok },
        RenderMarkdownError = { fg = C.error },
        RenderMarkdownHint = { fg = C.hint },
        RenderMarkdownInfo = { fg = C.info },
        RenderMarkdownWarn = { fg = C.warn },
        RenderMarkdownMath = { link = "Special" }, -- Links to "@markup.math" => "Special".
        RenderMarkdownLink = { link = "Statement" }, -- Links to "@markup.link.label.markdown_inline" => "Statement".
        RenderMarkdownQuote = { link = "Identifier" }, -- Links to "@markup.quote" => "Identifier".
        RenderMarkdownTodo = { link = "String" }, -- Links to "@markup.raw" => "String".
        RenderMarkdownChecked = { fg = C.color2 }, -- Links to "@markup.list.checked".
        RenderMarkdownUnchecked = { fg = C.color4 }, -- Links to "@markup.list.unchecked".
    }

    for i, color in ipairs(require("neopywal.utils.rainbow").get()) do
        hl["RenderMarkdownH" .. i] = { fg = color, bold = true }
        hl["RenderMarkdownH" .. i .. "Bg"] = { bg = U.blend(color, C.background, 0.2) }
        hl["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
    end

    return hl
end

return M
