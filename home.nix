{ config, pkgs, ... }:

let
    link = config.lib.file.mkOutOfStoreSymlink;
    xwaylandvideobridge = import ./derivations/xwayland-video-bridge.nix { inherit pkgs; };
    dev-environments = import ./derivations/dev-environments.nix { inherit pkgs; };
    dir-jumper = import ./derivations/dir-jumper.nix { inherit pkgs; };
    work-monitor = import ./derivations/work-monitor.nix { inherit pkgs; };
    gruvboxplus = import ./derivations/gruvboxplus.nix { inherit pkgs; };
in
{
    home.username = "bcb";
    home.homeDirectory = "/home/bcb";
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;

    home.packages = [
        dev-environments work-monitor xwaylandvideobridge dir-jumper
    ] ++ (with pkgs; [
        ### gui applications
        ungoogled-chromium gimp mpv pcmanfm spotify
        kitty alacritty insomnia thunderbird zathura sxiv

        # rofi -- not wayland compatible
        tofi

        # arandr -- not wayland compatible
        # flameshot -- does not seem to work
        grim slurp

        ### term applications
        ncpamixer
        gotop
        # ranger is not working with ueberzug
        # (ranger.overrideAttrs (r: {
        #   preConfigure = r.preConfigure + ''
        #     # Specify path to Überzug
        #     substituteInPlace ranger/ext/img_display.py \
        #       --replace "Popen(['ueberzug'" \
        #                 "Popen(['${pkgs.ueberzug}/bin/ueberzug'"
        #     # Use Überzug as the default method
        #     substituteInPlace ranger/config/rc.conf \
        #       --replace 'set preview_images_method w3m' \
        #                 'set preview_images_method ueberzug'
        #   '';
        # }))

        ### utilities
        automake bat fd ffmpeg fzf ncdu pandoc lsix ripgrep
        speedtest-cli unzip zip wmname xclip xdg-utils poppler_utils
        unrar p7zip tree-sitter acpi
        # nitrogen -- not wayland compatible, or maybe it is?
        wpaperd
        ### programming stuff
        luajit gcc yarn texlive.combined.scheme-full coq_8_9 nodejs
    ]);

    programs.foot = {
        enable = false;
        server.enable = true;
        settings.main = {
            term = "xterm-256color";
            font = "FiraCode:size=18";
            dpi-aware = "yes";
        };
        settings.mouse.hide-when-typing = "yes";
        settings.colors.background = "282828";
    };

    programs.wezterm = {
        enable = true;
        colorSchemes.myTheme.background = "#282828";
        extraConfig = ''
            return {
                font = wezterm.font("FiraCode"),
                font_size = 18.0,
                color_scheme = "myTheme",
                hide_mouse_cursor_when_typing = false
            }
        '';
    };

    programs.lf = {
        enable = true;
        previewer.source = pkgs.writeShellScript "pv.sh" ''
            case "$1" in
                *.tar*) ${pkgs.gnutar}/bin/tar tf "$1";;
                *.zip) ${pkgs.unzip}/bin/unzip -l "$1";;
                *.rar) ${pkgs.unrar}/bin/unrar l "$1";;
                *.7z) ${pkgs.p7zip}/bin/7z l "$1";;
                *.png) ${pkgs.libsixel}/bin/img2sixel "$1";;
                *.jpg) ${pkgs.libsixel}/bin/img2sixel "$1";;
                *.jpeg) ${pkgs.libsixel}/bin/img2sixel "$1";;
                *) highlight -O ansi "$1" || cat "$1";;
            esac
        '';
    };

    programs.neovim = {
        enable = true;
        withNodeJs = true;
    };

    programs.git = {
        enable = true;
        delta.enable = true;
        userEmail = "benjamincb@hotmail.dk";
        userName = "bcb";
    };

    services.dunst.enable = true;

    gtk = {
        enable = true;
        cursorTheme.package = pkgs.bibata-cursors;
        cursorTheme.name = "Bibata-Modern-Ice";
        theme.package = pkgs.adw-gtk3;
        theme.name = "adw-gtk3";
        iconTheme.package = gruvboxplus;
        iconTheme.name = "GruvboxPlus";
    };

    qt = {
        enable = true;
        platformTheme = "gtk";
        style.name = "breeze-dark";
        style.package = pkgs.adwaita-qt;
    };

    home.file = {
        ".config/dunst".source = ./dotfiles/dunst;
        ".config/awesome".source = ./dotfiles/awesome;
        ".config/bspwm".source = ./dotfiles/bspwm;
        ".config/bsp-layout".source = ./dotfiles/bsp-layout;
        #".config/fish".source = ./dotfiles/fish;
        ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
        ".config/kitty".source = ./dotfiles/kitty;
        #".config/nvim".source = link ./dotfiles/nvim;
        ".config/qutebrowser".source = ./dotfiles/qutebrowser;
        #".config/ranger".source = ./dotfiles/ranger;
        ".config/rofi".source = ./dotfiles/rofi;
        ".config/zathura".source = ./dotfiles/zathura;
        ".config/redshift.conf".source = ./dotfiles/redshift.conf;
        ".config/tofi".source = ./dotfiles/tofi;
        ".config/hypr".source = ./dotfiles/hypr;
        ".jira.d".source = ./dotfiles/jira.d;
        ".vieb".source = ./dotfiles/vieb;
        ".Xresources".source = ./dotfiles/Xresources;
        ".bashrc".source = ./dotfiles/bashrc;
        ".ghci".source = ./dotfiles/ghci;
        ".taskrc".source = ./dotfiles/taskrc;
        ".xinitrc".source = ./dotfiles/xinitrc;
        "wallpapers".source = ./wallpapers;
    };

    # xdg-open to open
    # $XDG_DATA_DIRS to find .desktop names
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf"               = "org.pwmt.zathura.desktop";
            "image/png"                     = "sxiv.desktop";
            "image/jpeg"                    = "sxiv.desktop";
            "text/html"                     = "firefox.desktop";
            "application/x-extension-htm"   = "firefox.desktop";
            "application/x-extension-html"  = "firefox.desktop";
            "application/x-extension-shtml" = "firefox.desktop";
            "application/xhtml+xml"         = "firefox.desktop";
            "application/x-extension-xhtml" = "firefox.desktop";
            "application/x-extension-xht"   = "firefox.desktop";
            "application/x-www-browser"     = "firefox.desktop";
            "x-www-browser"                 = "firefox.desktop";
            "x-scheme-handler/http"         = "firefox.desktop";
            "x-scheme-handler/https"        = "firefox.desktop";
            "x-scheme-handler/about"        = "firefox.desktop";
            "x-scheme-handler/unknown"      = "firefox.desktop";
        };
    };
}
