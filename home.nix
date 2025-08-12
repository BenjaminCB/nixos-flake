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
    discord
    bat
    ffmpeg
    fzf
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

    # runner
    walker
    bzmenu # bluetooth in runner
    iwmenu # iwd in runner
    dbus # required for bzmenu and iwmenu

    # stuff for screen mirroring
    wl-mirror
    slurp
    wofi
    pipectl
  ];

  services.dunst.enable = true;

  programs.git = import ./programs/git.nix;
  programs.kitty = import ./programs/kitty.nix;
  programs.zathura = import ./programs/zathura.nix;
  programs.direnv = import ./programs/direnv.nix;
  programs.tofi = import ./programs/tofi.nix {inherit lib;};
  programs.waybar = import ./programs/waybar/waybar.nix {inherit lib;};

  home.file.niri = {
    enable = true;
    recursive = true;
    source = ./programs/niri;
    target = ".config/niri";
  };

  home.file.walekr = {
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
