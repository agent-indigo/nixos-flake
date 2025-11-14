{
  config,
  pkgs,
  ...
}: {
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
  # Desktop environment: COSMIC on Wayland
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
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
    baobab
    dbeaver-bin
    discord
    drawing
    file-roller
    fragments
    gnome-calculator
    gnome-characters
    gnome-clocks
    gnome-disk-utility
    gnome-font-viewer
    gnome-maps
    gnome-sound-recorder
    gnome-logs
    gnome-system-monitor
    gnome-weather
    google-chrome
    gradle
    hunspellDicts-en_CA
    hunspellDicts.fr-any
    libreoffice
    loupe
    maven
    nodejs
    papers
    podman-desktop
    pop-gtk-theme
    postman
    python314
    redshift
    snapshot
    simple-scan
    sysprof
    vscode
  ];
}