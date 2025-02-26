{
  plugins.mini.modules.clue.__raw = ''
{
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    require('mini.clue').gen_clues.builtin_completion(),
    require('mini.clue').gen_clues.g(),
    require('mini.clue').gen_clues.marks(),
    require('mini.clue').gen_clues.registers(),
    require('mini.clue').gen_clues.windows(),
    require('mini.clue').gen_clues.z(),
  },
}
  '';
  # plugins.mini.modules.clue = {
#     # Show window only if there are clues to show and mapping is not yet recognized
#     window = {
#       config = {
#         delay = 200;       # Delay before showing clue window
#         maxHeight = 20;    # Maximum window height
#         minHeight = 1;     # Minimum window height
#         border = "single"; # Border style
#       };
#     };
#     # Key triggers that will start showing window with clues
#     triggers = [
#       # Leaders
#       {
#         keys = "<Leader>";
#         mode = "n";        # Normal mode
#         descSuffix = "Leader";
#       }
#       {
#         keys = "<Leader>";
#         mode = "x";        # Visual mode
#         descSuffix = "Leader";
#       }
#       # Marks
#       {
#         keys = "'";
#         mode = "n";
#         descSuffix = "Mark";
#       }
#       # Registers
#       {
#         keys = "\"";
#         mode = "n";
#         descSuffix = "Register";
#       }
#       {
#         keys = "\"";
#         mode = "x";
#         descSuffix = "Register";
#       }
#       # 'g' key
#       {
#         keys = "g";
#         mode = "n";
#         descSuffix = "Go to";
#       }
#       # 'z' key
#       {
#         keys = "z";
#         mode = "n";
#         descSuffix = "Fold";
#       }
#     ];
#     # Clue groups
#     clues = {
#       # Add basic clue groups
#       miniExtra = true;
#
#       # You can add custom clue groups
#       myGroup = [
#         { mode = "n"; keys = "<Leader>f"; desc = "File operations"; }
#         { mode = "n"; keys = "<Leader>g"; desc = "Git operations"; }
#       ];
#     };
  # };
}
