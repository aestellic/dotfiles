{
  description = "Stella's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    self.submodules = true; # for shimmer
  };

  outputs = { self, nixpkgs, stylix, dolphin-overlay, nix-vscode-extensions, ... }@inputs: {
    nixosConfigurations = {
      stellaPC = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          # Fix Dolphin "Open With" Dialog
          ({ config, pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            nixpkgs.overlays = [ 
              dolphin-overlay.overlays.default
              nix-vscode-extensions.overlays.default
            ];
          })

          # Modules
          ./hosts/stellaPC/configuration.nix
          ./common/config/noctalia/noctalia.nix
          inputs.home-manager.nixosModules.default
          stylix.nixosModules.stylix
        ];
      };
      
      stellaLaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          # Fix Dolphin "Open With" Dialog
          ({ config, pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            nixpkgs.overlays = [ 
              dolphin-overlay.overlays.default
              nix-vscode-extensions.overlays.default
            ];
          })

          # Modules
          ./hosts/stellaLaptop/configuration.nix
          ./common/config/noctalia/noctalia.nix
          inputs.home-manager.nixosModules.default
          stylix.nixosModules.stylix
        ];
      };
    };
  };
}
