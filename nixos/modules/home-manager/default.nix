{ pkgs, lib, config, inputs, myUtils, ... }:
let
  cfg = config.myHMModules;

  features =
    myUtils.extendModules
      (name: {
        extraOptions = {
          myHMModules.${name}.enable = lib.mkEnableOption "enable my ${name} config";
        };

        configExtension = config: (lib.mkIf cfg.${name}.enable config);
      })
      (myUtils.filesIn ./features);

  bundles =
    myUtils.extendModules
      (name: {
        extraOptions = {
          myHMModules.bundles.${name}.enable = lib.mkEnableOption "enable my ${name} bundle";
        };

        configExtension = config: (lib.mkIf cfg.bundles.${name}.enable config);
      })
      (myUtils.filesIn ./bundles);
in
{
  imports =
    [ ]
    ++ features
    ++ bundles;
}
