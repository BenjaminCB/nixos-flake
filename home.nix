{ config, pkgs, ... }:

{
    home.username = "bcb";
    home.homeDirectory = "/home/bcb";
    home.stateVersion = "22.11";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        ncpamixer
        kitty
        neovim
        htop
        luajit
        alacritty
        arandr
        automake
        bat
        ungoogled-chromium
        fd
        ffmpeg
        flameshot
        fzf
        gimp
        gotop
        haskell-language-server
        mpv
        ncdu
        pandoc
        pcmanfm
        ranger
        ripgrep
        rofi
        spotify
        speedtest-cli
        sxiv
        thunderbird
        ueberzug
        unzip
        vim
        wmname
        xclip
        xdg-utils
        zathura
        zip
        gcc
        nodejs
        nitrogen
    ];

    home.file = {
        ".config/awesome".source = ./dotfiles/awesome;
        ".config/bspwm".source = ./dotfiles/bspwm;
        ".config/bsp-layout".source = ./dotfiles/bsp-layout;
        ".config/dunst".source = ./dotfiles/dunst;
        ".config/fish".source = ./dotfiles/fish;
        ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
        ".config/kitty".source = ./dotfiles/kitty;
        ".config/nvim".source = ./dotfiles/nvim;
        ".config/qutebrowser".source = ./dotfiles/qutebrowser;
        ".config/ranger".source = ./dotfiles/ranger;
        ".config/rofi".source = ./dotfiles/rofi;
        ".config/zathura".source = ./dotfiles/zathura;
        ".config/redshift.conf".source = ./dotfiles/redshift.conf;
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
            "application/pdf" = "org.pwmt.zathura.desktop";
            "image/png" = "sxiv.desktop";
            "image/jpeg" = "sxiv.desktop";
            "text/html" = "firefox.desktop";
            "application/x-extension-htm" = "firefox.desktop";
            "application/x-extension-html" = "firefox.desktop";
            "application/x-extension-shtml" = "firefox.desktop";
            "application/xhtml+xml" = "firefox.desktop";
            "application/x-extension-xhtml" = "firefox.desktop";
            "application/x-extension-xht" = "firefox.desktop";
            "application/x-www-browser" = "firefox.desktop";
            "x-www-browser" = "firefox.desktop";
        };
    };

    home.file.".config/nvim-spell/spell/da.utf-8.spl".source = builtins.fetchurl {
        url = "http://ftp.vim.org/vim/runtime/spell/da.utf-8.spl";
        sha256 = "0cl9q1ln7y4ihbpgawl3rc86zw8xynq9hg4hl8913dbmpcl2nslj";
    };

    home.file.".config/nvim-spell/spell/da.utf-8.sug".source = builtins.fetchurl {
        url = "http://ftp.vim.org/vim/runtime/spell/da.utf-8.sug";
        sha256 = "1pdnp0hq3yll65z6rlmq0l6axvn5450jw5y081vyb4x5850czdxm";
    };
}
