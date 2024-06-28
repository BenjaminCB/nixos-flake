{ pkgs }:

pkgs.writeScriptBin "work-monitor" ''
    hyprctl keyword monitor "DP-3,1920x1080,0x0,1,transform,3"
    hyprctl keyword monitor "DP-4,1920x1080,1080x300,1"
    hyprctl keyword monitor "eDP-1,1920x1080,3000x1200,1"
    hyprctl keyword workspace "0, monitor:eDP-1, default:true"
    hyprctl keyword workspace "2, monitor:eDP-1, default:false"
    hyprctl keyword workspace "5, monitor:EDP-1, default:false"
    hyprctl keyword workspace "8, monitor:EDP-1, default:false"
    hyprctl keyword workspace "1, monitor:HDMI-A-1, default:true"
    hyprctl keyword workspace "4, monitor:HDMI-A-1, default:false"
    hyprctl keyword workspace "7, monitor:HDMI-A-1, default:false"
    hyprctl keyword workspace "3, monitor:DVI-D-1, default:true"
    hyprctl keyword workspace "6, monitor:DVI-D-1, default:false"
    hyprctl keyword workspace "9, monitor:DVI-D-1, default:false"
''
