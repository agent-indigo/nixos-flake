{
  config,
  pkgs,
  ...
}: {
  # Configure boot splash
  boot.plymouth.theme = "bgrt";
  # Enable X11 windowing system
  services.xserver.enable = true;
  # Desktop environment: LXQt
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  # Exclude unnecessary/outdated applications, etc.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  # Install applications, etc.
  environment.systemPackages = (with pkgs; [
    featherpad
    libreoffice-qt-fresh
    lxqt.qlipper
    meteo-qt
    papirus-icon-theme
    qalculate-qt
    qdirstat
    qpdfview
    redshift-qt
    transmission_4-qt
    vanilla-dmz
    vlc
    webcamoid
    xsane
  ]) ++ (with pkgs.kdePackages; [
    kcharselect
    kclock
    kfind
    kolourpaint
    krecorder
    ksystemlog
    partitionmanager
    sweeper
  ]);
}