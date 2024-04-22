{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
