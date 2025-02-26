{ lib, vimUtils, pkgs, avante-src, ... }:

let
  version = "unstable-${lib.substring 7 15 avante-src.narHash}";
in
  vimUtils.buildVimPlugin {
    pname = "avante.nvim";
    inherit version;
    src = avante-src;

    dependencies = with pkgs.vimPlugins; [
      dressing-nvim
      nui-nvim
      nvim-treesitter
      plenary-nvim
    ];

    # NOTE: Disabled bc nix error on network access
    nvimSkipModule = [
      "avante.providers.azure"
      "avante.providers.copilot"
      "avante.providers.ollama"
      "avante.providers.vertex_claude"
    ];

    meta = with lib; {
      description = "AI-powered Neovim plugin for code assistance";
      homepage = "https://github.com/yetone/avante.nvim";
      license = licenses.asl20;
    };
  }
