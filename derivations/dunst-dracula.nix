{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "dracula-dunst";
    src = pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "dunst";
        rev = "9e346df33b23243ad0e0ff544648e9affaf6e4fc";
        sha256 = "0cfm3wpsl9hkqjsvyrxi1wh99w7cl4iqcb922hjcs3wym39r40gv";
    };
    installPhase = ''
        mkdir -p $out
        cp ./dunstrc $out/dunstrc
    '';
}
