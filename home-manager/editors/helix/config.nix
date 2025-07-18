{
  pkgs,
  config,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
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
          diagnostics = [
            "warning"
            "error"
          ];
          workspace-diagnostics = [
            "warning"
            "error"
          ];
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
            o = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh open %{buffer_name}";
            v = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh vsplit %{buffer_name}";
            h = ":sh ${pkgs.zellij}/bin/zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/yazi-picker.sh hsplit %{buffer_name}";
            O = [
              ":sh rm -f /tmp/files2open"
              ":set mouse false"
              ":insert-output yazi %{buffer_name} --chooser-file=/tmp/files2open"
              ":redraw"
              ":set mouse true"
              ":open /tmp/files2open"
              "select_all"
              "split_selection_on_newline"
              "goto_file"
              ":buffer-close! /tmp/files2open"
            ];
          };
          s = {
            s = ":sh ${pkgs.zellij}/bin/zellij run -n Serpl -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/replace.sh serpl";
            S = ":sh ${pkgs.zellij}/bin/zellij run -n Scooter -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/replace.sh scooter";
          };
          g = {
            g = ":sh ${pkgs.zellij}/bin/zellij run -n Gitui -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ${pkgs.bash}/bin/bash ${config.xdg.configHome}/helix/gitui.sh";
            b = ":echo %sh{git blame -L %{cursor_line},+1 %{buffer_name}}";
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
  xdg.configFile."helix/gitui.sh".text = ''
    ${pkgs.gitui}/bin/gitui
    exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
      ${pkgs.zellij}/bin/zellij action toggle-floating-panes
      ${pkgs.zellij}/bin/zellij action write-chars ":reload-all"
      ${pkgs.zellij}/bin/zellij action write 13 
    else
    	${pkgs.zellij}/bin/zellij action toggle-floating-panes
    fi
  '';
}
