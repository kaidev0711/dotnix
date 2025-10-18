{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "toml";
          auto-format = true;
          language-servers = [
            "taplo"
            "codebook"
            "typos-lsp"
          ];
          formatter = {
            command = lib.getExe pkgs.taplo;
            args = [
              "format"
              "-"
            ];
          };
        }
      ];
      language-server = {
        taplo = {
          command = lib.getExe pkgs.taplo;
          args = [
            "lsp"
            "stdio"
          ];
        };
      };
    };
  };
}
