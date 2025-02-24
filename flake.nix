{
  description = "JackCode nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.flake-parts.follows = "flake-parts";

    avante-src = {
      url = "github:yetone/avante.nvim";
      flake = false;
    };
  };

  outputs =
    { nixvim, flake-parts, nixpkgs, avante-src, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, pkgs, ... }:
        let
          avante-master = pkgs.callPackage ./pkgs/avante.nix {
            avante-src = inputs.avante-src;
          };

          nixvimLib = nixvim.lib.${system};
          nixvimPkg = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config;
            extraSpecialArgs = {
              inherit avante-master;
            };
          };

          nvim = nixvimPkg.makeNixvimWithModule nixvimModule;
        in
        {
          checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          packages.default = nvim;
        };
    };
}
