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
        nvim-lspconfig
        nvim-compe
        {
            # popup-nvim and plenary-nvim are dependencies,
            # but maybe not required when getting from nixpkgs
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
        }

    ];
}
