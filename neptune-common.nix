# Common configurations
{
  config,
  pkgs,
  ...
}: {
  # Skip GRUB menu
  boot.loader.timeout = 0;
  # Configure boot splash
  boot.plymouth.enable = true;
  boot.plymouth.themePackages = with pkgs; [
    nixos-bgrt-plymouth
  ];
  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Enable printing with CUPS
  services.printing.enable = true;
  # Enable file and printer sharing with SAMBA
  services.samba.enable = true;
  # Open firewall ports used by SAMBA
  networking.firewall.allowedUDPPorts = [
    137
    138
  ];
  networking.firewall.allowedTCPPorts = [
    139
    445
  ];
  # Enable the firewall
  networking.firewall.enable = true;
  # Install applications, etc.
  programs.java.enable = true;
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    dbeaver-bin
    discord
    google-chrome
    gradle
    hunspellDicts.en_CA
    hunspellDicts.fr-any
    maven
    nodejs
    podman-desktop
    postman
    python314
    vscode
  ];
  # Automate updates
  system.autoUpgrade.enable = true;
  # Automate Nix store cleanup
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-old";
  };
}