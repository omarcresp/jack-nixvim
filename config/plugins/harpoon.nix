# { pkgs, ... }:
# TODO: harpoon2 migration
{
  plugins.harpoon = {
    enable = true;
    # package = pkgs.vimPlugins.harpoon2;
    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>h";
      toggleQuickMenu = "<C-e>";
      navFile = { "1" = "<C-f>"; "2" = "<C-n>"; "3" = "<C-s>"; "4" = "<C-m>"; "5" = "<C-a>"; };
    };
  };
}
