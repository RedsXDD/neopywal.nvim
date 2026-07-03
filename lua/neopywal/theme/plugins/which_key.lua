local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        WhichKey = { fg = C.color1 },
        WhichKeyBorder = {
            bg = (O.transparent_background and vim.o.winblend == 0) and C.none
                or C.dim_bg,
        },
        WhichKeyDesc = { fg = C.foreground },
        WhichKeyFloat = { link = "WhichKeyNormal" },
        WhichKeyGroup = { fg = C.color6 },
        WhichKeyNormal = {
            bg = (O.transparent_background and vim.o.winblend == 0) and C.none
                or C.dim_bg,
        },
        WhichKeySeperator = { link = "WhichKeyValue" },
        WhichKeyValue = { fg = C.comment },
        WhichKeyTitle = {
            bg = (O.transparent_background and vim.o.winblend == 0) and C.none
                or C.dim_bg,
            fg = C.color2,
        },
    }
end

return M
