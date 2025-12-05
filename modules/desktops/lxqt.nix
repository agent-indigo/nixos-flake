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
    libreoffice-qt
    lxqt.qlipper
    papirus-icon-theme
    qalculate-qt
    qdirstat
    qpdfview
    transmission_4-qt
    vanilla-dmz
    vlc
    webcamoid
  ]) ++ (with pkgs.kdePackages; [
    kclock
    kcharselect
    kfind
    kolourpaint
    krecorder
    ksystemlog
    kweather
    partitionmanager
    skanlite
    skanpage
    sweeper
  ]);
}