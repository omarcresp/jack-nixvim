{
  plugins.lsp-format.enable = true;
  plugins.lsp = {
    enable = true;

    servers = {
      lua_ls.enable = true;
      nil_ls.enable = true;
      zls.enable = true;
      clangd.enable = true;
      kotlin_language_server.enable = true;
      gopls.enable = true;

      cssls.enable = true;
      html.enable = true;
      emmet_ls.enable = true;

      denols.enable = true;
      denols.autostart = false;
      # biome.enable = true;
      # biome.autostart = false;
      # eslint.enable = true;
      # eslint.autostart = false;
      ts_ls.enable = true;
      ts_ls.autostart = false;
      angularls.enable = true;
      angularls.autostart = false;
    };

    keymaps = {
      lspBuf = {
        K = "hover";
        gd = "definition";
        gD = "declaration";
        "<leader>la" = "code_action";
        "<leader>lr" = "rename";

        # NOTE: In legacy those are handled with telescope
        gr = "references";
        gi = "implementation";
        gt = "type_definition";
      };

      diagnostic = {
        D = "open_float";

        # FIXME: goto is deprecated. use jump instead
        "[d" = "goto_prev";
        "]d" = "goto_next";
      };

      extra = [
        { action = "<CMD>LspRestart<Enter>"; key = "<leader>ll"; }

        # NOTE: Example of using third party plugins for lsp
        # {
        #   action = {
        #     __raw = "require('telescope.builtin').lsp_definitions";
        #   };
        #   key = "gd";
        # }
      ];
    };
  };
}
