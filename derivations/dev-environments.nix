{ pkgs }:

pkgs.writeScriptBin "dev-environments" ''
    environments=`echo "typescript foresting-tomorrow" | tr ' ' '\n' | sort -r`;
    environment=`printf "$environments" | ${pkgs.fzf}/bin/fzf`

    case "$environment" in
        "typescript")
            echo "typescript"
        ;;
        "foresting-tomorrow")
            echo "foresting-tomorrow"
            nix-shell ~/nixos-flake/derivations/environments/foresting-tomorrow.nix
        ;;
    esac
''
