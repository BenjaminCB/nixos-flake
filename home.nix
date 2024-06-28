{ config, pkgs, secrets, ... }:

let
    link = config.lib.file.mkOutOfStoreSymlink;
    dev-environments = import ./derivations/dev-environments.nix { inherit pkgs; };
    zfzf = import ./derivations/zfzf.nix { inherit pkgs; };
    work-monitor = import ./derivations/work-monitor.nix { inherit pkgs; };
    dir-imgs = import ./derivations/dir-imgs.nix { inherit pkgs; };
in
{
    home.username = "bcb";
    home.homeDirectory = "/home/bcb";
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;

    home.packages = [
        dev-environments work-monitor zfzf dir-imgs
    ] ++ (with pkgs; [
        ### gui applications
        ungoogled-chromium gimp mpv pcmanfm spotify
        alacritty insomnia thunderbird zathura sxiv
        webcord

        # rofi -- not wayland compatible
        tofi

        # arandr -- not wayland compatible
        grim slurp swappy

        ### term applications
        ncpamixer gotop chatgpt-cli

        ### utilities
        automake bat fd ffmpeg fzf ncdu pandoc lsix ripgrep
        speedtest-cli unzip zip wmname xclip xdg-utils poppler_utils
        unrar p7zip tree-sitter acpi git-crypt kitty-themes just mermaid-cli
        xwaylandvideobridge
        # nitrogen -- not wayland compatible, or maybe it is?

        ### programming stuff
        luajit gcc yarn coq_8_9 nodejs lua-language-server nixd
    ]);

    programs.foot = import ./nix-dotfiles/foot.nix;
    programs.wezterm = import ./nix-dotfiles/wezterm.nix // { enable = false; };
    programs.kitty = import ./nix-dotfiles/kitty.nix // { enable = true; };
    programs.lf = (import ./nix-dotfiles/lf.nix { inherit pkgs; }) // { enable = true; };
    programs.neovim = import ./nix-dotfiles/neovim/neovim.nix { inherit pkgs secrets; };
    programs.git = import ./nix-dotfiles/git.nix;
    programs.direnv = import ./nix-dotfiles/direnv.nix;
    programs.eza = { enable = true; };

    gtk = import ./nix-dotfiles/gtk.nix { inherit pkgs; };
    qt = import ./nix-dotfiles/qt.nix { inherit pkgs; };

    services.dunst.enable = true;

    home.file = {
        "justfile".source = import ./nix-dotfiles/just.nix { inherit pkgs; };
        ".config/chatgpt/config.json".text =
            builtins.toJSON (import ./nix-dotfiles/chatgpt-cli.nix { inherit secrets; });
        ".config/dunst".source = ./dotfiles/dunst;
        ".config/awesome".source = ./dotfiles/awesome;
        ".config/bspwm".source = ./dotfiles/bspwm;
        ".config/bsp-layout".source = ./dotfiles/bsp-layout;
        ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
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
