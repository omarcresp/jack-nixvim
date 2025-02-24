{
  autoCmd = [
    # Auto navigate quickfix list with j and k
    {
      event = [ "FileType" ];
      pattern = [ "qf" ];
      callback.__raw = ''
        function()
          vim.keymap.set('n', 'j', ':cnext | copen<CR>', { buffer = true })
          vim.keymap.set('n', 'k', ':cprevious | copen<CR>', { buffer = true })
        end
      '';
    }

    # Highlight when yanking (copying) text
    {
      event = [ "TextYankPost" ];
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
