{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";
    src = pkgs.fetchurl {
        url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/.../pack.zip";
        sha256 = "...";
    };
    dontUnpack = true;
    installPhase = ''
        mkdir -p $out
        ${pkgs.unzip}/bin/unzip $src -d $out/
    '';
}
