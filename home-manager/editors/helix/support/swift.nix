{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "swift";
          language-servers = ["sourcekit-lsp"];
          formatter = {
            command = lib.getExe pkgs.swift-format;
          };
          auto-format = true;
        }
      ];
      language-server = {
        sourcekit-lsp = {
          command = "sourcekit-lsp";
        };
      };
    };
  };
}
