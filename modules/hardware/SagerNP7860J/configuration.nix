{
  config,
  pkgs,
  ...
}: {
  # Configure X11 keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}