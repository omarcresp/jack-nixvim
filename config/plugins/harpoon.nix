{
  plugins.harpoon = {
    enable = true;
  };
  keymaps = [
    { mode = "n"; key = "<leader>h"; action.__raw = "function() require'harpoon':list():add() end"; }
    { mode = "n"; key = "<C-e>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
    { mode = "n"; key = "<C-f>"; action.__raw = "function() require'harpoon':list():select(1) end"; }
    { mode = "n"; key = "<C-n>"; action.__raw = "function() require'harpoon':list():select(2) end"; }
    { mode = "n"; key = "<C-s>"; action.__raw = "function() require'harpoon':list():select(3) end"; }
    { mode = "n"; key = "<C-m>"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    { mode = "n"; key = "<C-a>"; action.__raw = "function() require'harpoon':list():select(5) end"; }
  ];
}
