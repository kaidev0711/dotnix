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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
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
            "harper-ls"
            "tailwindcss-ls"
            "codebook"
          ];
          auto-format = true;
        }
        {
          name = "toml";
          auto-format = true;
          language-servers = [
            "taplo"
            "codebook"
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
            "harper-ls"
            "codebook"
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
            "harper-ls"
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
            "harper-ls"
          ];
          auto-format = true;
        }
        {
          name = "heex";
          language-servers = [
            "elixir-ls"
            "tailwindcss-ls"
            "harper-ls"
          ];
          auto-format = true;
        }
        {
          name = "eex";
          auto-format = true;
        }
      ];
      language-server = {
        codebook = {
          command = lib.getExe pkgs.codebook;
          args = ["serve"];
        };
        tailwindcss-ls = {
          command = lib.getExe pkgs.tailwindcss-language-server;
          args = ["--stdio"];
          config = {
            userLanguages = {
              rust = "html";
              "*.rs" = "html";
            };
          };
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
        harper-ls = {
          command = lib.getExe pkgs.harper;
          args = [
            "--stdio"
          ];
          config = {
            harper-ls = {
              userDictPath = "";
              fileDictPath = "";
              diagnosticSeverity = "hint";
              isolateEnglish = false;
              dialect = "American";
              maxFileLength = 120000;
              linters = {
                SpellCheck = true;
                SpelledNumbers = false;
                AnA = true;
                SentenceCapitalization = true;
                UnclosedQuotes = true;
                WrongQuotes = false;
                LongSentences = true;
                RepeatedWords = true;
                Spaces = true;
                Matcher = true;
                CorrectNumberSuffix = true;
              };
              codeActions = {
                ForceStable = false;
              };
              markdown = {
                IgnoreLinkTitle = false;
              };
            };
          };
        };
      };
    };
  };
}
