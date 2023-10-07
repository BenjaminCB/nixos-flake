{ pkgs }:

{
    enable = true;

    settings = {
        preview = true;
        hidden = true;
        drawbox = true;
        icons = false; # TODO enable icons, but need to retrieve the files
        ignorecase = true;
    };

    commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
        editor-open = ''$$EDITOR $f'';
        mkdir =''
        ''${{
            printf "Diroctory Name: "
            read DIR
            mkdir $DIR
        }}
        '';
    };

    keybindings = {
        "\\\"" = "";
        o = "";
        c = "mkdir";
        "." = "set hidden!";
        "`" = "mark-load";
        "\\'" = "mark-load";
        "<enter>" = "open";
        do = "dragon-out";
        "g~" = "cd";
        gh = "cd";
        "g/" = "/";
        ee = "editor-open";
        V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
    };

    extraConfig =
    let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
            file=$1
            w=$2
            h=$3
            x=$4
            y=$5

            if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file" )" =~ ^image ]]; then
                # TODO look into wezterm imgcat
                exit 1
            fi

            ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" '''';
    in
    ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
    '';


}
