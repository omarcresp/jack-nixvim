{
  opts = {
    number = true;
    relativenumber = true;

    mouse = "";
    scrolloff = 10;

    updatetime = 350;
    timeoutlen = 400;

    icm = "split";
    cursorline = true;

    hlsearch = true;
    showmode = false;

    undofile = true;
    undodir.__raw = ''vim.fn.stdpath("data") .. "/undotree"'';
    swapfile = false;
    backup = false;

    wrap = false;

    smartindent = true;

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;

    textwidth = 120;
    colorcolumn = "120";

    ignorecase = true;
    smartcase = true;

    signcolumn = "yes";

    termguicolors = true;

    list = true;
    listchars = { trail = "·"; nbsp = "␣"; tab = "  "; };
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = true;
  };
}
