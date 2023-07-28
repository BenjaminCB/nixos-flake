{ pkgs }:

pkgs.writeScriptBin "hello" ''
    echo "Hello, world!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
