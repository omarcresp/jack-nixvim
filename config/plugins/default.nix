{
  imports = [
    ./treesitter.nix
    ./lsp.nix
    ./cmp.nix
    ./dressing.nix
    ./harpoon.nix
    ./avante.nix
    # ./flutter-tools.nix
    ./mini
    ./mcphub.nix
    # ./claudecode-nvim.nix
    # ./smart-flow.nix
  ];

  plugins.tmux-navigator.enable = true;
  plugins.sleuth.enable = true;
  plugins.snacks.enable = true;
  plugins.indent-blankline.enable = true;
  plugins.treesitter-textobjects.enable = true;
  plugins.todo-comments.enable = true;
  plugins.wakatime.enable = true;
}
