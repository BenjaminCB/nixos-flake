nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pt <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>pl <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<cr>
nnoremap <leader>ph <cmd>Telescope harpoon marks<cr>
