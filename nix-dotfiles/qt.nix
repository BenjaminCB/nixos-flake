{ pkgs }:

{
    enable = true;
    platformTheme = "gtk";
    style.name = "breeze-dark";
    style.package = pkgs.adwaita-qt;
}
