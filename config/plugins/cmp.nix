{
  # TODO: integrate a snippet system (luasnip ex... mini snip)
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      completion.completeopt = "menu,menuone,preview,noselect";
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "emoji"; }
      ];
      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-Space>" = "cmp.mapping.complete({})";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };

  plugins.lspkind = {
    enable = true;
    settings = {
      cmp = {
        maxWidth = 50;
        ellipsisChar = "…";
        menu = {
          nvim_lsp = "[LSP]";
          luasnip = "[Snip]";
          emoji = "[Emoji]";
          path = "[Path]";
        };
      };
    };
  };
}
