{
  config,
  pkgs,
  ...
}: {
  # Skip GRUB menu
  boot.loader.timeout = 0;
  boot.loader.grub.timeoutStyle = "hidden";
  # Configure Plymouth
  boot.plymouth.enable = true;
  boot.plymouth.themePackages = with pkgs; [
    kdePackages.breeze-plymouth
    nixos-bgrt-plymouth
  ];
  boot.plymouth.theme = "breeze";
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  # Allow non free packages
  nixpkgs.config.allowUnfree = true;
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
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Desktop environment: KDE on Wayland
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  # Exclude Elisa
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];
  # Enable printing (CUPS)
  services.printing.enable = true;
  # Enable Active Directory services
  services.realmd.enable = true;
  services.samba.enable = true;
  services.sssd.enable = true;
  # Install applications, etc.
  programs.git.enable = true;
  programs.java.enable = true;
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    adcli
    dbeaver-bin
    discord
    google-chrome
    gradle
    hunspellDicts-en_CA
    hunspellDicts.fr-any
    libreoffice-qt
    maven
    nodejs
    podman-desktop
    postman
    python314
    vscode
    vlc
  ];
}