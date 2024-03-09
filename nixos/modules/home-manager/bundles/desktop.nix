{ pkgs, config, ... }:
{
  myHMModules = {
    kitty.enable = true;
    hyprland.enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "nord";
      theme_background = false;
      vim_keys = true;
      shown_boxes = "cpu mem proc";
      update_ms = 500;
    };
  };

  home.packages = with pkgs;[
    pipes
    s-tui # waiting to fix
  ];

  services.mako = {
    enable = true;
    # backgroundColor = "#${config.colorScheme.colors.base01}";
    # borderColor = "#${config.colorScheme.colors.base0E}";
    borderRadius = 5;
    borderSize = 2;
    # textColor = "#${config.colorScheme.colors.base04}";
    defaultTimeout = 10000;
    layer = "overlay";
  };

}
