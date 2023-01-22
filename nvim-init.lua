set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
lua require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", ".git" }, pickers ={ find_files = { hidden=true}}} }
