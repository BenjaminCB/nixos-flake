{ config, pkgs, ... }:

{
  home.username = "bcb";
  home.homeDirectory = "/home/bcb";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ neovim htop ];
}
