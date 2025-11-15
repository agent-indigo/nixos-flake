# COSMIC configuration
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Import common configurations
    ./neptune-common.nix
  ];
  # Desktop environment: COSMIC
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  # Set Plymouth theme
  boot.plymouth.theme = "bgrt";
  # Install applications, etc.
  environment.systemPackages = with pkgs; [
    apostrophe
    baobab
    dialect
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
    libreoffice
    loupe
    mousai
    papers
    redshift
    shortwave
    snapshot
    simple-scan
    sysprof
    tuba
    warp
    wike
    wordbook
  ];
}