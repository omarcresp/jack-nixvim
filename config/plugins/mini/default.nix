{
  imports = [
    ./files.nix
    ./pick.nix
    ./ai.nix
    ./omnibar.nix
    ./diff.nix
    ./clue.nix
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules.icons = {};
    modules.surround = {};
    modules.pairs = {};
    modules.doc = {};
  };
}
