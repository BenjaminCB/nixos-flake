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
        lsp = {
            enable = true;
            inlayHints = true;
            servers = {
                lua_ls.enable = true;
                nixd.enable = true;
                ts_ls.enable = true;
            };
            keymaps.lspBuf = {
                "<leader>vh" = "hover";
                "<leader>vrr" = "references";
                "<leader>vd" = "definition";
                "<leader>vi" = "implementation";
                "<leader>vt" = "type_definition";
                "<leader>vrn" = "rename";
            };
        };
        lsp-lines.enable = true;
        lspsaga = {
            enable = true;
            ui = {
                border = "single";
                devicon = true;
            };
            symbolInWinbar.enable = false;
        };
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings.sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
                { name = "copilot"; }
            ];
        };
        oil.enable = true;
        mini.enable = true;
        web-devicons.enable = true;
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
