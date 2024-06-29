{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = import ../nix-dotfiles/hyprland.nix {
        inherit pkgs;
        monitorSetup = {
            monitor = [
                "HDMI-A-1, 1920x1080, 0x0, 1, transform, 1"
                "DP-1, 1920x1080, 1080x350, 1"
                "DVI-D-1, 1920x1080, 3000x500, 1"
            ];

            workspace = [
                "0, monitor:DP-1, default:true"
                "1, monitor:DP-1, default:false"
                "2, monitor:DP-1, default:false"
                "3, monitor:DP-1, default:false"
                "4, monitor:HDMI-A-1, default:true"
                "5, monitor:HDMI-A-1, default:false"
                "6, monitor:HDMI-A-1, default:false"
                "7, monitor:DVI-D-1, default:true"
                "8, monitor:DVI-D-1, default:false"
                "9, monitor:DVI-D-1, default:false"
            ];
        };
    };
}
