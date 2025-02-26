{
  description = "JackCode nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.flake-parts.follows = "flake-parts";

    avante-src = {
      url = "github:yetone/avante.nvim";
      # url = "/home/jackcres/projects/avante.nvim";
      flake = false;
    };

    smart-flow.url = "github:omarcresp/smart-flow.nvim";
    smart-flow.inputs.nixpkgs.follows = "nixpkgs";
    smart-flow.inputs.flake-parts.follows = "flake-parts";

    mcphub-nvim.url = "github:omarcresp/mcphub.nvim/feat/nix-flake";
    mcphub-nvim.inputs.nixpkgs.follows = "nixpkgs";
    mcphub-nvim.inputs.flake-parts.follows = "flake-parts";

    mcphub.url = "github:ravitemer/mcp-hub";
    mcphub.inputs.nixpkgs.follows = "nixpkgs";
    mcphub.inputs.flake-parts.follows = "flake-parts";
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
          # avante-master = pkgs.callPackage ./pkgs/avante-local.nix {
            avante-src = inputs.avante-src;
          };

          mcphub-nvim = inputs.mcphub-nvim.packages.${system}.default;
          mcphub = inputs.mcphub.packages.${system}.default;
          smart-flow = inputs.smart-flow.packages.${system}.default;

          nixvimLib = nixvim.lib.${system};
          nixvimPkg = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config;
            extraSpecialArgs = {
              inherit avante-master mcphub-nvim mcphub smart-flow;
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
