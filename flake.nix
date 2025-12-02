{
  description = "Custom NixOS configurations used by Commander Neptune of Team Galactic";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      cosmic = nixpkgs.lib.nixosSystem {
        imports = [
          /etc/nixos/configuration.nix
          ./neptune-cosmic.nix
        ];
        system = "x86_64-linux";
      };
      gnome = nixpkgs.lib.nixosSystem {
        imports = [
          /etc/nixos/configuration.nix
          ./neptune-gnome.nix
        ];
        system = "x86_64-linux";
      };
      kde = nixpkgs.lib.nixosSystem {
        imports = [
          /etc/nixos/configuration.nix
          ./neptune-kde.nix
        ];
        system = "x86_64-linux";
      };
      lxqt = nixpkgs.lib.nixosSystem {
        imports = [
          /etc/nixos/configuration.nix
          ./neptune-lxqt.nix
        ];
        system = "x86_64-linux";
      };
    };
  };
}