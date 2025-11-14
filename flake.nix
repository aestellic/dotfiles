{
  description = "Stella's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";  # Use same quickshell version
    };

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    self.submodules = true; # for shimmer
  };

  outputs = { self, nixpkgs, dolphin-overlay, nix-vscode-extensions, ... }@inputs: {
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
        ];
      };
    };
  };
}
