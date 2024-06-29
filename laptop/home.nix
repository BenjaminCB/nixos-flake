{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = import ../nix-dotfiles/hypr/hyprland.nix {
        inherit pkgs;
        monitorSetup = ''
            monitor=eDP-1,1920x1080,0x0,1
        '';
    };
}
