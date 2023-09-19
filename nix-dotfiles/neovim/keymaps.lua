vim.g.mapleader = " "

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

