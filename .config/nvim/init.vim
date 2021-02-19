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

Plug 'lervag/vimtex'

Plug 'norcalli/snippets.nvim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'

" quality of life
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'rstacruz/vim-closer'
Plug 'junegunn/vim-easy-align'

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

" recursivelly grep through directiries with a user input and open a list with
" all the accurences
nnoremap <leader>cs <cmd>call MyGrep()<cr>

" go to next, previous and close the list
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

" find files from current directory
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>

" find files from current repo
nnoremap <leader>pg <cmd>lua require('telescope.builtin').git_files()<cr>

" grep through files in current directory
" nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<cr>

" find files from opened buffers
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
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

function MyGrep()
    execute 'silent grep! '.input('Grep for > ').' **/**'
    copen
endfunction
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
lua << EOF
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=false }
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>]d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        require('lspconfig').util.nvim_multiline_command [[
            :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
            autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd", "tsserver", "texlab", "html", "cssls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        -- on_attach = require'completion'.on_attach,
    }
end

EOF

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

" telescope{{{
lua << EOF
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "bottom",
        prompt_prefix = ">",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_defaults = {
          -- TODO add builtin options.
        },
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
        grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
        qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    }
}
EOF
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

" snippets {{{

lua << EOF
-- example of predetermined text that can be changed ["for"] = U.match_indentation "for (${1:int i = }; ${2:i }; ${3:i}) {\n\t$0\n}";
local U = require'snippets.utils'
require'snippets'.snippets = {
    _global = {
        test = "it worked";
        date = os.date("%y-%m-%d");
    };
    markdown = {
        ["smeeting"] = "# Intro\nThis is a summary of our ${1} supervisor meeting.\n\nDate of the meeting: ${2=os.date(\"%y-%m-%d\")} (actually document creation, but close enough).\n\n# Agenda\n${0}\n\n# Meeting notes";
    };
    c = {
        ["if"]      = U.match_indentation "if (${1}) {\n\t$0\n}";
        ["elif"]    = U.match_indentation "else if (${1}) {\n\t$0\n}";
        ["switch"]  = U.match_indentation "switch (${1}) {\n\tcase ${2}:\n\t\t$0\n\tdefault:\n}";
        ["while"]   = U.match_indentation "while (${1}) {\n\t$0\n}";
        ["dowhile"] = U.match_indentation "do {\n\t$0\n} while (${1});";
        ["for"]     = U.match_indentation "for (${1}) {\n\t$0\n}";
    };
    html = {
        ["html"] =                     "<!DOCTYPE html>\n<html>$0\n\t<head>\n\t\t<meta charset=\"UTF-8\">\n\t</head>\n\n\t<body>\n\t</body>\n</html>";
        ["css"]  = U.match_indentation "<link rel=\"stylesheet\" href=\"$0\">";
        ["js"]   = U.match_indentation "<script src=\"$0\"></script>";
        ["pa"]   = U.match_indentation "<p>\n\t$0\n</p>";
        ["an"]   = U.match_indentation "<a href=\"$0\"></a>";
        ["div"]  = U.match_indentation "<div>\n\t$0\n</div>";
        ["ul"]   = U.match_indentation "<ul>\n\t$0\n</ul>";
        ["ol"]   = U.match_indentation "<ol>\n\t$0\n</ol>";
        ["li"]   = U.match_indentation "<li>$0</li>";
        ["em"]   = U.match_indentation "<em>$0</em>";
        ["str"]  = U.match_indentation "<strong>$0</strong>";
    };
    tex = {
        ["beg"]  = U.match_indentation "\\begin{${1}}\n\t$0\n\\end{$1}";
        ["eq"]   = U.match_indentation "\\begin{equation}\n\t$0\n\\end{equation}";
        ["ali"]  = U.match_indentation "\\begin{align}\n\t$0\n\\end{align}";
        ["fig"]  = U.match_indentation "\\begin{figure}[h!]\n\t\\centering\n\t\\caption{${1}}\n\t\\includegraphics[width=\\textwidth]{${2}}\n\t\\label{fig:${3}}\n\\end{figure}$0";
        ["item"] = U.match_indentation "\\begin{itemize}\n\t\\item $0\n\\end{itemize}";
        ["enum"] = U.match_indentation "\\begin{enumerate}\n\t\\item $0\n\\end{enumerate}";
        ["plot"] = U.match_indentation "\\begin{figure}[h!]\n\t\\centering\n\t\\begin{tikzpicture}\n\t\t\\begin{axis}[\n\t\t\txmin=${1:-10}, xmax=${2:10}\n\t\t\tymin=${3:-10}, ymax=${4:10},\n\t\t\taxis lines = middle,\n\t\t]\n\t\t\t\\addplot[domain=$1:$2, samples=${5:100}]{${6};\n\t\t\\end{axis}\n\t\\end{tixzpicture}\n\t\\caption{${7}}\n\t\\label{fig:${8}}\n\\end{figure}$0";
        ["pac"]  =                     "\\usepackage{${1}}$0";
        ["//"]   = U.match_indentation "\\frac{${1}}{${2}} $0";
        ["1/"]   = U.match_indentation "\\frac{1}{${1}} $0";
        ["vec"]  = U.match_indentation "\\vec{${1}} $0";
        ["sqrt"] = U.match_indentation "\\sqrt[${1}]{${2}} $0";
        ["<="]   =                     "\\le ";
        [">="]   =                     "\\ge ";
        ["!="]   =                     "\\neq ";
        ["inf"]  =                     "\\infty ";
        ["and"]  =                     "\\wedge ";
        ["or"]   =                     "\\vee ";
        ["c="]   =                     "\\subsuteq ";
        ["nn"]   =                     "\\cap ";
        ["uu"]   =                     "\\cup ";
        ["**"]   =                     "\\cdot ";
        ["->"]   =                     "\\to ";
        ["<->"]  =                     "\\leftrightarrow ";
    };
}
EOF
"}}}
