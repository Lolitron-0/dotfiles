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
in
{
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
    ]
    ++ features;
}
