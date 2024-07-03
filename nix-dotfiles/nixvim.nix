{
    enable = true;
    globals.mapleader = " ";
	plugins = {
	    lualine.enable = true;
        telescope = {
            enable = true;
            extensions.fzy-native = {
                enable = true;
                settings.override_file_sorter = true;
                settings.override_generic_sorter = false;
            };
            settings = {
                file_sorter = { __raw = "require('telescope.sorters').get_fzy_sorter"; };
                prompt_prefix = "❯ ";
                color_devicons = true;

                file_previewer = "bat";
                grep_previewer = { __raw = "require('telescope.previewers').vim_buffer_vimgrep.new"; };
                qflist_previewer = { __raw = "require('telescope.previewers').vim_buffer_qflist.new"; };

                layout_strategy = "horizontal";

                mappings = {
                    i = {
                        "<C-x>"= false;
                        "<C-s>"= { __raw = "require('telescope.actions').add_to_qflist"; };
                    };
                };

            };
            keymaps = {
                "<leader>pf" = "find_files";
                "<leader>pt" = "treesitter";
                "<leader>pb" = "buffers";
                "<leader>pl" = "lsp_references";
                "<leader>ps" = "live_grep";
            };
        };
	};
}
