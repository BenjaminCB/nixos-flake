{
    enable = true;
    globals.mapleader = " ";
    opts = {
        number = true;
        relativenumber = true;
        wrap = false;
        colorcolumn = "80";
        shiftwidth = 4;
        tabstop = 4;
        expandtab = true;
        smartindent = true;
        splitright = true;
        splitbelow = true;
        softtabstop = 4;
        wildmode = "longest,list,full";
        ruler = true;
        undolevels = 1000;
        foldmethod = "marker";
        exrc = true;
        hlsearch = false;
        scrolloff = 6;
        backup = false;
        writebackup = false;
        updatetime = 100;
        signcolumn = "yes";
        termguicolors = true;
        completeopt = "menuone,noinsert,noselect";
        shortmess = "c";
        cmdheight = 2;
    };
    clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
    };
    autoCmd = [
        {
            command = "setlocal wrap colorcolumn=0 spell spelllang=da,en_gb";
            event = [ "BufEnter" "BufWinEnter" ];
            pattern = [ "*.md" ];
        }
        {
            command = "nnoremap <buffer> <leader>sc [slz=";
            event = [ "BufEnter" "BufWinEnter" ];
            pattern = [ "*.md" ];
        }
    ];
	plugins = {
	    lualine.enable = true;
        treesitter.enable = true;
        noice.enable = true;
        lsp = {
            enable = true;
            servers = {
                tsserver.enable = true;
                hls.enable = true;
                lua-ls.enable = true;
                yamlls.enable = true;
                jsonls.enable = true;
                nixd.enable = true;
            };
            keymaps.lspBuf = {
                "<leader>vd" = "definiton";
                "<leader>vi" = "implementation";
                "<leader>vsh" = "signature_help";
                "<leader>vrr" = "references";
                "<leader>vrn" = "rename";
                "<leader>vh" = "hover";
                "<leader>vca" = "code_action";
                # vsd = { "<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>", "Show Line Diagnostics" },
                # vn = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
                # vll = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Set Loclist" },
            };
        };
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
