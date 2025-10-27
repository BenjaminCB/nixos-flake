{pkgs, ...}: let
  monitorConfig = ''
    output "DP-2" {
        mode "2560x1080@120.000"
        scale 1
        transform "normal"
        position x=-320 y=1080
    }

    output "DP-3" {
        mode "1920x1080@60.000"
        scale 1
        transform "normal"
        position x=0 y=0
    };
  '';
  niriConfig = import ./config.nix {
    inherit monitorConfig;
    inherit pkgs;
  };
in {
  home.file.niri = {
    enable = true;
    recursive = true;
    text = niriConfig;
    target = ".config/niri/config.kdl";
  };
}
