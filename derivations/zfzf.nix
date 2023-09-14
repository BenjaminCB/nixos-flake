{ pkgs }:

pkgs.writeShellApplication {
    name = "zfzf";
    runtimeInputs = with pkgs; [ zathura fzf coreutils-full ];
    text = ''
        nohup zathura "$(fzf)" &
    '';
}
