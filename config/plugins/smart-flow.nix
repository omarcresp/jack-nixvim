{ smart-flow, ... }:
{
  extraPlugins = [smart-flow];
  extraConfigLua = ''
    require('smart-flow').setup({
      debug = true,
      autosave = true,
    })
  '';
}
