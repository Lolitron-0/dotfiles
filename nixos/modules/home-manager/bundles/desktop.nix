{ pkgs, config, ... }:
{
  myHMModules = {
    kitty.enable = true;
    hyprland.enable = true;
    eww.enable = true;
    waybar.enable = true;
    gtk.enable = true;
    wlogout.enable = true;
    rofi.enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "oendark";
      theme_background = false;
      vim_keys = true;
      shown_boxes = "cpu mem proc";
      update_ms = 500;
    };
  };

  home.packages = with pkgs;[
    grim
    slurp
    brightnessctl
    playerctl

    pulsemixer
    pavucontrol

    pipes
    cava
    s-tui # waiting to fix

    vscode
    chromium
    doxygen_gui
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
