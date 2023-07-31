{ config, pkgs, ... }:

{
    home.file = {
        ".config/hypr/monitors.conf".source = ../dotfiles/hypr/desktop-monitors.conf;
    };
}
