{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.claudecode-nvim ];
  extraConfigLua = ''
    require('claudecode').setup({})
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action = null;
      desc = "AI/Claude Code";
    }

    {
      mode = "n";
      key = "<leader>ac";
      action = "<cmd>ClaudeCode<cr>";
      desc = "Toggle Claude";
    }
    {
      mode = "n";
      key = "<leader>af";
      action = "<cmd>ClaudeCodeFocus<cr>";
      desc = "Focus Claude";
    }
    {
      mode = "n";
      key = "<leader>ar";
      action = "<cmd>ClaudeCode --resume<cr>";
      desc = "Resume Claude";
    }
    {
      mode = "n";
      key = "<leader>aC";
      action = "<cmd>ClaudeCode --continue<cr>";
      desc = "Continue Claude";
    }
    {
      mode = "n";
      key = "<leader>am";
      action = "<cmd>ClaudeCodeSelectModel<cr>";
      desc = "Select Claude model";
    }
    {
      mode = "n";
      key = "<leader>ab";
      action = "<cmd>ClaudeCodeAdd %<cr>";
      desc = "Add current buffer";
    }
    {
      mode = "v";
      key = "<leader>as";
      action = "<cmd>ClaudeCodeSend<cr>";
      desc = "Send to Claude";
    }
    # Diff management
    {
      mode = "n";
      key = "<leader>aa";
      action = "<cmd>ClaudeCodeDiffAccept<cr>";
      desc = "Accept diff";
    }
    {
      mode = "n";
      key = "<leader>ad";
      action = "<cmd>ClaudeCodeDiffDeny<cr>";
      desc = "Deny diff";
    }
  ];
}
