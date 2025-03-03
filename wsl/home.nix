{ config, pkgs, pkgs-stable, secrets, ... }:
{
    home.username = "bcb";
    home.homeDirectory = "/home/bcb";
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        ### term applications
        gotop yazi

        ### utilities
        automake bat fd ffmpeg fzf ncdu pandoc lsix ripgrep
        speedtest-cli unzip zip wmname xclip xdg-utils poppler_utils
        unrar p7zip tree-sitter acpi git-crypt kitty-themes just mermaid-cli

        ### programming stuff
        luajit gcc yarn coq nodejs lua-language-server nixd vscode
    ]);

    programs.lf = (import ./nix-dotfiles/lf.nix { inherit pkgs; }) // { enable = true; };
    programs.git = import ./nix-dotfiles/git.nix;
    programs.direnv = import ./nix-dotfiles/direnv.nix;
    programs.eza = { enable = true; };

    programs.nixvim = import ./nix-dotfiles/nixvim/nixvim.nix;
}
