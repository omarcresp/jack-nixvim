{
  plugins.mini.modules.diff = {
    view.style = "sign";
  };

  keymaps = [
    { mode = "n"; key = "ghp"; action = "<cmd>lua MiniDiff.toggle_overlay()<CR>"; }
  ];
}
