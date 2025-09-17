{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "just";
          language-servers = ["just-lsp"];
        }
      ];
      language-server = {
        just-lsp = {
          command = lib.getExe pkgs.just-lsp;
        };
      };
    };
  };
}
