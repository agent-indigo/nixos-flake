# LXQt configurations
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
    vanilla-dmz
    vlc
  ]) ++ (with pkgs.kdePackages; [
    filelight
    # Kamoso is broken, apparently
    # kamoso
    kclock
    kcharselect
    kfind
    kolourpaint
    krecorder
    ksystemlog
    kweather
    okular
    partitionmanager
    skanlite
    skanpage
    sweeper
  ]);
}