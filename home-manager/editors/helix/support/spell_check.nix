{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [];
      language-server = {
        codebook = {
          command = lib.getExe pkgs.codebook;
          args = ["serve"];
        };
        typos-lsp = {
          command = lib.getExe pkgs.typos-lsp;
          config = {
            diagnosticSeverity = "Hint";
          };
        };
        harper-ls = {
          command = lib.getExe pkgs.harper;
          args = ["--stdio"];
          config = {
            harper-ls = {
              diagnosticSeverity = "hint";
            };
          };
        };
      };
    };
  };
}
