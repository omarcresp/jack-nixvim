{
  plugins.mini.modules.pick = {
  };
  keymaps = [
    { mode = "n"; key = "<C-p>"; action = "<cmd>Pick omnibar<CR>"; }
    { mode = "n"; key = "<leader>sg"; action = "<cmd>Pick grep_live<CR>"; }
  ];
}
