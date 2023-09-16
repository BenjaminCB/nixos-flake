{ pkgs }:

let
    gruvboxplus = import ../derivations/gruvboxplus.nix { inherit pkgs; };
in
{
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";
    iconTheme.package = gruvboxplus;
    iconTheme.name = "GruvboxPlus";
}
