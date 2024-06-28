{ pkgs }:

pkgs.writeScriptBin "work-monitor" ''
    hyprctl keyword monitor "DP-3,1920x1080,0x0,1,transform,3"
    hyprctl keyword monitor "DP-4,1920x1080,1080x300,1"
    hyprctl keyword monitor "eDP-1,1920x1080,3000x1200,1"
    hyprctl keyword workspace "0, monitor:eDP-1, default:true"
    hyprctl keyword workspace "1, monitor:eDP-1, default:false"
    hyprctl keyword workspace "2, monitor:eDP-1, default:false"
    hyprctl keyword workspace "3, monitor:eDP-1, default:false"
    hyprctl keyword workspace "4, monitor:DP-3, default:true"
    hyprctl keyword workspace "5, monitor:DP-3, default:false"
    hyprctl keyword workspace "6, monitor:DP-3, default:false"
    hyprctl keyword workspace "7, monitor:DP-4, default:true"
    hyprctl keyword workspace "8, monitor:DP-4, default:false"
    hyprctl keyword workspace "9, monitor:DP-4, default:false"
''
