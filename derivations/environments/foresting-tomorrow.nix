{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = with pkgs; [
        nodejs
        nodePackages.typescript
        nodePackages.typescript-language-server
        nodePackages.firebase-tools
        google-cloud-sdk
        docker
        fzf
        cowsay
    ];

    shellHook = ''
        token=`cat ~/.NPM_TOKEN`
        export NPM_TOKEN=$token
        gcloud config set run/region europe-west3
        gcloud auth configure-docker europe-west3-docker.pkg.dev

        echo Welcome to foresting-tomorrow shell
    '';
}
