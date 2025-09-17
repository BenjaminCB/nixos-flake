# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos"; # Define your hostname.
    # wireless.iwd = {
    #   enable = true;
    #   settings = {
    #     IPv6.Enabled = true;
    #     Settings.AutoConnect = true;
    #   };
    # };
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # wayland
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.udisks2.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      # xdg-desktop-portal-hyprland
      # kdePackages.xdg-desktop-portal-kde
    ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bcb = {
    isNormalUser = true;
    description = "bcb";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = "weekly";
    };
    settings = {
      # enable flakes
      experimental-features = ["nix-command" "flakes"];
      # required for chaching with devenv
      trusted-users = ["root" "bcb"];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${pkgs.afetch}/bin/afetch
      alias ll='${pkgs.eza}/bin/eza -lah'
      set -x MANPAGER "${pkgs.bat}/bin/bat -p --tabs 2 --theme gruvbox-dark"
    '';
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      vim
      git
      fishPlugins.z
      fishPlugins.puffer
      fishPlugins.hydro
    ]
    ++ [
      inputs.nvf.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.wooz.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerd-fonts.fira-code
  ];

  stylix = {
    enable = true;
    base16Scheme = import ./base16.nix;
    # image = ./wallpaper.png;
    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 20;
    };

    fonts = {
      monospace.package = pkgs.nerd-fonts.fira-code;
      monospace.name = "FiraCode Nerd Font Mono";
      sansSerif.package = pkgs.noto-fonts;
      sansSerif.name = "Noto Sans";
      serif.package = pkgs.noto-fonts;
      serif.name = "Noto Serif";
    };
    fonts.sizes = {
      applications = 14;
      terminal = 14;
      desktop = 14;
      popups = 14;
    };
    polarity = "dark";
  };

  # enable docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  # bigger font in tty
  console = {
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
