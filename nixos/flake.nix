{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-mongodb-pin.url = "github:NixOS/nixpkgs/106c4ac6aa6e325263b740fd30bdda3b430178ef";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { ... }@inputs:
    let
      myUtils = import ./myUtils/default.nix { inherit inputs; };
    in
    with myUtils; {
      # nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default/configuration.nix
      #     inputs.home-manager.nixosModules.default
      #     ./modules/home-manager
      #   ];
      # };
      overlay-mongodb-pin = self: super: {
        mongodb-4_4 =
          (import nixpkgs-mongodb-pin {
            inherit system;
            config.allowUnfreePredicate = pkg: "mongodb" == (super.lib.getName pkg);
          }).mongodb-4_4;
      };
      nixosConfigurations = {
        default = mkSystem ./hosts/default/configuration.nix;
      };

      homeConfigurations = {
        "niten@default" = mkHome ./hosts/default/home.nix;
      };

      nixosModules.default = ./modules/nixos;
      homeManagerModules.default = ./modules/home-manager;

    };
}
