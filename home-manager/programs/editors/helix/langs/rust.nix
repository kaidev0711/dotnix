{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "codebook"
            "typos-lsp"
          ];
          auto-format = true;
        }
      ];
      language-server = {
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            check = {
              command = "clippy";
            };
            inlayHints = {
              bindingModeHints.enable = false;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
            files = {
              watcher = "server";
            };
          };
        };
      };
    };
  };
}
