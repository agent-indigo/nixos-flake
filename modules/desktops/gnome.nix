{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.theme = "bgrt";
  # Automatically start transmission daemon on startup
  services.transmission.enable = true;
  # Desktop environment: GNOME
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  # Exclude unnecessary/outdated applications, etc.
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    evince
    gnome-connections
    gnome-maps
    gnome-music
    totem
  ];
  # Install applications, etc.
  environment.systemPackages = (with pkgs; [
    adw-gtk3
    audacity
    drawing
    fragments
    gnome-browser-connector
    gnome-power-manager
    gnome-sound-recorder
    gnome-tweaks
    libreoffice-fresh
    papers
    pitivi
    showtime
    sysprof
  ]) ++ (with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    dash-to-dock
    dash-to-panel
    desktop-icons-ng-ding
    keep-pinned-apps-in-appgrid
    launch-new-instance
    light-style
    pop-shell
    status-icons
    user-themes
  ]);
}