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
        # popup-nvim
        # plenary-nvim
        {
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
        }

    ];
}
