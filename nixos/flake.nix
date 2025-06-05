{
  description = "NixOS config for workstation with impermanence, KDE, NVIDIA, and dev tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    impermanence.url = "github:nix-community/impermanence";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    ghostty.url = "github:ghostty-org/ghostty";
    
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, impermanence, zen-browser, ghostty, ... }:
    {
      # Per-system outputs
      packages = flake-utils.lib.eachDefaultSystem (system: {
        default = nixpkgs.legacyPackages.${system}.hello;
      });

      # NixOS configurations (not per-system)
      nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";  # Specify your system architecture
        modules = [
          ./hosts/workstation/configuration.nix
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;
            
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";

            home-manager.users.max = import ./home/max.nix;
            home-manager.extraSpecialArgs = {
              inherit zen-browser;
              inherit ghostty;
              system = "x86_64-linux";
            };
          }
        ];
        
        specialArgs = {
          inherit (nixpkgs) lib;
          inherit zen-browser;
	  inherit ghostty;
        };
      };
    };
}
