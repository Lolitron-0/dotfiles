{ pkgs, config, outputs, ... }:
let
  startScript = pkgs.writeShellScriptBin "hyprinit" ''
    	${pkgs.swww}/bin/swww init &

    	${pkgs.networkmanagerapplet}/bin/nm-applet --indicator & 

    	hyprctl setcursor Bibata-Modern-Ice 16 &

    	systemctl --user import-environment PATH &
    	systemctl --user restart xdg-desktop-portal.service &

    	waybar &

    	sleep 2
    	${pkgs.swww}/bin/swww img ${./Snow-valley.jpg} &
  '';

  bindMap = import ./bindMap.nix;
in
{
  imports = [ ./monitors.nix ];

  config = {

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;
        };

        monitor =
          map
            (
              m:
              let
                resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
                position = "${toString m.x}x${toString m.y}";
              in

              "${m.name},${
				if m.enabled 
				then "${resolution},${position},1"
				else "disabled"
			}"
            )
            (config.myHMModules.monitors);

        env = [
          "XCURSOR_SIZE,24"
        ];

        input = {
          kb_layout = "us,ru";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = false;
          };

          repeat_rate = 40;
          repeat_delay = 250;
          force_no_accel = true;

          sensitivity = 0.2; # -1.0 to 1.0, 0 means no modification.
        };

        misc = {
          force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        };
        decoration = {

          rounding = 5;

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };

          drop_shadow = true;
          shadow_range = 30;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
        };

        animations = {
          enabled = true;

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
        };

        master = {
          new_is_master = true;
        };

        gestures = {
          workspace_swipe = true;
        };

        device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };

        windowrulev2 = [
          "suppressevent maximize, class:.*"
        ];

        windowrule = [
          # "opacity 0.5 override 0.5 override,^(kitty)$"
        ];

        # Binds
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$menu" = "rofi -show drun -show-icons";
        #"$menu-command" = "wofi --show drun";

        bind = bindMap.bind;
        binde = bindMap.binde;
        bindm = bindMap.bindm;

        exec-once = [
          "${pkgs.bash}/bin/bash ${startScript}/bin/hyprinit"
        ];
      };
    };

    home.packages = with pkgs; [
      (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
      )

      mako
      libnotify

      swww
      networkmanagerapplet

      rofi-wayland
      wofi
    ];
  };
}
