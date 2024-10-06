{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.vim.filetree.neo-tree;
in {
  config = mkIf cfg.enable {
    vim = {
      startPlugins = [
        # dependencies
        "plenary-nvim" # commons library
        "image-nvim" # optional for image previews
        "nui-nvim" # ui library
        # neotree
        "neo-tree-nvim"
      ];

      lazy.plugins = [
        {
          package = "neo-tree-nvim";
          setupModule = "neo-tree";
          inherit (cfg) setupOpts;

          cmd = ["Neotree"];
        }
      ];

      visuals.nvimWebDevicons.enable = true;
    };
  };
}
