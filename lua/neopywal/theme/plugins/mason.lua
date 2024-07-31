local M = {}

function M.get()
    local bg = O.transparent_background and C.none or C.color4
    local fg = O.transparent_background and C.color4 or C.background

    local secondary_bg = O.transparent_background and C.none or U.blend(C.color1, C.color3, 0.5)
    local secondary_fg = O.transparent_background and U.blend(C.color1, C.color3, 0.5) or C.background

    local muted_bg = O.transparent_background and C.none or U.blend(C.background, C.foreground, 0.7)
    local muted_fg = O.transparent_background and U.blend(C.background, C.foreground, 0.7) or C.background

    return {
        MasonLink = { link = "URLlink" },
        MasonError = { fg = C.error, styles = { "bold", "italic" } },
        MasonWarning = { fg = C.warn, styles = { "bold", "italic" } },

        MasonHeader = { bg = bg, fg = fg, bold = true },
        MasonHeaderSecondary = { bg = secondary_bg, fg = secondary_fg, bold = true },

        MasonHeading = { fg = C.color6, bold = true },
        MasonHighlight = { fg = C.color6 },
        MasonHighlightBlock = {
            bg = O.transparent_background and C.none or C.color6,
            fg = O.transparent_background and C.color6 or C.background,
        },
        MasonHighlightBlockBold = { bg = bg, fg = fg, bold = true },

        MasonHighlightSecondary = { fg = C.color3 },
        MasonHighlightBlockSecondary = { bg = secondary_bg, fg = secondary_fg },
        MasonHighlightBlockBoldSecondary = { bg = secondary_bg, fg = secondary_fg, bold = true },

        MasonMuted = { fg = C.comment },
        MasonMutedBlock = { bg = muted_bg, fg = muted_fg },
        MasonMutedBlockBold = {
            bg = O.transparent_background and C.none or U.blend(C.background, C.foreground, 0.7),
            fg = C.background,
            bold = true,
        },
    }
end

return M
