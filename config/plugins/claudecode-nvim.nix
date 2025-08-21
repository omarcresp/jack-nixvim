{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.claudecode-nvim ];
  extraConfigLua = ''
    require('claudecode').setup({})
  '';
}
