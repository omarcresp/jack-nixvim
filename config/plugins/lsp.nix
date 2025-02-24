{
  plugins.lsp = {
    enable = true;

    servers = {
      lua_ls.enable = true;
      nil_ls.enable = true;
      denols.enable = true;
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
