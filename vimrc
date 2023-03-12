"--------------------------------------------------------------
"
"General Settings
"
"---------------------------------------------------------------

set expandtab

"set shiftwidth=2
"set tabstop=2
set hidden
"set signcolumn=yes:2 -> guess doesn't work in vim
"set relativenumber -> causing a lot of confusion with numbering
set number
set termguicolors "Comment this for mac machines or themes wouldn't work
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set wrap
set list
set listchars=tab:▶\ ,trail:∙ "gives trailing dots when unnecessary space
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
filetype plugin indent on
"set backspace=2 "mac specific configuration , add this specifically for mac so backspace deletes the item
"syntax on -> 'add this for mac if syntax hightlighting is off'
set statusline+=col:\ %c,
"setting up backup
"set backup
"set backupdir=


"-----------------------------------------------------------------
"
"KEYMAPS (WILL BE SUBJECTIVE , FIRST UNDERSTAND HOW KEY MAPPING WORKS)
"
"-----------------------------------------------------------------



"-----------------------------------------------------------------
"
"PLUGINS
"
"------------------------------------------------------------------


call plug#begin()

Plug 'tpope/vim-commentary' "for commenting
Plug 'neoclide/coc.nvim', {'branch': 'release'} "vs code for vim
Plug 'dracula/vim' "theme for vscode
Plug 'doums/darcula' "theme for pycharm
Plug 'tpope/vim-fugitive' "git in vim
Plug 'preservim/nerdtree' "file tree
Plug 'kien/ctrlp.vim' "Searching file
Plug 'tomasiser/vim-code-dark' "Vs code theme
Plug 'mhinz/vim-startify' "Just a fancy start screen for vim
Plug 'vim-airline/vim-airline' "Status bar to print information at the bottom
Plug 'nvim-lua/plenary.nvim' "requirement for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } "Better fuzzy search
Plug 'preservim/tagbar' "showing tags at the right
Plug 'dense-analysis/ale' "Syntax checking for multiple languages
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim' "tabs in nvim
call plug#end()

"---------------------------------------------------------------
"
"Config for plugins
"
"--------------------------------------------------------------

colorscheme codedark
autocmd FileType python colorscheme darcula

"NERDTREE
autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-o> :NERDTreeFind<CR>

"COC CONFIG
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-html',
  \ 'coc-clangd',
  \ 'coc-css'
  \ ]
autocmd FileType scss setl iskeyword+=@-@ "for scss files
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile " run prettier on save

"CTRLP VIM
set wildignore+=*/node_modules/*

"NEW TAB
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>
" nnoremap <C-j> :tabprevious<CR>
" nnoremap <C-k> :tabnext<CR>

"Telescope
let mapleader = " "
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) <CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden: true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"COC
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>






" TAGBAR

nmap <F8> :TagbarToggle<CR>

"ALE
"COMMON
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'python': ['pylint'], 'c': [], 'cpp': [], 'c++': [] }
let g:ale_completion_enabled = 0

"PYTHON
let g:ale_disable_lsp = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_options = '--extension-pkg-whitelist=pygame'
let g:ale_python_flake8_options = '--max-line-length=88'

"TYPESCRIPT/JAVASCRIPT
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['eslint'], 'typescript': ['eslint'] }
let g:ale_lint_delay = 500
let g:ale_pattern_options = {
\ '.*node_modules.*$': {'ale_enabled': 0},
\ '.*dist.*$': {'ale_enabled': 0},
\ '.*-config.js$': {'ale_enabled': 0},
\}
let g:ale_fix_on_save = 1

" MOVING FILES UP AND DOWN (CONVENIENT COMMANDS)

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" BARBAR
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <C-A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <C-A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <C-A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <C-A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <C-A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <C-A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <C-A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <C-A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <C-A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <C-A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
