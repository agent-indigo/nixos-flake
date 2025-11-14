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
    nixos-bgrt-plymouth
  ];
  boot.plymouth.theme = "bgrt";
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
  # Enable X11 windowing system
  services.xserver.enable = true;
  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Desktop environment: GNOME
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  # Exclude unnecessary/outdated applications, etc.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  environment.gnome.excludePackages = with pkgs; [
    decibels
    epiphany
    evince
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
    dialect
    discord
    drawing
    fragments
    gnome-browser-connector
    gnome-extension-manager
    gnome-photos
    gnome-podcasts
    gnome-power-manager
    gnome-secrets
    gnome-sound-recorder
    google-chrome
    gradle
    hunspellDicts-en_CA
    hunspellDicts.fr-any
    libreoffice
    maven
    mousai
    nodejs
    papers
    podman-desktop
    postman
    python314
    shortwave
    sysprof
    tuba
    vscode
    warp
    wike
    wordbook
  ];
}