# COSMIC configurations
{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.theme = "bgrt";
  # Desktop environment: COSMIC
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
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