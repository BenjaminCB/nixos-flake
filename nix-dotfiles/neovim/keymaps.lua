vim.g.mapleader = " "

-- | vanilla neovim keymaps
local remapper = function (keys, mapping)
    vim.api.nvim_set_keymap("n", "<leader>" .. keys, mapping, { noremap = true })
end

-- go to next, previous and close the list
remapper("cn", "<cmd>cnext<cr>")
remapper("cp", "<cmd>cprev<cr>")
remapper("co", "<cmd>copen<cr>")
remapper("cc", "<cmd>cclose<cr>")
remapper("cf", ":call setqflist([])<cr>")

-- Same as above but for local quickfix list
remapper("ln", "<cmd>lnext<cr>")
remapper("lp", "<cmd>lprev<cr>")
remapper("lo", "<cmd>lopen<cr>")
remapper("lc", "<cmd>lclose<cr>")

-- | telescope keymaps
local telescope_remapper = function (keys, mapping)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keys,
        "<cmd>lua require('telescope.builtin')." .. mapping .. "<cr>",
        { noremap = true }
    )
end

telescope_remapper("pf", "find_files()")
telescope_remapper("pt", "treesitter()")
telescope_remapper("pb", "buffers()")
telescope_remapper("pl", "lsp_references()")
telescope_remapper("ps", "grep_string({ search = vim.fn.input(\"Grep for > \") })")

-- | markdown-preview keymaps
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<cr>", { noremap = true})

-- | coqtail keymaps
local coqtail_remapper = function(keys, mapping)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keys,
        "<cmd>" .. mapping .. "<cr>",
        { noremap = true }
    )
end

coqtail_remapper("os", "CoqStart")
coqtail_remapper("oq", "CoqStop")
coqtail_remapper("oi", "CoqInterrupt")
coqtail_remapper("oj", "CoqNext")
coqtail_remapper("ok", "CoqUndo")
coqtail_remapper("ol", "CoqToLine")
coqtail_remapper("ot", "CoqToTop")
coqtail_remapper("oG", "CoqJumpToEnd")
coqtail_remapper("oE", "CoqJumpToError")
coqtail_remapper("ogd", "CoqGoToDef[!]<arg>")
coqtail_remapper("or", "CoqRestorePanels")

-- | lsp keymaps
local lsp_remapper = function(keys, mapping)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keys,
        ":lua vim.lsp." .. mapping .. "<CR>",
        { noremap = true }
    )
end

lsp_remapper("vd", "buf.definition()")
lsp_remapper("vi", "buf.implementation()")
lsp_remapper("vsh", "buf.signature_help()")
lsp_remapper("vrr", "buf.references()")
lsp_remapper("vrn", "buf.rename()")
lsp_remapper("vh", "buf.hover()")
lsp_remapper("vca", "buf.code_action()")
lsp_remapper("vsd", "util.show_line_diagnostics()")
lsp_remapper("vn", "diagnostic.goto_next()")
lsp_remapper("vll", "diagnostic.set_loclist()")

-- | trouble keymaps
local trouble_remapper = function(keys, mapping)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keys,
        "<cmd>" .. mapping .. "<cr>",
        { noremap = true }
    )
end

trouble_remapper("xx", "TroubleToggle")
trouble_remapper("xw", "TroubleToggle workspace_diagnostics")
trouble_remapper("xd", "TroubleToggle document_diagnostics")
