-- Reference: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/log.lua

local M = {}
local notified = {}
function M.clear() notified = {} end

local function should_notify(level)
    local notify = require("neopywal.lib.config").options.notify
    if notify == "none" then return false end
    if notify == "error" then return level == vim.log.levels.ERROR end
    if notify == "warn" then return level == vim.log.levels.WARN or level == vim.log.levels.ERROR end
    return true
end

---@param msg string|string[]
---@param level integer
function M.notify(msg, level)
    if not should_notify(level) then return end

    if type(msg) == "table" then
        msg = table.concat(vim.tbl_filter(function(line) return line or false end, msg), "\n")
    end

    if notified[msg] then return end
    vim.notify(msg, level, {
        title = "Neopywal.nvim",
        on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            vim.wo[win].conceallevel = 3
            vim.wo[win].concealcursor = ""
            vim.wo[win].spell = false
            vim.bo[buf].filetype = "txt"
        end,
    })

    notified[msg] = true
end

function M.info(msg) M.notify(msg, vim.log.levels.INFO) end
function M.warn(msg) M.notify(msg, vim.log.levels.WARN) end
function M.error(msg) M.notify(msg, vim.log.levels.ERROR) end

return M
