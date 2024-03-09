{ lib
, config
, inputs
, outputs
, pkgs
, myUtils
, ...
}:
let
  cfg = config.myNixOSModules;
in
{
  myNixOSModules = {
    home-manager.enable = true;
  };

  programs.hyprland = {
    enable = cfg.sharedSettings.hyprland.enable;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;

    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };


  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = true;

  # services.xserver.displayManager.defaultSession =
  #   lib.mkIf cfg.sharedSettings.hyprland.enable "hyprland";

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "DroidSansMono" ]; })
  ];
}
