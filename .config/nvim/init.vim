lua require("bcb.plugins")

" theme and look
set number
set relativenumber
set background=dark
colorscheme gruvbox
set nowrap
set colorcolumn=80

" basic settings
let mapleader=" "
set clipboard+=unnamedplus
set incsearch
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set smarttab
set softtabstop=4
set splitright
set splitbelow
syntax enable
set wildmode=longest,list,full
set ruler
set undolevels=1000
set foldmethod=marker
set exrc
set nohlsearch
set scrolloff=6
set shell=/usr/bin/bash
set hidden
set nobackup
set nowritebackup
set updatetime=100
set signcolumn=yes
set termguicolors

" go to next, previous and close the list
" commands for old grep but could be used when i get around to using quick fix
nnoremap <leader>cn <cmd>cnext<cr>
nnoremap <leader>cp <cmd>cprev<cr>
nnoremap <leader>co <cmd>copen<cr>
nnoremap <leader>cc <cmd>cclose<cr>
nnoremap <leader>cf :call setqflist([])<cr>

" Same as above but for local quickfix list
nnoremap <leader>ln <cmd>lnext<cr>
nnoremap <leader>lp <cmd>lprev<cr>
nnoremap <leader>lo <cmd>lopen<cr>
nnoremap <leader>lc <cmd>lclose<cr>

" newline without entering insert mode
nnoremap <C-n> o<Esc>k

" grab local and remote sides when merging
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

filetype plugin on

" better readability and spell checking in documents
" go to the previous spelling mistake and open the suggestions
augroup readability
    autocmd!
    autocmd FileType tex setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    autocmd FileType markdown setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    autocmd FileType tex nnoremap <buffer> <leader>sc [slz=
    autocmd FileType markdown nnoremap <buffer> <leader>sc [slz=
    autocmd BufRead /tmp/neomutt* setlocal wrap colorcolumn=0
augroup END

augroup trim_whitespace
    autocmd!
    autocmd BufWrite * %s/\s\+$//e
augroup END
