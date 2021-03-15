set completeopt=menuone,noinsert,noselect
set shortmess+=c
set cmdheight=2 " probably not needed error might not be in the cmd

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet='UltiSnips'

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
