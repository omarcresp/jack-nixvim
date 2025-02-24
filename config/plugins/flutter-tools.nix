{
  plugins.flutter-tools = {
    enable = true;
  };

  keymaps = [
    { mode = "n"; key = "<leader>fd"; action = "<cmd>FlutterRun lib/main_dev.dart<cr>"; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>FlutterReload<cr>"; }
    { mode = "n"; key = "<leader>fR"; action = "<cmd>FlutterRestart<cr>"; }
    { mode = "n"; key = "<leader>fe"; action = "<cmd>FlutterEmulators<cr>"; }
    { mode = "n"; key = "<leader>fl"; action = "<cmd>FlutterLogToggle<cr>"; }
    { mode = "n"; key = "<leader>fL"; action = "<cmd>FlutterLogClear<cr>"; }
    { mode = "n"; key = "<leader>fQ"; action = "<cmd>FlutterQuit<cr>"; }
    { mode = "n"; key = "<leader>fa"; action = "<cmd>FlutterRun<cr>"; }
  ];
}
