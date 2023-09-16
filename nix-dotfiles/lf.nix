{ pkgs }:

{
    enable = true;
    previewer.source = pkgs.writeShellScript "pv.sh" ''
        case "$1" in
            *.tar*) ${pkgs.gnutar}/bin/tar tf "$1";;
            *.zip) ${pkgs.unzip}/bin/unzip -l "$1";;
            *.rar) ${pkgs.unrar}/bin/unrar l "$1";;
            *.7z) ${pkgs.p7zip}/bin/7z l "$1";;
            *.png) ${pkgs.libsixel}/bin/img2sixel "$1";;
            *.jpg) ${pkgs.libsixel}/bin/img2sixel "$1";;
            *.jpeg) ${pkgs.libsixel}/bin/img2sixel "$1";;
            *) highlight -O ansi "$1" || cat "$1";;
        esac
    '';
}
