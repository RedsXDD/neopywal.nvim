let s:p = has("nvim") == 1 ? luaeval('require("neopywal.theme.plugins.lightline").get()') : luaeval('vim.dict(require("neopywal.theme.plugins.lightline").get())')
let g:lightline#colorscheme#neopywal#palette = lightline#colorscheme#fill(s:p)
