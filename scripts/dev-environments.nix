{ pkgs }:

pkgs.writeScriptBin "dev-environments" ''
    environments=`echo "typescript foresting-tomorrow" | tr ' ' '\n' | sort -r`;
    environment=`printf "$environments" | ${pkgs.fzf}/bin/fzf`

    case "$environment" in
        "typescript")
            echo "typescript"
            nix-shell ./scripts/environments/foresting-tomorrow.nix
        ;;
        "foresting-tomorrow")
            echo "foresting-tomorrow"
        ;;
    esac
''
