{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = import ../nix-dotfiles/hyprland.nix {
        inherit pkgs;
        monitorSetup = {
            monitor = [
                "eDP-1, 1920x1080, 0x0, 1"
            ];
        };
    };

    services.batsignal = {
        enable = true;
        extraArgs = [
            "-w 20"
            "-c 10"
            "-d 5"
            "-p"
        ];
    };
}
