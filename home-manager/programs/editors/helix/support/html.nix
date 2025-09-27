{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "html";
          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-ls"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "html"
            ];
          };
        }
      ];
      language-server = {
        vscode-html-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
          args = ["--stdio"];
          config = {
            provideFormatter = true;
          };
        };
      };
    };
  };
}
