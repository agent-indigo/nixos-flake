# LXQt configuration
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
  # Desktop environment: LXQt
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  # Set Plymouth theme
  boot.plymouth.theme = "bgrt";
  # Exclude unnecessary/outdated applications, etc.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  # Install applications, etc.
  environment.systemPackages = with pkgs; [
    featherpad
    kdePackages.filelight
    # Kamoso is broken, apparently
    # kdePackages.kamoso
    kdePackages.kclock
    kdePackages.kcharselect
    kdePackages.kfind
    kdePackages.kolourpaint
    kdePackages.krecorder
    kdePackages.ksystemlog
    kdePackages.kweather
    kdePackages.okular
    kdePackages.partitionmanager
    kdePackages.skanlite
    kdePackages.skanpage
    kdePackages.sweeper
    libreoffice-qt
    lxqt.qlipper
    qalculate-qt
    transmission_4-qt
    vlc
  ];
}