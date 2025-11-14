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
  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
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
    dialect
    discord
    drawing
    file-roller
    fragments
    gnome-calculator
    gnome-characters
    gnome-clocks
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-podcasts
    gnome-power-manager
    gnome-secrets
    gnome-sound-recorder
    gnome-system-monitor
    gnome-weather
    google-chrome
    gradle
    hunspellDicts-en_CA
    hunspellDicts.fr-any
    libreoffice
    loupe
    maven
    mousai
    nodejs
    papers
    podman-desktop
    pop-gtk-theme
    postman
    python314
    redshift
    shortwave
    snapshot
    simple-scan
    sysprof
    tuba
    warp
    wike
    wordbook
    vscode
  ];
}