{
  plugins.flutter-tools = {
    enable = true;
  };

  keymaps = [
    { mode = "n"; key = "<leader>fd"; action = "<cmd>FlutterRun --flavor dev lib/main_dev.dart<cr>"; options.desc = "[F]lutter [D]ev Run"; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>FlutterReload<cr>"; options.desc = "[F]lutter [R]eload"; }
    { mode = "n"; key = "<leader>fR"; action = "<cmd>FlutterRestart<cr>"; options.desc = "[F]lutter [R]estart"; }
    { mode = "n"; key = "<leader>fe"; action = "<cmd>FlutterEmulators<cr>"; options.desc = "[F]lutter [E]mulators"; }
    { mode = "n"; key = "<leader>fl"; action = "<cmd>FlutterLogToggle<cr>"; options.desc = "[F]lutter [L]og Toggle"; }
    { mode = "n"; key = "<leader>fL"; action = "<cmd>FlutterLogClear<cr>"; options.desc = "[F]lutter [L]og Clear"; }
    { mode = "n"; key = "<leader>fQ"; action = "<cmd>FlutterQuit<cr>"; options.desc = "[F]lutter [Q]uit"; }
    { mode = "n"; key = "<leader>fa"; action = "<cmd>FlutterRun<cr>"; options.desc = "[F]lutter Run [A]pp"; }
    { mode = "n"; key = "<leader>fc"; action = "<cmd>FlutterCopyProfilerUrl<cr>"; options.desc = "[F]lutter [C]opy Profiler URL"; }
  ];
}
