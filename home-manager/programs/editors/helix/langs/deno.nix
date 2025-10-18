{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "typescript";
          language-servers = [
            "deno-lsp"
            "tailwindcss-ls"
          ];
          roots = [
            "deno.json"
            "deno.jsonc"
            "package.json"
          ];
          file-types = ["ts" "tsx"];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "ts"
            ];
          };
        }
        {
          name = "javascript";
          language-servers = [
            "deno-lsp"
            "tailwindcss-ls"
          ];
          roots = [
            "deno.json"
            "deno.jsonc"
            "package.json"
          ];
          file-types = ["js" "jsx"];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "js"
            ];
          };
        }
      ];
      language-server = {
        deno-lsp = {
          command = lib.getExe pkgs.deno;
          args = ["lsp"];
          config = {
            deno.enable = true;
          };
        };
      };
    };
  };
}
