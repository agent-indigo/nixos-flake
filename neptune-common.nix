# Common configurations
{
  config,
  pkgs,
  ...
}: {
  # Enable automatic updates
  system.autoUpgrade.enable = true;
  # Skip GRUB menu
  boot.loader.timeout = 0;
  boot.loader.grub.timeoutStyle = "hidden";
  # Configure boot splash
  boot.plymouth.enable = true;
  boot.plymouth.themePackages = with pkgs; [
    nixos-bgrt-plymouth
  ];
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  # Open firewall ports for Active Directory services
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
  # Enable Active Directory client services
  services.realmd.enable = true;
  services.samba.enable = true;
  services.sssd.enable = true;
  # Install applications, etc.
  programs.java.enable = true;
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    adcli
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
}