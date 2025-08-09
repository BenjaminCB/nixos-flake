{
  config,
  pkgs,
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
  ];

  programs.git = import ./programs/git.nix;
  programs.kitty = import ./programs/kitty.nix;
  programs.zathura = import ./programs/zathura.nix;

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
