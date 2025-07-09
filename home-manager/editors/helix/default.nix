{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ ];
    themes = {
      transparent = {
        "inherits" = "catppuccin_mocha";
        "ui.bufferline.active" = {
          fg = "mauve";
          bg = "base";
        };
      };
    };
    settings = {
      theme = "transparent";
      editor = {
        bufferline = "multiple";
        cursorline = true;
        line-number = "absolute";
        popup-border = "all";
        true-color = true;
        mouse = true;
        scrolloff = 10;
        color-modes = true;
        auto-pairs = true;
        idle-timeout = 50;
        end-of-line-diagnostics = "hint";
        shell = [
          "nu"
          "-c"
        ];
        # rulers = [ 80 ];
        text-width = 100;

        inline-diagnostics = {
          cursor-line = "error";
        };
        gutters = {
          layout = [
            "diff"
            "diagnostics"
            "line-numbers"
            "spacer"
          ];
          line-numbers = {
            min-width = 1;
          };
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
        whitespace = {
          render = {
            space = "none";
            tab = "none";
            nbsp = "none";
            nnbsp = "none";
            newline = "none";
          };
        };
        soft-wrap = {
          enable = true;
          wrap-indicator = "";
          wrap-at-text-width = true;
        };
        file-picker = {
          hidden = false;
        };
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
      };
      keys.normal = {
        C-k = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
        C-j = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-c = "no_op";

        space = {
          n = ":new";
        };
        ";" = {
          t = {
            f = ":toggle auto-format";
            i = ":toggle lsp.display-inlay-hints";
            h = ":toggle file-picker.hidden";
            r = ":toggle indent-guides.render";
            s = ":toggle soft-wrap.enable";
            g = ":toggle gutters.line-numbers.min-width 52 3";
          };
          b = {
            x = ":buffer-close";
            X = ":buffer-close-others";
          };
          q = ":q";
          Q = ":qa!";
          w = ":write";
          r = ":reload";
          o = ":config-open";
          O = [
            ":w"
            ":config-reload"
          ];
          l = ":log-open";
          c = ":lsp-workspace-command";
          y = ":yank-diagnostic";
          e = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10% -y 10% --width 80% --height 80% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh open %{buffer_name}";
          v = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10% -y 10% --width 80% --height 80% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh vsplit %{buffer_name}";
          h = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10% -y 10% --width 80% --height 80% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh hsplit %{buffer_name}";
          s = ":sh ${pkgs.zellij}/bin/zellij run -n Serpl -c -f -x 10% -y 10% --width 80% --height 80% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/replace.sh serpl";
          S = ":sh ${pkgs.zellij}/bin/zellij run -n Scooter -c -f -x 10% -y 10% --width 80% --height 80% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/replace.sh scooter";
        };
      };
      keys.insert = {
        C-space = "completion";
        j = {
          k = "normal_mode";
        };
        k = {
          j = "normal_mode";
        };
        esc = [
          "collapse_selection"
          "normal_mode"
        ];
        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";
      };
      keys.select = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
          "normal_mode"
        ];
        C-k = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
        C-j = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        C-c = "no_op";
      };
    };
    languages = {
      language = [
        {
          name = "json";
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
          name = "typescript";
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
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "javascript";
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
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "jsx";
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
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "tsx";
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
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [
            "nixd"
            "harper-ls"
          ];
          formatter = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = [
            "rust-analyzer"
            "harper-ls"
          ];
        }
        {
          name = "toml";
          auto-format = true;
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
          auto-format = true;
          language-servers = [
            "markdown-oxide"
            "marksman"
            "harper-ls"
          ];
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
          language-servers = [ "nu-lsp" ];
        }
        {
          name = "typst";
          auto-format = true;
          language-servers = [ "tinymist" ];
          formatter = {
            command = lib.getExe pkgs.typstyle;
          };
        }
        {
          name = "elixir";
          language-servers = [ "elixir-ls" ];
        }
        {
          name = "heex";
          language-servers = [ "elixir-ls" ];
        }
        {
          name = "eex";
        }
      ];
      language-server = {
        elixir-ls = {
          command = lib.getExe pkgs.beam28Packages.elixir-ls;
          config = {
            elixirLS.dialyzerEnabled = false;
          };
        };
        nu-lsp = {
          command = "nu";
          args = [ "--lsp" ];
        };
        deno-lsp = {
          command = lib.getExe pkgs.deno;
          args = [ "lsp" ];
          config = {
            deno.enable = true;
          };
        };
        nixd = {
          command = lib.getExe pkgs.nixd;
        };
        rust-analyzer = {
          # command = lib.getExe pkgs.rust-analyzer;
          command = "rust-analyzer";
          config = {
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
  xdg.configFile."helix/yazi-picker.sh".text = ''
    #!/usr/bin/env bash
    paths=$(${pkgs.yazi}/bin/yazi "$2" --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

    if [[ -n "$paths" ]]; then
    	${pkgs.zellij}/bin/zellij action toggle-floating-panes
    	${pkgs.zellij}/bin/zellij action write 27 # send <Escape> key
    	${pkgs.zellij}/bin/zellij action write-chars ":$1 $paths"
    	${pkgs.zellij}/bin/zellij action write 13 # send <Enter> key
    else
    	${pkgs.zellij}/bin/zellij action toggle-floating-panes
    fi
  '';

  xdg.configFile."helix/replace.sh".text = ''
    TOOL=$1
    if [[ "$TOOL" == "serpl" ]]; then
      ${pkgs.serpl}/bin/serpl
    elif [[ "$TOOL" == "scooter" ]]; then
      ${pkgs.scooter}/bin/scooter
    else
      echo "Invalid tool: $TOOL"
      exit 1
    fi
    exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
      ${pkgs.zellij}/bin/zellij action toggle-floating-panes
      ${pkgs.zellij}/bin/zellij action write-chars ":reload-all"
      ${pkgs.zellij}/bin/zellij action write 13
    else
      echo "$TOOL failed with exit code $exit_code"
      ${pkgs.zellij}/bin/zellij action toggle-floating-panes
      exit $exit_code
    fi
  '';
}
