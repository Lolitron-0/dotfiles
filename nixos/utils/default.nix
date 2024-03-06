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
      evalNoImports = builtins.removeAttrs eval [ "imports" "options" ];

      extra =
        if (builtins.hasAttr "extraOptions" args) || (builtins.hasAttr "extraConfig" args)
        then [
          ({ ... }: {
            options = args.extraOptions or { };
            config = args.extraConfig or { };
          })
        ]
        else [ ];

    in
    {
      imports =
        (eval.imports or [ ])
        ++ extra;

      options =
        if builtins.hasAttr "optionsExtension" args
        then (args.optionsExtension (eval.options or { }))
        else (eval.options or { });

      config =
        if builtins.hasAttr "configExtension" args
        then (args.configExtension (eval.config or evalNoImports))
        else (eval.config or evalNoImports);
    };

}
