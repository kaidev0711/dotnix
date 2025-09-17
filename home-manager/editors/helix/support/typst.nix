{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "typst";
          language-servers = [
            "tinymist"
            "harper-ls"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.typstyle;
          };
        }
      ];
      language-server = {
        tinymist = {
          command = lib.getExe pkgs.tinymist;
        };
      };
    };
  };
}
