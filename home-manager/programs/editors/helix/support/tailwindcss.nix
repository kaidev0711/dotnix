{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [];
      language-server = {
        tailwindcss-ls = {
          command = lib.getExe pkgs.tailwindcss-language-server;
          args = ["--stdio"];
        };
      };
    };
  };
}
