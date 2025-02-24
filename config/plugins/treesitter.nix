{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;

      # TODO: check more treesitter options/extensions
      settings = {
        # TODO: check whats this
        # textobjects.enable = true;

        highlight = {
          enable = true;

          disable = ''
          function(lang, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 10000
          end
          '';
        };

        # TODO: check whats this
        # incremental_selection = { enable = true; };

        indent = { enable = false; };
      };
    };

    treesitter-context.enable = true;

    ts-autotag = {
      enable = true;

      settings = {
        opts = {
          enable_close = true;
          enable_close_on_slash = true;
          enable_rename = true;
        };
      };
    };
  };
}
