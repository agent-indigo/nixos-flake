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
    libreoffice-qt-fresh
    vlc
  ]) ++ (with pkgs.kdePackages; [
    filelight
    kamoso
    kcalc
    kcharselect
    kclock
    kfind
    kolourpaint
    krecorder
    ktorrent
    kweather
    partitionmanager
    plasma-welcome
    skanlite
    skanpage
    sweeper
  ]);
}