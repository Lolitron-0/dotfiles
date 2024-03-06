{ inputs }:
let
  myLib = (import ./default.nix) { inherit inputs; };
  outputs = inputs.self.outputs;
in
{
  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs myLib; };
      modules = [
        config
        outputs.nixosModules.default
      ];
    };


  filesIn = dir: (map (fname: dir + "/${fname}"))
    (builtins.attrNames (builtins.readDir dir));

  extendModule = { path, ... }@args: { pkgs, ... }@margs:
    let
      eval =
        if (builtins.isString path) || (builtins.isPath path)
        then import path margs
        else path margs;
    in
    { };

}
