{ config, pkgs, ... }:

{
    home.file = {
        ".config/hypr/monitors.conf".source = ../dotfiles/hypr/laptop-monitors.conf;
    };
}
