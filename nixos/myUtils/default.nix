{ inputs }:
let
  myUtils = (import ./default.nix) { inherit inputs; };
  outputs = inputs.self.outputs;
in
rec {
  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs myUtils; };
      modules = [
        config
        outputs.nixosModules.default
      ];
    };

  mkHome = config:
    inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs myUtils outputs; };
      modules = [
        config
        outputs.homeManagerModules.default
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

  extendModules = extension: modules:
    map
      (f:
        let
          name = builtins.head (builtins.split "\\." (baseNameOf f));
        in
        (extendModule ((extension name) // { path = f; })))
      modules;

}
