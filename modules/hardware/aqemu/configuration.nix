{
  config,
  pkgs,
  ...
}: {
  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # Hide GRUB menu
  boot.loader.grub.timeoutStyle = "hidden";
  # Enable networking
  networking.networkmanager.enable = true;
}