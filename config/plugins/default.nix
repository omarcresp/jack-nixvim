{
  imports = [
    ./treesitter.nix
    ./lsp.nix
    ./cmp.nix
    ./dressing.nix
    ./harpoon.nix
    ./avante.nix
    ./flutter-tools.nix
    ./mini
  ];

  plugins.tmux-navigator.enable = true;
  plugins.sleuth.enable = true;
  plugins.indent-blankline.enable = true;
  plugins.treesitter-textobjects.enable = true;
}
