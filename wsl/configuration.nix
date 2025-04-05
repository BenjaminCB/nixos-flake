# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, secrets, inputs, ... }:

{
    networking.hostName = "nixos"; # Define your hostname.
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

    console = {
        font = "latarcyrheb-sun32";
        keyMap = "us";
    };

    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.bcb = {
        isNormalUser = true;
        description = "bcb";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = [];
    };

    users.defaultUserShell = pkgs.fish;
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            afetch
            alias rr='ranger'
            alias ll='eza -lah'
            alias tree='eza --tree'
            alias dirimgs='find . -name "*.png" -name "*.jpg" -name "*.gif"  -name "*.svg" -exec echo {} \; -exec wezterm imgcat {} \;'
            alias img='wezterm imgcat'
            set -x MANPAGER "bat -p --tabs 2 --theme gruvbox-dark"
        '';
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        vim wget firefox git
        fishPlugins.hydro
        fishPlugins.z
        fishPlugins.puffer
        fishPlugins.forgit
        afetch
    ];

    environment.sessionVariables = rec {
        NNN_FIFO="/tmp/nnn.fifo";
        EDITOR="nvim";
        # Hint electron apps to use wayland
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
    };

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    stylix = {
        enable = true;
        base16Scheme = import ../base16.nix;
        image = ../wallpapers/hyprland.png;
        cursor.package = pkgs.vimix-cursor-theme;
        cursor.name = "Vimix-Cursors";
        fonts = {
            monospace.package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
            monospace.name = "FiraCode Nerd Font Mono";
            sansSerif.package = pkgs.noto-fonts;
            sansSerif.name = "Noto Sans";
            serif.package = pkgs.noto-fonts;
            serif.name = "Noto Serif";
        };
        fonts.sizes = {
            applications = 14;
            terminal = 18;
            desktop = 14;
            popups = 14;
        };
        polarity = "dark";
    };

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

    nix = {
        package = pkgs.nixFlakes;
        settings.trusted-users = [ "root" "bcb" "@wheel" ];
        extraOptions = "experimental-features = nix-command flakes";
    };
}
