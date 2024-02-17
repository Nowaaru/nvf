{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  options.vim.lsp = {
    lspSignature = {
      enable = mkEnableOption "lsp signature viewer";
      setupOpts = lib.nvim.types.mkPluginSetupOption "lsp-signature" {};
    };
  };
}
