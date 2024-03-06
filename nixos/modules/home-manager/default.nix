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
in
{
  imports =
    [ ]
    ++ features;
}
