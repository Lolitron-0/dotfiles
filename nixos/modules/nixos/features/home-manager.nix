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
  options.myNixOSModules = {
    userName = lib.mkOption {
      default = "niten";
      description = ''
        username
      '';
    };

    userConfig = lib.mkOption {
      default = ./../../../hosts/default/home.nix;
      description = ''
        home-manager config path
      '';
    };

  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        inherit myUtils;
        outputs = inputs.self.outputs;
      };
      users = {
        ${cfg.userName} = import cfg.userConfig;
      };
    };

  };
}
