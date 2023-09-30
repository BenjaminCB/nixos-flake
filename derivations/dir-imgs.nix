{ pkgs }:

pkgs.writeScriptBin "dir-imgs" ''
    find . -name "*.png" -name "*.jpg" -name "*.gif" -name "*.bmp" -name "*.tiff" -name "*.svg" -name "*.eps" -name "*.pdf" -name "*.ico" -name "*.psd" -exec echo {} \; -exec wezterm imgcat {} \;
''
