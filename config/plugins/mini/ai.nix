{
  plugins.mini.modules.ai = {
    custom_textobjects = {
      f.__raw = "require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {})";
      c.__raw = "require('mini.ai').gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {})";
    };
  };
}
