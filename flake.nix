{
  description = "Custom NixOS configurations used by Commander Neptune of Team Galactic";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = rec {
      cosmic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix
          /etc/nixos/hardware-configuration.nix
          ./modules/neptune-common.nix
          ./modules/neptune-cosmic.nix
        ];
      };
      gnome = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix
          /etc/nixos/hardware-configuration.nix
          ./modules/neptune-common.nix
          ./modules/neptune-gnome.nix
        ];
      };
      kde = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix
          /etc/nixos/hardware-configuration.nix
          ./modules/neptune-common.nix
          ./modules/neptune-kde.nix
        ];
      };
      lxqt = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix
          /etc/nixos/hardware-configuration.nix
          ./modules/neptune-common.nix
          ./modules/neptune-lxqt.nix
        ];
      };
      nixos = gnome;
    };
  };
}