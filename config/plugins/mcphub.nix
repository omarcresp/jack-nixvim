{ mcphub-nvim, mcphub, ... }:
{
  extraPlugins = [mcphub-nvim];
  extraConfigLua = ''
    require("mcphub").setup({
        port = 8641,
        config = vim.fn.expand("~/.mcp-hub/servers.json"),
        cmd = "${mcphub}/bin/mcp-hub"
    })
  '';
}
