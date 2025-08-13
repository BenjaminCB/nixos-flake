{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:BenjaminCB/nvf";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./configuration.nix
          ./desktop-hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bcb = ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # extraSpecialArgs = ...
          }
        ];
        specialArgs = {inherit inputs;};
      };
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./configuration.nix
          ./laptop-hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bcb = [
              ./home.nix
              (_: let
                monitorConfig = import ./programs/niri/laptop-monitor-config.nix;
                niriConfig = import ./programs/niri/config.nix {inherit monitorConfig;};
              in {
                home.file.niri = {
                  enable = true;
                  recursive = true;
                  text = niriConfig;
                  target = ".config/niri/config.kdl";
                };
              })
            ];

            # Optionally, use home-manager.extraSpecialArgs to pass
            # extraSpecialArgs = ...
          }
        ];
        specialArgs = {inherit inputs;};
      };
    };
  };
}
