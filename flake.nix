{
  description = "Custom NixOS configurations used by Commander Neptune of Team Galactic";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      cosmic = nixpkgs.lib.nixosSystem {
        imports = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./neptune-common.nix
        ];
        system = "x86_64-linux";
        modules = [({
          config,
          pkgs,
          ...
        }: {
          # Configure boot splash
          boot.plymouth.theme = "bgrt";
          # Desktop environment: COSMIC
          services.displayManager.cosmic-greeter.enable = true;
          services.desktopManager.cosmic.enable = true;
          # Install applications, etc.
          environment.systemPackages = with pkgs; [
            baobab
            drawing
            file-roller
            gnome-calculator
            gnome-characters
            gnome-clocks
            gnome-disk-utility
            gnome-font-viewer
            gnome-logs
            gnome-power-manager
            gnome-sound-recorder
            gnome-system-monitor
            gnome-weather
            libreoffice
            loupe
            papers
            redshift
            snapshot
            simple-scan
            sysprof
          ];
        })];
      };
      gnome = nixpkgs.lib.nixosSystem {
        imports = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./neptune-common.nix
        ];
        system = "x86_64-linux";
        modules = [({
          config,
          pkgs,
          ...
        }: {
          # Configure boot splash
          boot.plymouth.theme = "bgrt";
          # Enable X11 windowing system
          services.xserver.enable = true;
          # Desktop environment: GNOME
          services.xserver.displayManager.gdm.enable = true;
          services.xserver.desktopManager.gnome.enable = true;
          # Exclude unnecessary/outdated applications, etc.
          services.xserver.excludePackages = with pkgs; [
            xterm
          ];
          environment.gnome.excludePackages = with pkgs; [
            decibels
            epiphany
            evince
            gnome-connections
            gnome-maps
          ];
          # Install applications, etc.
          environment.systemPackages = (with pkgs; [
            apostrophe
            drawing
            gnome-browser-connector
            gnome-photos
            gnome-power-manager
            gnome-sound-recorder
            gnome-tweaks
            libreoffice
            orchis-theme
            papers
            snapshot
            sysprof
          ]) ++ (with pkgs.gnomeExtensions; [
            alphabetical-app-grid
            appindicator
            dash-to-dock
            dash-to-panel
            desktop-icons-ng-ding
            favorites-to-applications-grid
            launch-new-instance
            status-icons
            tiling-assistant
            user-themes
          ]);
        })];
      };
      kde = nixpkgs.lib.nixosSystem {
        imports = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./neptune-common.nix
        ];
        system = "x86_64-linux";
        modules = [({
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
        })];
      };
      lxqt = nixpkgs.lib.nixosSystem {
        imports = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./neptune-common.nix
        ];
        system = "x86_64-linux";
        modules = [({
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
            papirus-icon-theme
            qalculate-qt
            vanilla-dmz
            vlc
          ];
        })];
      };
    };
  };
}