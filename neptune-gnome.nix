# GNOME configuration
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Import common configurations
    ./neptune-common.nix
  ];
  # Enable X11 windowing system
  services.xserver.enable = true;
  # Desktop environment: GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Set Plymouth theme
  boot.plymouth.theme = "bgrt";
  # Exclude unnecessary/outdated applications, etc.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  environment.gnome.excludePackages = with pkgs; [
    decibels
    epiphany
    evince
  ];
  # Install applications, etc.
  environment.systemPackages = with pkgs; [
    apostrophe
    dialect
    drawing
    fragments
    gnome-browser-connector
    gnome-photos
    gnome-podcasts
    gnome-power-manager
    gnome-secrets
    gnome-sound-recorder
    gnome-tweaks
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.desktop-icons-ng-ding
    gnomeExtensions.favorites-to-applications-grid
    gnomeExtensions.launch-new-instance
    gnomeExtensions.status-icons
    gnomeExtensions.tiling-assistant
    gnomeExtensions.user-themes
    libreoffice
    mousai
    orchis-theme
    papers
    shortwave
    snapshot
    sysprof
    tuba
    warp
    wike
    wordbook
  ];
}