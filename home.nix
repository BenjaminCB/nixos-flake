{ config, pkgs, ... }:

{
  home.username = "bcb";
  home.homeDirectory = "/home/bcb";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    htop
    luajit
    alacritty
    arandr
    automake
    bat
    ungoogled-chromium
    docker
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
    redshift
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
  };
}
