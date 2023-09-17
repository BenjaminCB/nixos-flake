local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,


        layout_strategy = "horizontal",

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.add_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local remapper = function (keys, mapping)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keys,
        "<cmd>lua require('telescope.builtin')." .. mapping .. "<cr>",
        { noremap = true }
    )
end

remapper("pf", "find_files()")
remapper("pt", "treesitter()")
remapper("pb", "buffers()")
remapper("pl", "lsp_references()")
remapper("ps", "grep_string({ search = vim.fn.input(\"Grep for > \") })")
