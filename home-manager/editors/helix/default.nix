# hx --grammar fetch
# hx --grammar build
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
        "inherits" = "gruvbox";
        "ui.background" = { };
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
          "sh"
          "-c"
        ];
        # rulers = [ 80 ];
        text-width = 80;

        inline-diagnostics = {
          cursor-line = "error";
          # cursor-line = "warning";
          # other-lines = "error";
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
        statusline = { };
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
          f = ":toggle auto-format";
          i = ":toggle lsp.display-inlay-hints";
          k = ":toggle file-picker.hidden";
          d = ":toggle indent-guides.render";
          x = ":buffer-close";
          X = ":buffer-close-others";
          q = ":q";
          Q = ":qa!";
          w = ":write";
          s = ":toggle soft-wrap.enable";
          z = ":toggle gutters.line-numbers.min-width 52 3";
          O = [
            ":w"
            ":config-reload"
          ];
          o = ":config-open";
          l = ":log-open";
          c = ":lsp-workspace-command";
          y = ":yank-diagnostic";
          n = ":open ~/Documents/Notes/index.md";
          e = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh open %{buffer_name}";
          v = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh vsplit %{buffer_name}";
          h = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh hsplit %{buffer_name}";
          r = ":sh ${pkgs.zellij}/bin/zellij run -n Serpl -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/serpl-replace.sh";
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
      ];
      language-server = {
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
            # cargo = {
            #   features = "all";
            # };
            # check = {
            #   command = "clippy";
            # };
            inlayHints = {
              bindingModeHints.enable = false;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
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

  xdg.configFile."helix/serpl-replace.sh".text = ''
    #!/usr/bin/env bash
    ${pkgs.serpl}/bin/serpl
    exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
      ${pkgs.zellij}/bin/zellij action toggle-floating-panes
      ${pkgs.zellij}/bin/zellij action write-chars ":reload-all"
      ${pkgs.zellij}/bin/zellij action write 13 # send <Enter> key
    else
    	${pkgs.zellij}/bin/zellij action toggle-floating-panes
    fi
  '';
}
