{ pkgs, lib, config, utils, ... }:
let
  cfg = config.myNixOSModules;

  # features =
  #   utils.extendModules
  #     (name: {
  #       extraOptions = {
  #         myNixOSModules.${name}.enable = lib.mkEnableOption "enable my ${name} config";
  #       };
  #
  #       configExtension = config: (lib.mkIf cfg.${name}.enable config);
  #     })
  #     (utils.filesIn ./features);
  features = [ ];
in
{
  imports =
    [ ]
    ++ features;
}
