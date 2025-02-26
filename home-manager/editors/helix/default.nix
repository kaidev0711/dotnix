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
      kanagawa_transparent = {
        "inherits" = "kanagawa";
        "ui.background" = { };
      };
    };
    settings = {
      theme = "kanagawa_transparent";
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
        # rulers = [100];
        # text-width = 100;

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
          max-wrap = 25;
          max-indent-retain = 0;
          wrap-indicator = "";
          # wrap-at-text-width = true;
        };
        file-picker = {
          hidden = false;
        };
        statusline = {
          center = [ "version-control" ];
        };
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
          # display-signature-help-docs = true;
          # auto-signature-help = false;
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
        # G = "goto_file_end";
        # V = [
        #   "select_mode"
        #   "extend_to_line_bounds"
        # ];
        # x = "delete_selection";
        # p = "paste_clipboard_after";
        # P = "paste_clipboard_before";
        # o = ["open_below" "normal_mode"];
        # O = ["open_above" "normal_mode"];
        # w = [
        #   "move_next_word_start"
        #   "move_char_right"
        #   "collapse_selection"
        # ];
        # e = [
        #   "move_next_word_end"
        #   "collapse_selection"
        # ];
        # b = [
        #   "move_prev_word_start"
        #   "collapse_selection"
        # ];
        # H = ":bp";
        # L = ":bn";
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-c = "no_op";

        # y = {
        #   y = [
        #     "extend_to_line_bounds"
        #     "yank_main_selection_to_clipboard"
        #     "normal_mode"
        #     "flip_selections"
        #     "collapse_selection"
        #   ];
        # };
        # d = {
        #   d = [
        #     "extend_to_line_bounds"
        #     "yank_main_selection_to_clipboard"
        #     "delete_selection"
        #   ];
        # };
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
          r = [
            ":w"
            ":config-reload"
          ];
          o = ":config-open";
          l = ":log-open";
          y = ":yank-diagnostic";
          # n = ":open ~/Notes/index.md";
        };
      };
      keys.insert = {
        C-space = "completion";
        # j = { k = "normal_mode" };
        # k = { j = "normal_mode" };
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
        # G = "goto_file_end";
        # x = [
        #   "yank_main_selection_to_clipboard"
        #   "delete_selection"
        # ];
        # y = [
        #   "yank_main_selection_to_clipboard"
        #   "normal_mode"
        #   "flip_selections"
        #   "collapse_selection"
        # ];
        # Y = [
        #   "extend_to_line_bounds"
        #   "yank_main_selection_to_clipboard"
        #   "goto_line_start"
        #   "collapse_selection"
        #   "normal_mode"
        # ];
        # d = [
        #   "yank_main_selection_to_clipboard"
        #   "delete_selection"
        # ];
        # p = "replace_selections_with_clipboard";
        # P = "paste_clipboard_before";
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
      use-grammars = {
        only = [
          "rust"
          "nix"
        ];
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
      language-server = {
        nixd = {
          command = lib.getExe pkgs.nixd;
        };
        rust-analyzer = {
          command = lib.getExe pkgs.rust-analyzer;
          config = {
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
      };
    };
  };
}
