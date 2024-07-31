let s:p = has("nvim") == 1 ? luaeval('require("neopywal.theme.plugins.airline").get()') : luaeval('vim.dict(require("neopywal.theme.plugins.airline").get())')
let g:airline#themes#neopywal#palette = s:p
