{ pkgs, config, ... }:
{
  myHMModules = {
    kitty.enable = true;
  };

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

  home.packages = with pkgs; [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    })
    )

    wl-clipboard

    mako
    libnotify

    swww
    rofi-wayland
    networkmanagerapplet

  ];
}
