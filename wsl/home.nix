{ config, pkgs, ... }:
{
    home.username = "nixos";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        ### term applications
        gotop tmux

        ### utilities
        automake bat fd ffmpeg fzf ncdu pandoc lsix ripgrep
        speedtest-cli unzip zip xdg-utils poppler_utils
        unrar p7zip tree-sitter git-crypt kitty-themes just 

        ### programming stuff
        luajit gcc yarn nodejs lua-language-server nixd 
    ];

    programs.git = import ../nix-dotfiles/git.nix;
    programs.direnv = import ../nix-dotfiles/direnv.nix;
    programs.eza = { enable = true; };

    programs.nixvim = import ../nix-dotfiles/nixvim/nixvim.nix;
}
