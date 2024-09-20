{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland-contrib = {
            url = "github:hyprwm/contrib";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix.url = "github:danth/stylix";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@attrs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
        secrets = import ./secrets.nix;
        extraArgs = attrs // {
            secrets = secrets;
            pkgs-stable = import nixpkgs-stable {
                inherit system;
                config.allowUnfree = true;
            };
        };
        nixosSystem = { system, pkgs, configuration, homes }: lib.nixosSystem {
            inherit system;
            modules = [
                configuration
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.bcb = {
                        imports = homes;
                    };
                    home-manager.extraSpecialArgs = extraArgs;
                }
                attrs.stylix.nixosModules.stylix
            ];
            specialArgs = extraArgs;
        };
    in {
        nixosConfigurations = {
            desktop = nixosSystem {
                inherit system pkgs;
                configuration = ./desktop/configuration.nix;
                homes = [ ./home.nix ./desktop/home.nix ];
            };
            laptop = nixosSystem {
                inherit system pkgs;
                configuration = ./laptop/configuration.nix;
                homes = [ ./home.nix ./laptop/home.nix ];
            };
            testtop = nixosSystem {
                inherit system pkgs;
                configuration = ./testtop/configuration.nix;
                homes = [ ./home.nix ];
            };
        };
    };
}
