" plugins{{{
call plug#begin('~/local/share/nvim/plugged')

" actually useful
Plug 'neovim/nvim-lspconfig' "there is also a diagnostic plugin that gives control over error msg
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-lua/popup.nvim' "telescope dependency
Plug 'nvim-lua/plenary.nvim' "telescope dependency
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "telescope dependency
" Plug 'kyazdani42/nvim-web-devicons' "telescope dependency
Plug 'nvim-telescope/telescope.nvim' "some dependencies might be optional
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'lervag/vimtex'

Plug 'norcalli/snippets.nvim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'

" For c and c++ debugging look into this
" https://github.com/sakhnik/nvim-gdb

" quality of life
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'rstacruz/vim-closer'
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim'

" themes
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline-themes'
Plug 'hugolgst/vimsence'
" Plug 'tomasr/molokai'
" Plug 'bignimbus/pop-punk.vim'
" Plug 'tomasiser/vim-code-dark'

call plug#end()"}}}

" theme and look{{{
set number
set relativenumber
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
set nowrap
set colorcolumn=80
"}}}

" basic settings{{{
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
set exrc                       " when nvim . is used to open a project nvim will automatically source a config file if one exists it should be called .exrc
set nohlsearch
set scrolloff=6
set shell=/usr/bin/bash        " some plugins (fzf but maybe others) doesnt like fish
set hidden
set nobackup
set nowritebackup
set updatetime=100
set signcolumn=yes
"}}}

" keybinds {{{
" keybinds for lsp is under lsp tab

" go to next, previous and close the list
" commands for old grep but could be used when i get around to using quick fix
nnoremap <leader>cn <cmd>cnext<cr>
nnoremap <leader>cp <cmd>cprev<cr>
nnoremap <leader>co <cmd>copen<cr>
nnoremap <leader>cc <cmd>cclose<cr>

" newline without entering insert mode
" newline above does not work
" nnoremap <S-Enter> O<Esc>j
nnoremap <CR> o<Esc>k

" grab right (h) or left (u) side in a merge conflict
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

" git status
nmap <leader>gs :G<CR>

" git checkout
nnoremap <leader>gc :GCheckout<CR>

""" Telescope
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<cr>

" move to next and previous hunk changes
nnoremap <leader>]c <Plug>(GitGutterNextHunk)
nnoremap <leader>[c <Plug>(GitGutterPrevHunk)

" toggle highlighting with leader th
map <leader>th :ColorToggle<CR>

" snippet expand and advande (1) and (-1)
inoremap <c-l> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
inoremap <c-h> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

" easy-align
nmap <leader>ea <Plug>(EasyAlign)

" markdown preview
nnoremap <leader>mp :MarkdownPreview<cr>
" }}}

" auto commands {{{
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
"}}}

" lua require {{{
lua require("bcb")
" }}}

" vimsence {{{

" let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
" let g:vimsence_editing_details = 'Editing: {}'
" let g:vimsence_editing_state = 'Working on: {}'
" let g:vimsence_file_explorer_text = 'In NERDTree'
" let g:vimsence_file_explorer_details = 'Looking for files'
" let g:vimsence_custom_icons = {'filetype': 'iconname'}

"}}}

" lsp {{{
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set cmdheight=2 " probably not needed error might not be in the cmd

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet='UltiSnips'

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"}}}

"completion nvim {{{
" needed since there is overlap between vim-closer and completion.nvim <CR>
let g:completion_confirm_key = "<c-s>"
autocmd BufEnter * lua require'completion'.on_attach()
"}}}

" git gutter{{{
" don't want any key maps for staging hunks and such
let g:gutgutter_map_keys=0
"}}}

" Color highlighting{{{
" automatically start in css and html files
let g:colorizer_auto_filetype='css,html,conkyrc'

" 24-bit color
set termguicolors
"}}}

" vimtex{{{
let g:tex_flavor = 'latex'
"}}}
