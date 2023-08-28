{ pkgs, secrets }:

let
    foresting-tomorrow = pkgs.mkShell {
        packages = with pkgs; [
            nodejs
            nodePackages.typescript
            nodePackages.typescript-language-server
            nodePackages.firebase-tools
            google-cloud-sdk
            docker
            fzf
            cowsay
            git-crypt
        ];

        shellHook = ''
            export NPM_TOKEN=${secrets.npmToken}
            gcloud config set run/region europe-west3
            gcloud auth configure-docker europe-west3-docker.pkg.dev

            echo Welcome to foresting-tomorrow shell
        '';
    };
in
pkgs.writeScriptBin "dev-environments" ''
    environments=`echo "typescript foresting-tomorrow" | tr ' ' '\n' | sort -r`;
    environment=`printf "$environments" | ${pkgs.fzf}/bin/fzf`

    case "$environment" in
        "typescript")
            echo "typescript"
        ;;
        "foresting-tomorrow")
            nix-shell -p nodejs \
                         nodePackages.typescript \
                         nodePackages.typescript-language-server \
                         nodePackages.firebase-tools \
                         google-cloud-sdk \
                         docker \
                         fzf \
                         cowsay \
                         git-crypt \
                      --run fish

            export NPM_TOKEN=${secrets.npmToken}
            gcloud config set run/region europe-west3
            gcloud auth configure-docker europe-west3-docker.pkg.dev

            echo Welcome to foresting-tomorrow shell
        ;;
    esac
''
