{ pkgs, ... }:

let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    base16 = import ../../base16.nix;
in
{
    enable = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
        vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#${base16.base00}', fg='#${base16.base0F}'})
        vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#${base16.base00}'})
        ${builtins.readFile ./options.lua}
        ${builtins.readFile ./keymaps.lua}
    '';
    plugins = with pkgs.vimPlugins; [
        popup-nvim
        plenary-nvim
        {
            # popup-nvim and plenary-nvim are dependencies,
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
        }
        {
            plugin = telescope-fzy-native-nvim;
            config = toLua "require('telescope').load_extension('fzy_native')";
        }
        {
            plugin = nvim-treesitter;
            config = toLua "require('nvim-treesitter.configs').setup({highlight = { enable = true }})";
        }
        nvim-treesitter-parsers.bash
        nvim-treesitter-parsers.nix
        nvim-treesitter-parsers.json
        nvim-treesitter-parsers.yaml
        nvim-treesitter-parsers.typescript
        nvim-treesitter-parsers.haskell
        nvim-treesitter-parsers.lua
        nvim-treesitter-parsers.python

	    nvim-web-devicons
        lsp-colors-nvim
        {
            # nvim-web-devicons and lsp-colors-nvim are dependencies,
            plugin = trouble-nvim;
            config = toLua "require('trouble').setup()";
        }
        {
            plugin = lualine-nvim;
            config = toLuaFile ./plugins/lualine.lua;
        }

        vim-surround
        vim-commentary

        vim-closer
        markdown-preview-nvim
        copilot-vim

        {
            plugin = Coqtail;
            config = "let g:coqtail_nomap = 1";
        }

        {
            plugin = vim-gitgutter;
            config = "let g:gutgutter_map_keys=0";
        }

        {
            plugin = nvim-lspconfig;
            config = toLuaFile ./plugins/lsp.lua;
        }

        luasnip
        cmp_luasnip
	    cmp-nvim-lsp
        {
            plugin = nvim-cmp;
            config = toLuaFile ./plugins/cmp.lua;
        }
        {
            plugin = oil-nvim;
            config = toLua "require('oil').setup({ view_options = { show_hidden = true }})";
        }
        {
            plugin = which-key-nvim;
            config = toLua ''
                vim.o.timeout = true
                vim.o.timeoutlen = 500
                require("which-key").setup()
            '';
        }
    ];
}
