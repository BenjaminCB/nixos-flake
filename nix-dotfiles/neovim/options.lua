vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.background = "dark"
vim.opt.colorcolumn = "80"
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.wildmode = "longest,list,full"
vim.opt.ruler = true
vim.opt.undolevels = 1000
vim.opt.foldmethod = "marker"
vim.opt.exrc = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 6
vim.opt.hidden = true
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.fileencoding = "utf-8"


-- colorscheme gruvbox
-- let g:gruvbox_conrast_dark = 'hard'
-- let mapleader=" "
-- syntax enable
-- set shell=/usr/bin/bash
-- 
-- " go to next, previous and close the list
-- " commands for old grep but could be used when i get around to using quick fix
-- nnoremap <leader>cn <cmd>cnext<cr>
-- nnoremap <leader>cp <cmd>cprev<cr>
-- nnoremap <leader>co <cmd>copen<cr>
-- nnoremap <leader>cc <cmd>cclose<cr>
-- nnoremap <leader>cf :call setqflist([])<cr>

-- " Same as above but for local quickfix list
-- nnoremap <leader>ln <cmd>lnext<cr>
-- nnoremap <leader>lp <cmd>lprev<cr>
-- nnoremap <leader>lo <cmd>lopen<cr>
-- nnoremap <leader>lc <cmd>lclose<cr>

-- " newline without entering insert mode
-- nnoremap <C-n> o<Esc>k

-- filetype plugin on
-- filetype indent on

-- " better readability and spell checking in documents
-- " go to the previous spelling mistake and open the suggestions
-- augroup readability
    -- autocmd!
    -- autocmd FileType tex setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    -- autocmd FileType markdown setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    -- autocmd FileType tex nnoremap <buffer> <leader>sc [slz=
    -- autocmd FileType markdown nnoremap <buffer> <leader>sc [slz=
    -- autocmd BufRead /tmp/neomutt* setlocal wrap colorcolumn=0
-- augroup END

-- augroup trim_whitespace
    -- autocmd!
    -- autocmd BufWrite * %s/\s\+$//e
-- augroup END
