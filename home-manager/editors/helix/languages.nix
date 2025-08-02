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
        {
          name = "jsx";
          language-servers = [
            "deno-lsp"
            "tailwindcss-ls"
          ];
          roots = [
            "deno.json"
            "deno.jsonc"
            "package.json"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "jsx"
            ];
          };
        }
        {
          name = "tsx";
          language-servers = [
            "deno-lsp"
            "tailwindcss-ls"
          ];
          roots = [
            "deno.json"
            "deno.jsonc"
            "package.json"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "tsx"
            ];
          };
        }
        {
          name = "nix";
          language-servers = [
            "nil"
            "nixd"
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
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "codebook"
            "typos-lsp"
          ];
          auto-format = true;
        }
        {
          name = "toml";
          auto-format = true;
          language-servers = [
            "taplo"
            "codebook"
            "typos-lsp"
          ];
          formatter = {
            command = lib.getExe pkgs.taplo;
            args = [
              "format"
              "-"
            ];
          };
        }
        {
          name = "swift";
          formatter = {
            command = lib.getExe pkgs.swift-format;
          };
          auto-format = true;
        }
        {
          name = "markdown";
          language-servers = [
            "markdown-oxide"
            "marksman"
            "codebook"
            "typos-lsp"
          ];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              "md"
            ];
          };
        }
        {
          name = "nu";
          language-servers = [
            "nu-lsp"
          ];
        }
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
        {
          name = "elixir";
          language-servers = [
            "elixir-ls"
          ];
          auto-format = true;
        }
        {
          name = "heex";
          language-servers = [
            "elixir-ls"
            "tailwindcss-ls"
          ];
          auto-format = true;
        }
        {
          name = "eex";
          auto-format = true;
        }
      ];
      language-server = {
        tailwindcss-ls = {
          command = lib.getExe pkgs.tailwindcss-language-server;
          args = ["--stdio"];
        };
        vscode-html-language-server = {
          command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
          args = ["--stdio"];
          config = {
            provideFormatter = true;
          };
        };
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
        elixir-ls = {
          command = lib.getExe pkgs.beam28Packages.elixir-ls;
          config = {
            elixirLS.dialyzerEnabled = false;
          };
        };
        nu-lsp = {
          command = "nu";
          args = ["--lsp"];
        };
        deno-lsp = {
          command = lib.getExe pkgs.deno;
          args = ["lsp"];
          config = {
            deno.enable = true;
          };
        };
        nil = {
          command = lib.getExe pkgs.nil;
        };
        nixd = {
          command = lib.getExe pkgs.nixd;
        };
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            check = {
              command = "clippy";
            };
            inlayHints = {
              bindingModeHints.enable = false;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
            files = {
              watcher = "server";
            };
          };
        };
        taplo = {
          command = lib.getExe pkgs.taplo;
          args = [
            "lsp"
            "stdio"
          ];
        };
        markdown-oxide = {
          command = lib.getExe pkgs.markdown-oxide;
        };
        marksman = {
          command = lib.getExe pkgs.marksman;
          args = [
            "server"
          ];
        };
        tinymist = {
          command = lib.getExe pkgs.tinymist;
        };

        # TODO: spell checker
        codebook = {
          command = lib.getExe pkgs.codebook;
          args = ["serve"];
        };
        typos-lsp = {
          command = lib.getExe pkgs.typos-lsp;
          config = {
            diagnosticSeverity = "Hint";
          };
        };
        harper-ls = {
          command = lib.getExe pkgs.harper;
          args = [
            "--stdio"
          ];
          config = {
            harper-ls = {
              diagnosticSeverity = "hint";
            };
          };
        };
      };
    };
  };
}
