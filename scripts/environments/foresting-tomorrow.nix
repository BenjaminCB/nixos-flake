{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = with pkgs; [
        nodejs
        nodePackages.typescript
        nodePackages.typescript-language-server
        google-cloud-sdk
        docker
        fzf
    ];

    shellHook = ''
        export NPM_TOKEN="fake_token"
        gcloud config set run/region europe-west3
        gcloud auth configure-docker europe-west3-docker.pkg.dev

        echo Welcome to cloud run shell
    '';
}
