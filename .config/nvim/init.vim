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

Plug 'nvim-treesitter/nvim-treesitter'

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
set exrc                        " when nvim . is used to open a project nvim will automatically source a config file if one exists it should be called .exrc
set nohlsearch
set scrolloff=6
set shell=/usr/bin/bash         " some plugins (fzf but maybe others) doesnt like fish
set hidden
set nobackup
set nowritebackup
set updatetime=100
set signcolumn=yes
"}}}

lua require("bcb")
lua require'nvim-treesitter.configs'.setup{highlight = { enable = true }}

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
