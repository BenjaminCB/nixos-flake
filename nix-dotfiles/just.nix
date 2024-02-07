{ pkgs }:

pkgs.writeText "just" ''
    # Global justfile
    default:
        just --list

    # Show the image in the terminal
    img path:
        kitty +kitten icat {{path}}
''
