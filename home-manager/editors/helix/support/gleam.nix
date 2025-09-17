{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "gleam";
          language-servers = ["gleam"];
          auto-format = true;
        }
      ];
      language-server = {
        gleam = {
          command = lib.getExe pkgs.gleam;
          args = ["lsp"];
        };
      };
    };
  };
}
