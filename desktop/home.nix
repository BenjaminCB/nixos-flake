{ config, pkgs, ... }:

{
    home.file = {
        ".config/hypr-extra/monitors.conf".source = ../dotfiles/hypr/desktop-monitors.conf;
        # ".config/wpaperd/wallpaper.toml".source = ../dotfiles/wpaperd/desktop-wallpaper.toml;
    };
}
