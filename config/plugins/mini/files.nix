{
  plugins.mini.modules.files = {
    mappings = {
      go_in_plus = "<CR>";
      close = "<Esc>";
    };
    windows = {
      preview = true;
    };
  };

  keymaps = [
    { mode = "n"; key = "<leader>sf"; action = "<cmd>lua MiniFiles.open()<CR>"; }
    { mode = "n"; key = "-"; action = "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>"; }
  ];
}
