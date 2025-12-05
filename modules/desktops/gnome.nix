{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.theme = "bgrt";
  # Automatically start transmission daemon on startup
  services.transmission.enable = true;
  # Enable X11 windowing system
  services.xserver.enable = true;
  # Desktop environment: GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Exclude unnecessary/outdated applications, etc.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  environment.gnome.excludePackages = with pkgs; [
    decibels
    epiphany
    evince
    gnome-connections
    gnome-maps
  ];
  # Install applications, etc.
  environment.systemPackages = (with pkgs; [
    drawing
    fragments
    gnome-browser-connector
    gnome-photos
    gnome-power-manager
    gnome-sound-recorder
    gnome-tweaks
    libreoffice-fresh
    orchis-theme
    papers
    sysprof
  ]) ++ (with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    dash-to-dock
    dash-to-panel
    desktop-icons-ng-ding
    favorites-to-applications-grid
    launch-new-instance
    status-icons
    tiling-assistant
    user-themes
  ]);
}