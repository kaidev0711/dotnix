{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "css";
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-ls"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "css"
            ];
          };
        }
      ];
      language-server = {
        vscode-css-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
          args = ["--stdio"];
          config = {
            provideFormatter = true;
            css = {
              validate = {
                enable = true;
              };
            };
          };
        };
      };
    };
  };
}
