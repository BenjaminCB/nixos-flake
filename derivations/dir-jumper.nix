{ pkgs }:

pkgs.writeScriptBin "dev-environments" ''
    dir = $(dirname $0)
    echo $dir
''
