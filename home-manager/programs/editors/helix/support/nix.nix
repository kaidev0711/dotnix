{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "nix";
          language-servers = [
            "nil"
            "typos-lsp"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.alejandra;
            args = [
              "--quiet"
              "--"
            ];
          };
        }
      ];
      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
        };
      };
    };
  };
}
