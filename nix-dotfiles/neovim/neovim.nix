{ pkgs }:

let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
    enable = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
        ${builtins.readFile ./keymaps.lua}
    '';
    plugins = with pkgs.vimPlugins; [
        {
            plugin = gruvbox;
            config = ''
                colorscheme gruvbox
                let g:gruvbox_conrast_dark = 'hard'
            '';
        }
        {
            # popup-nvim and plenary-nvim are dependencies,
            # but maybe not required when getting from nixpkgs
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
        {
            # nvim-web-devicons and lsp-colors-nvim are dependencies,
            # but maybe not required when getting from nixpkgs
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

        {
            plugin = Coqtail;
            config = "let g:coqtail_nomap = 1";
        }

        {
            plugin = vim-gitgutter;
            config = "let g:gutgutter_map_keys=0";
        }

        {
            plugin = copilot-lua;
            config = toLua "require('copilot').setup({})";
        }

        {
            plugin = nvim-lspconfig;
            config = toLuaFile ./plugins/lsp.lua;
        }

        {
            plugin = nvim-compe;
            config = toLuaFile ./plugins/compe.lua;
        }
    ];
}
