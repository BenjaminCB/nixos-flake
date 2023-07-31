{ config, pkgs, ... }:

{
    home.file = {
        ".config/hypr-extra/monitors.conf".source = ../dotfiles/hypr/desktop-monitors.conf;
    };
}
