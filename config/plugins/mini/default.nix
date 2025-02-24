{
  imports = [
    ./files.nix
    ./pick.nix
    ./ai.nix
    ./omnibar.nix
    ./git.nix
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules.icons = {};
    modules.surround = {};
    modules.pairs = {};

    # TODO: Configure clue (which key replacement)
    # modules.clue = {};
  };
}
