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
    # autoCmd = [
        # {
            # command = "setlocal wrap colorcolumn=0 spell spelllang=da,en_gb";
            # event = [ "BufEnter" "BufWinEnter" ];
            # pattern = [ "*.md" ];
        # }
        # {
            # command = "nnoremap <buffer> <leader>sc [slz=";
            # event = [ "BufEnter" "BufWinEnter" ];
            # pattern = [ "*.md" ];
        # }
    # ];
	plugins = {
	    lualine.enable = true;
        treesitter.enable = true;
        lsp = {
            enable = true;
            inlayHints = true;
            servers = {
                ts_ls.enable = true;
                hls = {
                    enable = true;
                    installGhc = false;
                };
                lua_ls.enable = true;
                yamlls.enable = true;
                jsonls.enable = true;
                nixd.enable = true;
            };
            keymaps.lspBuf = {
                "<leader>vd" = { 
                    action = "definiton";
                    desc = "Go to definition";
                };
                "<leader>vi" = {
                    action = "implementation";
                    desc = "Go to implementation";
                };
                "<leader>vsh" = {
                    action = "signature_help";
                    desc = "View signature";
                };
                "<leader>vrr" = {
                    action = "references";
                    desc = "View references";
                };
                "<leader>vrn" = {
                    action = "rename";
                    desc = "Rename binding";
                };
                "<leader>vh" = {
                    action = "hover";
                    desc = "Hover";
                };
                "<leader>vca" = {
                    action = "code_action";
                    desc = "Code action";
                };
                # vsd = { "<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>", "Show Line Diagnostics" },
                # vn = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
                # vll = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Set Loclist" },
            };
            onAttach = "";
            luaConfig.post = ''
                local _border = "rounded"

                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                  vim.lsp.handlers.hover, {
                    border = _border
                  }
                )

                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                  vim.lsp.handlers.signature_help, {
                    border = _border
                  }
                )

                vim.diagnostic.config{
                  float={border=_border}
                };

                require('lspconfig.ui.windows').default_options = {
                  border = _border
                }
            '';
        };
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
