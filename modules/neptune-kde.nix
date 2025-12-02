# KDE configurations
{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.themePackages = with pkgs.kdePackages; [
    breeze-plymouth
  ];
  boot.plymouth.theme = "breeze";
  # Desktop environment: KDE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  # Exclude unnecessary/outdated applications, etc.
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];
  # Install applications, etc.
  environment.systemPackages = (with pkgs; [
    libreoffice-qt
    vlc
  ]) ++ (with pkgs.kdePackages; [
    filelight
    # Kamoso is broken, apparently
    # kamoso
    kcalc
    kclock
    kcharselect
    kfind
    kolourpaint
    krecorder
    kweather
    partitionmanager
    plasma-welcome
    skanlite
    skanpage
    sweeper
  ]);
}