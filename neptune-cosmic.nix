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
    baobab
    drawing
    file-roller
    gnome-calculator
    gnome-characters
    gnome-clocks
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    gnome-power-manager
    gnome-sound-recorder
    gnome-system-monitor
    gnome-weather
    libreoffice
    loupe
    papers
    redshift
    snapshot
    simple-scan
    sysprof
  ];
}