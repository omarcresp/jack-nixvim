{ lib, stdenv, pkg-config, openssl, rustPlatform, vimUtils, pkgs, avante-src, makeWrapper, ... }:

let
  version = "unstable-${lib.substring 0 8 avante-src.rev}";
  avante-lib = rustPlatform.buildRustPackage {
    pname = "avante-nvim-lib";
    inherit version;
    src = avante-src;

    cargoLock = {
      lockFile = "${avante-src}/Cargo.lock";
      allowBuiltinFetchGit = true;
    };

    nativeBuildInputs = [
      pkg-config
      makeWrapper
      pkgs.perl
    ];
    buildInputs = [
      openssl
    ];
    buildFeatures = [ "luajit" ];

    # NOTE: Disabled bc nix error on network access
    checkFlags = [
      "--skip=test_hf"
      "--skip=test_public_url"
      "--skip=test_roundtrip"
      "--skip=test_fetch_md"
    ];
  };
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

    postInstall = let
      ext = stdenv.hostPlatform.extensions.sharedLibrary;
    in ''
      mkdir -p $out/build
      ln -s ${avante-lib}/lib/libavante_repo_map${ext} $out/build/avante_repo_map${ext}
      ln -s ${avante-lib}/lib/libavante_templates${ext} $out/build/avante_templates${ext}
      ln -s ${avante-lib}/lib/libavante_tokenizers${ext} $out/build/avante_tokenizers${ext}
      ln -s ${avante-lib}/lib/libavante_html2md${ext} $out/build/avante_html2md${ext}
    '';

    # NOTE: Disabled bc nix error on network access
    nvimSkipModule = [
      "avante.providers.azure"
      "avante.providers.copilot"
      "avante.providers.ollama"
      "avante.providers.vertex_claude"
      "avante.providers.gemini"
      "avante.providers.vertex"
    ];

    meta = with lib; {
      description = "AI-powered Neovim plugin for code assistance";
      homepage = "https://github.com/yetone/avante.nvim";
      license = licenses.asl20;
    };
  }
