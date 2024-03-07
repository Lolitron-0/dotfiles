{ pkgs, lib, inputs, config, myUtils, ... }:
let
  cfg = config.myNixOSModules;

  features =
    myUtils.extendModules
      (name: {
        extraOptions = {
          myNixOSModules.${name}.enable = lib.mkEnableOption "enable my ${name} config";
        };

        configExtension = config: (lib.mkIf cfg.${name}.enable config);
      })
      (myUtils.filesIn ./features);

  bundles =
    myUtils.extendModules
      (name: {
        extraOptions = {
          myNixOSModules.bundles.${name}.enable = lib.mkEnableOption "enable my ${name} bundle";
        };

        configExtension = config: (lib.mkIf cfg.bundles.${name}.enable config);
      })
      (myUtils.filesIn ./bundles);

in
{
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
    ]
    ++ features
    ++ bundles;

  options.myNixOSModules = {
    sharedSettings = {
      hyprland.enable = lib.mkEnableOption "enable hyprland";
    };
  };
}
