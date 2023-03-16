# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ../configuration.nix
    ];

    services.xserver.displayManager = {
        sessionCommands = ''
            nitrogen --set-auto ~/wallpapers/nix-wallpaper-nineish-dark-gray.png
        '';
    };
}
