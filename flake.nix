{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland-contrib = {
            url = "github:hyprwm/contrib";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@attrs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            desktop = lib.nixosSystem {
                inherit system;
                modules = [
                    ./desktop/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.bcb = {
                            imports = [ ./home.nix ./desktop/home.nix ];
                        };
                    }
                ];
                specialArgs = attrs;
            };
            laptop = lib.nixosSystem {
                inherit system;
                modules = [
                    ./laptop/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.bcb = {
                            imports = [ ./home.nix ./laptop/home.nix ];
                        };
                    }
                ];
                specialArgs = attrs;
            };
            testtop = lib.nixosSystem {
                inherit system;
                modules = [
                    ./testtop/configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.bcb = {
                            imports = [ ./home.nix ];
                        };
                    }
                ];
                specialArgs = attrs;
            };
        };
    };
}
