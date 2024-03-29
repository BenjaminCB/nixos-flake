# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, secrets, ... }:

{
    imports = [ # Include the results of the hardware scan.
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText "openssl.cnf" ''
        openssl_conf = openssl_init
        [openssl_init]
        ssl_conf = ssl_sect
        [ssl_sect]
        system_default = system_default_sect
        [system_default_sect]
        Options = UnsafeLegacyRenegotiation
        [system_default_sect]
        CipherString = Default:@SECLEVEL=0
    '';

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

    # Configure keymap in X11
    # services.xserver = {
        # enable = true;
        # layout = "us";
        # xkbVariant = "";
        # libinput.enable = true;
        # displayManager.lightdm.greeters.slick.enable = true;
        # displayManager.defaultSession = "none+awesome";
        # displayManager.lightdm.background = ./wallpapers/nix-wallpaper-nineish-dark-gray.png;
        # windowManager.awesome.enable = true;
        # desktopManager.xfce.enable = true;
    # };
    services.xserver = {
        enable = true;
        displayManager.sddm = {
            enable = true;
            theme = "${import ./derivations/sddm-sugar-dark.nix { inherit pkgs; }}";
        };
        #displayManager.gdm = {
            #enable = true;
            #wayland = true;
        #};
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
    };

    # From vimjoyer nixos + hyprland video
    hardware.opengl.enable = true;

    # location.provider = "geoclue2";
    # services.redshift.enable = true;

    # Enable sound
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.bcb = {
        isNormalUser = true;
        description = "bcb";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    users.defaultUserShell = pkgs.fish;
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            afetch
            alias rr='ranger'
            alias ll='eza -lah'
            alias tree='eza --tree'
            alias lock='xsecurelock'
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
        vim wget firefox discord git
        libsForQt5.qt5.qtquickcontrols2
        libsForQt5.qt5.qtgraphicaleffects
        fishPlugins.hydro
        fishPlugins.z
        fishPlugins.puffer
        fishPlugins.forgit
        afetch
        pgadmin4-desktopmode
    ];

    environment.sessionVariables = rec {
        NNN_FIFO="/tmp/nnn.fifo";
        EDITOR="nvim";
        # Hint electron apps to use wayland
        NIXOS_OZONE_WL = "1";
    };

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    nixpkgs.overlays = [
        (self: super: {
            discord = super.discord.overrideAttrs (
                _: { src = builtins.fetchTarball {
                    url = "https://discord.com/api/download?platform=linux&format=tar.gz";
                    sha256 = "12yrhlbigpy44rl3icir3jj2p5fqq2ywgbp5v3m1hxxmbawsm6wi";
                    # sha256 = "087p8z538cyfa9phd4nvzjrvx4s9952jz1azb2k8g6pggh1vxwm8";
                }; }
            );
        })
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.11"; # Did you read the comment?

    nix = {
        package = pkgs.nixFlakes;
        extraOptions = "experimental-features = nix-command flakes";
    };
}
