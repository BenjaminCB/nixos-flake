{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "bcb";
  home.homeDirectory = "/home/bcb";

  home.packages = with pkgs; [
    firefox
    ungoogled-chromium
    mpv
    pcmanfm
    spotify
    alacritty
    bat
    ffmpeg
    fzf
    dbus # required for bzmenu niri screensharing
    pandoc
    speedtest-cli
    unzip
    zip
    xdg-utils
    poppler_utils
    unrar
    p7zip
    tree-sitter
    acpi
    git-crypt
    just
    gotop
    myxer
    blueman
    obs-studio
    termdown
    devenv
    libreoffice
    typst
    obsidian
    nautilus
    libreoffice
    brightnessctl

    # screenshot
    grim
    slurp # also needed for screen mirroring
    swappy

    # runner
    walker
    bzmenu # bluetooth in runner

    # stuff for screen mirroring
    wl-mirror
    wofi
    pipectl

    # niri important software
    xdg-desktop-portal-gnome
    gnome-keyring
    kdePackages.polkit-kde-agent-1
  ];

  services = {
    dunst.enable = true;
    wpaperd = {
      enable = true;
      settings.default.path = ./wallpapers/wallpaper.png;
    };
    udiskie = {
      enable = true;
      settings.program_options.file_manager = "${pkgs.pcmanfm}/bin/pcmanfm";
    };
  };

  programs.git = import ./programs/git.nix;
  programs.kitty = import ./programs/kitty.nix;
  programs.zathura = import ./programs/zathura.nix;
  programs.direnv = import ./programs/direnv.nix;
  programs.tofi = import ./programs/tofi.nix {inherit lib;};
  programs.waybar = import ./programs/waybar/waybar.nix {inherit lib;};

  home.file.walker = {
    enable = true;
    recursive = true;
    source = ./programs/walker;
    target = ".config/walker";
  };

  home.file.justfile = {
    enable = true;
    source = ./programs/justfile;
    target = "justfile";
  };

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
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
