vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.softtabstop = 4
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.wildmode = "longest,list,full"
vim.opt.ruler = true
vim.opt.undolevels = 1000
vim.opt.foldmethod = "marker"
vim.opt.exrc = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 6
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = "c"
vim.opt.cmdheight = 2

-- TODO write augroups with neovim api
-- " better readability and spell checking in documents
-- " go to the previous spelling mistake and open the suggestions
vim.cmd([[
augroup readability
    autocmd!
    autocmd FileType tex setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    autocmd FileType markdown setlocal wrap colorcolumn=0 spell spelllang=da,en_gb
    autocmd FileType tex nnoremap <buffer> <leader>sc [slz=
    autocmd FileType markdown nnoremap <buffer> <leader>sc [slz=
    autocmd BufRead /tmp/neomutt* setlocal wrap colorcolumn=0
augroup END
]])

vim.cmd([[
augroup trim_whitespace
    autocmd!
    autocmd BufWrite * %s/\s\+$//e
augroup END
]])
