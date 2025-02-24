{...}: {
  plugins.mini = {
    # TODO: extra pickers
    modules.extra = {};
    modules.visits = {};

    # TODO: move to his own luafile?
    luaConfig.post = builtins.readFile ./omnibar.lua;
  };
}
