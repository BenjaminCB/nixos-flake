{ config, pkgs, ... }:

{
    home.file = {
        ".config/hypr-extra/monitors.conf".source = ../dotfiles/hypr/laptop-monitors.conf;
    };
}
