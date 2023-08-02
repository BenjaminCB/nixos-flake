{ pkgs }:

pkgs.writeScriptBin "work-monitor" ''
    hyprctl keyword monitor "DP-3,1920x1080,0x0,1,transform,3"
    hyprctl keyword monitor "DP-4,1920x1080,1080x300,1"
    hyprctl keyword monitor "eDP-1,1920x1080,3000x1200,1"
''
