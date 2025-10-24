{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    musnix.url = "github:musnix/musnix";
  };

  outputs = { self, nixpkgs, musnix }: rec {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          musnix.nixosModules.musnix
          ./modules/default.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
