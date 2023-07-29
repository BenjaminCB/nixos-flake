{ pkgs }:

let
    imgLink = "https://gitlab.com/Ace_BCB/nixos-flake/-/raw/master/wallpapers/nix-wallpaper-nineish-dark-gray.png?ref_type=heads";
    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "sha256-nhIUtCy/Hb8UbuxXeL3l3FMausjQrnjTVi1B3GkL9B8=";
    };
in
pkgs.stdenv.mkDerivation {
    name = "sddm-sugar-dark";
    src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
        sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };
    installPhase = ''
        mkdir -p $out
        cp -r ./* $out/
        cd $out/
        rm Background.jpg
        cp -r ${image} Background.jpg
    '';
}
