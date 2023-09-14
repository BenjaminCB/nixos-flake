{ pkgs }:

pkgs.writeShellApplication {
    name = "zfzf";
    buildInputs = with pkgs; [ zathura fzf coreutils-full ];
    text = ''
        nohup zathura $(fzf) &
    '';
}
