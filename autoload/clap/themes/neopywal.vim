let s:p = has("nvim") == 1 ? luaeval('require("neopywal.theme.plugins.clap").get()') : luaeval('vim.dict(require("neopywal.theme.plugins.clap").get())')
let g:clap#themes#neopywal#palette = s:p
