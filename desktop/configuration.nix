# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ../configuration.nix
    ];

    # two monitor command
    # ${pkgs.xorg.xrandr}/bin/xrandr --output DVI-D-1 --primary --mode 1920x1080 --pos 1080x420 --rotate normal --output DVI-D-2 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate left --output DP-1 --off

    services.xserver.displayManager = {
        setupCommands = ''
            ${pkgs.xorg.xrandr}/bin/xrandr --output DVI-D-1 --mode 1920x1080 --pos 3000x490 --rotate normal --output DVI-D-2 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate left --output DP-1 --primary --mode 1920x1080 --pos 1080x356 --rotate normal
        '';
        sessionCommands = ''
            nitrogen --head=0 --set-auto ~/wallpapers/i_am_root.png
            nitrogen --head=1 --set-zoom-fill ~/wallpapers/Shiomiya_Shiori_Holding_Shy_C_Programming_language_wp_gruvbox.png
            nitrogen --head=2 --set-auto ~/wallpapers/anime_book_computer_grevbox_neofetch_vim.png
        '';
    };

    # Most wayland compositors need this
    # from vimjoyer nixos + hyprland video
    hardware.nvidia.modesetting.enable = true;
}
