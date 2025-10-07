{pkgs, ...}: let
  monitorConfig = ''
    output "eDP-1" {
        mode "1920x1200@60.096"
        scale 1
        transform "normal"
        position x=0 y=0
    }

    output "ASUSTek COMPUTER INC ASUS VG249 0x0003BA20" {
        mode "1920x1080@60.000"
        scale 1
        transform "normal"
        position x=-1920 y=-900
    };

    output "ASUSTek COMPUTER INC ASUS VG249 0x0003BA1E" {
        mode "1920x1080@60.000"
        scale 1
        transform "270"
        position x=-3000 y=-1200
    };

    output "Lenovo Group Limited T27QD-40 VNAC1NVX" {
        mode "2560x1440@119.998"
        scale 1.25
        transform "normal"
        position x=4480 y=0
    };

    output "Lenovo Group Limited T27QD-40 VNAC1NXD" {
        mode "2560x1440@119.998"
        scale 1.25
        transform "normal"
        position x=1920 y=0
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
