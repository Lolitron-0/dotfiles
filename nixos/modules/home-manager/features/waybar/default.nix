{ pkgs
, config
, ...
}:
let
  scripts = import ./scripts.nix { inherit pkgs; };

  workspaces = {
    format = "{icon}";
    format-icons = {
      "1" = "";
      "2" = "";
      "3" = "";
      active = "";
      default = "";
      urgent = "";
    };
    on-click = "activate";
    # persistent_workspaces = { "*" = 10; };
  };

  mainConfig = {
    mode = "dock";
    layer = "top";
    position = "top";
    gtk-layer-shell = true;
    wlr-layer-shell = false;
    margin-top = 10;
    margin-left = 10;
    margin-right = 10;
    reload_style_on_change = true;

    modules-left = [
      "custom/logo"
      "hyprland/workspaces"
      "cava"
    ];
    modules-center = [ "hyprland/window" ];
    modules-right = [
      "pulseaudio"
      "pulseaudio/slider"
      "hyprland/language"
      "bluetooth"
      "battery"
      "clock"
      "tray"
    ];

    "wlr/workspaces" = workspaces;
    "hyprland/workspaces" = workspaces;

    bluetooth = {
      format = "";
      format-connected = " {num_connections}";
      format-disabled = "";
      tooltip-format = " {device_alias}";
      tooltip-format-connected = "{device_enumerate}";
      tooltip-format-enumerate-connected = " {device_alias}";
    };

    battery = {
      format-icons = [ "" "" "" "" "" ];
      format = "  {icon}  ";
    };

    clock = {
      actions = {
        on-click-backward = "tz_down";
        on-click-forward = "tz_up";
        on-click-right = "mode";
        on-scroll-down = "shift_down";
        on-scroll-up = "shift_up";
      };
      calendar = {
        format = {
          days = "<span color='#ecc6d9'><b>{}</b></span>";
          months = "<span color='#ffead3'><b>{}</b></span>";
          today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
        };
        mode = "month";
        mode-mon-col = 3;
        on-click-right = "mode";
        on-scroll = 1;
        weeks-pos = "right";
      };
      format = "{:%H:%M}";
      format-alt = "󰥔 {:%A, %B %d, %Y (%R)} ";
      # tooltip-format = ''
      #   <span size='9pt' font='Droid Sans Mono'>{calendar}</span>'';
    };

    cpu = {
      format = "󰍛 {usage}%";
      format-alt = "{icon0}{icon1}{icon2}{icon3}";
      format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      interval = 10;
    };

    "custom/logo" = {
      exec = "echo ' '";
	  exec-on-event = false;
      format = "{}";
      on-double-click = "wlogout -b 2 -m 50";
	  tooltip = false;
    };

    "hyprland/window" = {
      format = "{}";
      rewrite = {
        "(.*) — Mozilla Firefox" = "󰈹 $1";
        "(.*)[Tt]elegram(.*)" = " Telegram";
        "(.*)nvim" = " nvim";
        "(.*)Steam" = "󰓓 Steam";
      };
      separate-outputs = true;
      max-length = 60;
    };

    "hyprland/language" = {
      format = "{}";
      format-en = "en";
      format-ru = "ru";
    };

    memory = {
      format = "󰾆 {percentage}%";
      format-alt = "󰾅 {used}GB";
      interval = 30;
      max-length = 10;
      tooltip = true;
      tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
    };

    pulseaudio = {
      format = "{icon}";
      format-icons = {
        default = [ "" "" "" ];
        # hands-free = " ";
        # headphone = " ";
        # headset = " ";
        # phone = " ";
        # portable = " ";
      };
      format-muted = "";
      on-click = "pavucontrol -t 3";
      on-click-middle = "pulsemixer --toggle-mute";
      # on-scroll-down = "pulsemixer --change-volume -1";
      # on-scroll-up = "pulsemixer --change-volume +1";
      scroll-step = 0.1;
      tooltip-format = "{icon} {desc} {volume}%";
    };

    "pulseaudio#microphone" = {
      format = "{format_source}";
      format-source = "  {volume}%";
      format-source-muted = "  {volume}%";
      on-click = "pavucontrol -t 4";
      on-click-middle = "pulsemixer --toggle-mute";
      on-scroll-down = "pulsemixer --change-volume -5";
      on-scroll-up = "pulsemixer --change-volume +5";
      scroll-step = 1;
    };

    "pulseaudio/slider" = {
      min = 0;
      max = 100;
      orientation = "horizontal";
    };

    cava = {
      framerate = 30;
      autosens = 1;
      bars = 20;
      method = "pulse";
      source = "auto";
      sleep_timer = 5;
      hide_on_silence = true;
      bar_delimiter = 0;
      input_delay = 2;
      format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
    };

    network = {
      format-disconnected = " Disconnected";
      format-ethernet = "󱘖 Wired";
      format-linked = "󱘖 {ifname} (No IP)";
      format-wifi = "󰤨 {essid}";
      interval = 5;
      max-length = 30;
      tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
    };

    tray = {
      icon-size = 15;
      spacing = 5;
    };
  };
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    style = ./style.css;
    settings = { mainBar = mainConfig; };
  };

  home.packages = with pkgs;[
    iniparser
    fftw
  ];

}
