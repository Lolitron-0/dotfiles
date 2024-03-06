{ pkgs, lib, config, utils, ... }:
let
  cfg = config.myHMModules;

  features =
    utils.extendModules
      (name: {
        extraOptions = {
          myHMModules.${name}.enable = lib.mkEnableOption "enable my ${name} config";
        };

        configExtension = config: (lib.mkIf cfg.${name}.enable config);
      })
      (utils.filesIn ./features);
in
{
  imports =
    [ ]
    ++ features;
}
