{
  config,
  lib,
  pkgs,
  modulesPath,
}: {
  imports = [(
    modulesPath + "/profiles/qemu-guest.nix"
  )];
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "floppy"
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];
  fileSystems."/" = {
    device = "/dev/sda2";
    fsType = "btrfs";
    options = [
      "subvol=@"
    ];
  };
  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}