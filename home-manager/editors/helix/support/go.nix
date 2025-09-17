{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "go";
          language-servers = ["gopls" "golangci-lint-lsp"];
          formatter = {
            command = "goimports";
          };
          auto-format = true;
        }
      ];
      language-server = {
        gopls = {
          command = lib.getExe pkgs.gopls;
          config = {
            gofumpt = true;
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
        golangci-lint-lsp = {
          command = lib.getExe pkgs.golangci-lint-langserver;
          config = {
            command = ["golangci-lint" "run" "--output.json.path=stdout" "--show-stats=false" "--issues-exit-code=1"];
          };
        };
      };
    };
  };
}
