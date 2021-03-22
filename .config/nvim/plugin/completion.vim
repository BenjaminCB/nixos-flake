" needed since there is overlap between vim-closer and completion.nvim <CR>
let g:completion_confirm_key = "<c-s>"

let g:completion_enable_snippet = 'snippets.nvim'

" autocmd BufEnter * lua require'completion'.on_attach()

" snippet expand and advande (1) and (-1)
inoremap <c-l> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
inoremap <c-h> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

autocmd BufEnter * lua require('completion').on_attach()
