{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = import ../nix-dotfiles/hypr/hyprland.nix {
        inherit pkgs;
        monitorSetup = ''
            monitor = HDMI-A-1, 1920x1080, 0x0, 1, transform, 1
            monitor = DP-1, 1920x1080, 1080x350, 1
            monitor = DVI-D-1, 1920x1080, 3000x500, 1

            workspace = 0, monitor:DP-1, default:true
            workspace = 1, monitor:DP-1, default:false
            workspace = 2, monitor:DP-1, default:false
            workspace = 3, monitor:DP-1, default:false
            workspace = 4, monitor:HDMI-A-1, default:true
            workspace = 5, monitor:HDMI-A-1, default:false
            workspace = 6, monitor:HDMI-A-1, default:false
            workspace = 7, monitor:DVI-D-1, default:true
            workspace = 8, monitor:DVI-D-1, default:false
            workspace = 9, monitor:DVI-D-1, default:false
        '';
    };
}
