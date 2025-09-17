{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "json";
          language-servers = [
            "vscode-json-language-server"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "json"
            ];
          };
        }
        {
          name = "jsonc";
          language-servers = [
            "vscode-json-language-server"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "jsonc"
            ];
          };
        }
      ];
      language-server = {
        vscode-json-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
          args = ["--stdio"];
          config = {
            provideFormatter = true;
            json = {
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
