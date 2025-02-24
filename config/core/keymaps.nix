{
  keymaps = [
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }
    { mode = "n"; key = "<left>"; action = "<cmd>echo 'Use h to move!!'<CR>"; }
    { mode = "n"; key = "<right>"; action = "<cmd>echo 'Use l to move!!'<CR>"; }
    { mode = "n"; key = "<up>"; action = "<cmd>echo 'Use k to move!!'<CR>"; }
    { mode = "n"; key = "<down>"; action = "<cmd>echo 'Use j to move!!'<CR>"; }
    { mode = "n"; key = "U"; action = ":redo<CR>"; }
    { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; options = { silent = true; }; }
    { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; options = { silent = true; }; }
    { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; }
    { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; }
    { mode = "n"; key = "n"; action = "nzzzv"; }
	{ mode = "n"; key = "N"; action = "Nzzzv"; }
    { mode = "x"; key = "<leader>p"; action = "\"_dP"; options = { desc = "[P]aste without buffering"; }; }
    { mode = ["n" "v"]; key = "<leader>y"; action = "\"+y"; options = { desc = "[Y]ank to the os also"; }; }
    { mode = "n"; key = "<leader>Y"; action = "\"+Y"; options = { desc = "[Y]ank to the os also"; }; }
    { mode = ["n" "v"]; key = "<leader>d"; action = "\"_d"; options = { desc = "[D]eletes to the void"; }; }
    { mode = ["n" "v"]; key = "<leader>c"; action = "\"_c"; options = { desc = "[C]hange to the void"; }; }
    { mode = "i"; key = "<C-c>"; action = "<Esc>"; }
    { mode = "n"; key = "<C-c>"; action = "<cmd>bd<CR>"; }
    {
      mode = "n";
      key = "<leader>sr";
      action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
      options = {
        desc = "[S]earch and [R]eplace current word";
     };
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>!chmod +x %<CR>";
      options = {
        silent = true;
        desc = "Marks E[X]ecutable current file";
      };
    }
  ];
}
