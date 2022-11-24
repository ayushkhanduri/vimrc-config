vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" }} }

vim.opt.guifont = {"Source Code Pro", "h22"}
