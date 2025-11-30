# KDE configuration
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Import common configurations
    ./neptune-common.nix
  ];
  # Desktop environment: KDE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  # Set Plymouth theme
  boot.plymouth.themePackages = with pkgs.kdePackages; [
    breeze-plymouth
  ];
  boot.plymouth.theme = "breeze";
  # Exclude unnecessary/outdated applications, etc.
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];
  # Install applications, etc.
  environment.systemPackages = with pkgs; [
    kdePackages.filelight
    # Kamoso is broken, apparently
    # kdePackages.kamoso
    kdePackages.kcalc
    kdePackages.kclock
    kdePackages.kcharselect
    kdePackages.kfind
    kdePackages.kolourpaint
    kdePackages.krecorder
    kdePackages.kweather
    kdePackages.partitionmanager
    kdePackages.plasma-welcome
    kdePackages.skanlite
    kdePackages.skanpage
    kdePackages.sweeper
    libreoffice-qt
    vlc
  ];
}