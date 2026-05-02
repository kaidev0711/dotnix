{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    settings = {
      theme = "kanagawa";
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
        statusline = {};
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
          c = {
            w = ":write";
            q = ":q";
            Q = ":qa!";
            r = ":reload";
            R = ":config-reload";
            o = ":config-open";
            l = ":log-open";
          };
          l = {
            c = ":lsp-workspace-command";
            y = ":yank-diagnostic";
          };
          e = {
            o = [
              ":sh rm -f /tmp/unique-ca1ea106"
              ":insert-output yazi \"%{buffer_name}\" --chooser-file=/tmp/unique-ca1ea106"
              ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
              ":open %sh{cat /tmp/unique-ca1ea106}"
              ":redraw"
              ":set mouse false"
              ":set mouse true"
            ];
          };
          s = {};
          g = {
            b = ":echo %sh{git blame -L %{cursor_line},+1 %{buffer_name}}";
            B = ":sh git blame -L %{cursor_line},%{cursor_line} %{buffer_name}";
          };
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
  };
}
