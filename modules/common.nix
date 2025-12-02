{
  config,
  pkgs,
  ...
}: {
  # Skip boot menu
  boot.loader.timeout = 0;
  # Configure boot splash
  boot.plymouth.enable = true;
  boot.plymouth.themePackages = with pkgs; [
    nixos-bgrt-plymouth
  ];
  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Set time zone
  time.timeZone = "America/St_Johns";
  # Select internationalisation properties
  i18n.defaultLocale = "en_CA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_CA.UTF-8";
    LC_IDENTIFICATION = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_NAME = "en_CA.UTF-8";
    LC_NUMERIC = "en_CA.UTF-8";
    LC_PAPER = "en_CA.UTF-8";
    LC_TELEPHONE = "en_CA.UTF-8";
    LC_TIME = "en_CA.UTF-8";
  };
  # Create users
  # Use `passwd` to create passwords
  users.users.braden = {
    isNormalUser = true;
    description = "Braden Hynes";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Enable printing with CUPS
  services.printing.enable = true;
  # Enable file and printer sharing with SAMBA
  services.samba.enable = true;
  # Open firewall ports used by SAMBA
  networking.firewall.allowedUDPPorts = [
    137
    138
  ];
  networking.firewall.allowedTCPPorts = [
    139
    445
  ];
  # Enable the firewall
  networking.firewall.enable = true;
  # Install applications, etc.
  programs.git.enable = true;
  programs.java.enable = true;
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    dbeaver-bin
    discord
    frostwire-bin
    google-chrome
    gradle
    hunspellDicts.en_CA
    hunspellDicts.fr-any
    maven
    nodejs
    podman-desktop
    postman
    python314
    vscode
  ];
  # Automate updates
  system.autoUpgrade.enable = true;
  # Automate Nix store cleanup
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-old";
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version fo the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}