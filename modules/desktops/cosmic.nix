{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.theme = "bgrt";
  # Automatically start transmission daemon on startup
  services.transmission.enable = true;
  # Desktop environment: COSMIC
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  # Install applications, etc.
  environment.systemPackages = with pkgs; [
    baobab
    cosmic-reader
    drawing
    file-roller
    fragments
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
    libreoffice-fresh
    loupe
    redshift
    snapshot
    simple-scan
    sysprof
  ];
}