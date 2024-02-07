{ pkgs }:

pkgs.writeText "just" ''
    # Global justfile
    default:
        just --list
''
